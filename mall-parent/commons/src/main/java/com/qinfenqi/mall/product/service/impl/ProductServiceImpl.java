/**
 * 
 */
package com.qinfenqi.mall.product.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import jodd.cache.Cache;
import jodd.cache.LRUCache;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import com.qinfenqi.mall.bean.DefaultRate;
import com.qinfenqi.mall.common.constant.CacheKey;
import com.qinfenqi.mall.common.constant.Constant;
import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.product.bean.Product;
import com.qinfenqi.mall.product.bean.ProductColor;
import com.qinfenqi.mall.product.bean.ProductList;
import com.qinfenqi.mall.product.bean.ProductSpec;
import com.qinfenqi.mall.product.dao.ProductDao;
import com.qinfenqi.mall.product.dao.ServiceRateDao;
import com.qinfenqi.mall.product.query.ProductQuery;
import com.qinfenqi.mall.product.service.ProductService;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.util.NumberUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 上午10:59:58
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("productService")
public class ProductServiceImpl implements ProductService, InitializingBean {

	private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	private Map<String, Double> DEFAULT_RATE_MAP = new HashMap<String, Double>();
	private Cache<String, String> CACHE = new LRUCache<String, String>(1000);
	@Resource
	private ProductDao productDao;
	@Resource
	private ServiceRateDao serviceRateDao;

	// @Resource
	// private RedisClient redisClient;

	@Override
	public void afterPropertiesSet() throws Exception {
		List<DefaultRate> list = serviceRateDao.getDefaultRates();
		if (list.size() > 0) {
			for (DefaultRate rate : list) {
				for (int i = rate.getPeriodNumStart(); i <= rate.getPeriodNumEnd(); i++) {
					DEFAULT_RATE_MAP.put(String.valueOf(i), rate.getServiceRate());
				}
			}
		}
		logger.info("Product default rate initialization successfully!.............！" + DEFAULT_RATE_MAP);
	}

	@Override
	public List<ProductQuery> getProductList(ProductQuery productQuery) {
		List<ProductQuery> list = new ArrayList<ProductQuery>();
		if (null == productQuery) {
			productQuery = new ProductQuery();
		}
		list = productDao.getProductList(productQuery);
		return list;
	}

	@Override
	public void addProduct(ProductQuery productQuery) {
		String[] categoryIds = productQuery.getCategoryIds().split("-");
		productQuery.setPcategoryId(Integer.parseInt(categoryIds[0]));
		productQuery.setCategoryId(Integer.parseInt(categoryIds[1]));
		productDao.addProduct(productQuery);
	}

	@Override
	public void editProduct(ProductQuery productQuery) {
		String[] categoryIds = productQuery.getCategoryIds().split("-");
		productQuery.setPcategoryId(Integer.parseInt(categoryIds[0]));
		productQuery.setCategoryId(Integer.parseInt(categoryIds[1]));
		productDao.editProduct(productQuery);

	}

	@Override
	public boolean deleteProduct(ProductQuery productQuery) {
		return productDao.deleteProduct(productQuery.getProductId());
	}

	@Override
	public Product getProductById(int productId) {
		return productDao.getProductById(productId);
	}

	@Override
	public void editProductCover(ProductQuery productQuery) {
		productDao.editProductCover(productQuery);
	}

	@Override
	public ProductQuery getProductDetailById(ProductQuery productQuery, User user) {
		int months = productQuery.getMonths();
		double firstPay = productQuery.getFirstPay();
		List<ProductQuery> list = productDao.getProductDetailById(productQuery);
		for (ProductQuery pq : list) {
			pq.setMonths(months);
			pq.setFirstPay(firstPay);
		}
		dealProdcutRate(list, user);
		ProductQuery prodQuery = list.get(0);
		productQuery.setProductImgs(HtmlUtils.htmlEscape(prodQuery.getProductImgs()));
		return prodQuery;
	}

	@Override
	public List<ProductQuery> getProductListByCategoryId(ProductQuery productQuery, int productNum, User user) {
		List<ProductQuery> list = new ArrayList<ProductQuery>();
		list = productDao.getProductListByCategoryId(productQuery);
		if (list.size() > productNum && productNum > 0) {
			list = list.subList(0, productNum);
		}
		dealProdcutRate(list, user);
		
		// 产品ID降序排列
		// Collections.sort(list);
		return list;
	}

	public void dealProdcutRate(List<ProductQuery> list, User user) {
		for (ProductQuery product : list) {
			cacuMoneyByRate(product, product.getMonths(), user);
		}
	}

	/**
	 * @param product
	 * @param rateMap
	 * @param month
	 */
	public void cacuMoneyByRate(ProductQuery product, int month, User user) {
		double salePrice = product.getSalePrice() - product.getFirstPay();
		double serviceRate = 0;

		// String rateKey = CacheKey.PRODUCT_RATE_PREFIX + product.getProductId() + Symbol.UNDER_LINE + month;
		// Jedis jedis = redisClient.getJedis();
		// String rateStr = jedis.get(rateKey);

		String rateKey = product.getProductId() + Symbol.UNDER_LINE + month;
		String rateStr = null;
		String cacheKey = CacheKey.PRODUCT_RATE_PREFIX + rateKey;
		if (CACHE.get(cacheKey) != null) {
			rateStr = (String) CACHE.get(cacheKey);
		} else {
			rateStr = serviceRateDao.getProductRateCacheByKey(rateKey);
			if(null != rateStr){
				CACHE.put(cacheKey, rateStr, Constant.CACHE_TIME);
			}
		}

		// 获取商品服务费率
		if (null != rateStr) {
			serviceRate = Double.parseDouble(rateStr);
		}
		// 如果未获取到商品服务费率,则判断是否使用默认商品服务费率
		else {
			serviceRate = DEFAULT_RATE_MAP.get(String.valueOf(month));
			CACHE.put(cacheKey, serviceRate + "", Constant.CACHE_TIME);
		}
		double monthPay = salePrice / month + salePrice * serviceRate;
		double financialPay = 0;
		
		// 增加白领服务费计算
		if(null != user && user.getUserStyle() == 2){
			financialPay = salePrice * Constant.FINANCIAL_RATE_FOR_COLLAR;
			monthPay += financialPay;
			product.setFinancialRate(Constant.FINANCIAL_RATE_FOR_COLLAR);
			product.setFinancialPay(financialPay);
		}
		
		product.setServiceRate(serviceRate);
		product.setMonthPay(NumberUtil.formatDouble(monthPay, NumberUtil.DOT_LAST_TWO));
		product.setPrincipal(NumberUtil.formatDouble(salePrice / month, NumberUtil.DOT_LAST_TWO));
		product.setServicePay(NumberUtil.formatDouble(salePrice * serviceRate, NumberUtil.DOT_LAST_TWO));
	}

	@Override
	public ProductQuery cacuMonthPay(ProductQuery product, User user) {
		product.setSalePrice(product.getSalePrice());
		cacuMoneyByRate(product, product.getMonths(), user);
		return product;
	}

	@Override
	public List<ProductList> getProdsByBrandId(int brandId) {
		return productDao.getProdsByBrandId(brandId);
	}

	@Override
	public List<ProductColor> getColors() {
		return productDao.getColors();
	}

	@Override
	public List<ProductSpec> getSpecs() {
		return productDao.getSpecs();
	}

	@Override
	public List<ProductColor> getProductColors(int productPid) {
		return productDao.getProductColors(productPid);
	}

	@Override
	public List<ProductSpec> getProductSpecs(int productPid) {
		return productDao.getProductSpecs(productPid);
	}

	@Override
	public ProductQuery queryProduct(ProductQuery productQuery) {
		return productDao.queryProduct(productQuery);
	}

	@Override
	public int getProductCode() {
		return productDao.queryProductCode();
	}

	@Override
	public List<ProductQuery> getProdListByCid(ProductQuery productQuery) {
		return null;
	}

	@Override
	public List<ProductQuery> getProductListByCon(ProductQuery productQuery, User user) {
		productQuery.setProductName(handleCondtion(productQuery.getKeyword()));
		List<ProductQuery> productList = productDao.getProductListByCon(productQuery);
		dealProdcutRate(productList, user);
		return productList;
	}

	/**
	 * @param keyword
	 * @return
	 */
	private String handleCondtion(String keyword) {
		StringBuffer buffer = new StringBuffer();
		if (null != keyword) {
			buffer.append("%");
			String[] arr = keyword.split(" ");
			for (int i = 0; i < arr.length; i++) {
				buffer.append(arr[i]).append("%");
			}
		}
		return buffer.toString();
	}

	@Override
	public int getProductCount(ProductQuery productQuery) {
		return productDao.getProductCount(productQuery);
	}

	@Override
	public List<ProductQuery> getRecommends(ProductQuery productQuery, User user) {
		List<ProductQuery> list = new ArrayList<ProductQuery>();
		list = productDao.getRecommends(productQuery);
		dealProdcutRate(list, user);
		return list;
	}

}
