/**
 * 
 */
package com.qinfenqi.mall.product.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.product.bean.ServiceRate;
import com.qinfenqi.mall.product.bean.ProductRateCache;
import com.qinfenqi.mall.product.dao.ServiceRateDao;
import com.qinfenqi.mall.product.query.ProductQuery;
import com.qinfenqi.mall.product.service.ServiceRateService;
import com.qinfenqi.mall.util.NumberUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月1日 下午4:06:35
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("productRateService")
public class ServiceRateServiceImpl implements ServiceRateService {

	protected Logger logger = LoggerFactory.getLogger(ServiceRateServiceImpl.class);
	@Resource
	private ServiceRateDao serviceRateDao;

	// @Resource
	// private RedisClient redisClient;

	@Override
	public void addProductRate(ProductQuery productQuery, String[] periodNumStarts, String[] periodNumEnds, String[] serviceRate) {
		if (null == periodNumStarts && null == periodNumEnds) {
			serviceRateDao.delProductRates(productQuery.getProductId());
		} else {
			if (periodNumStarts.length == periodNumEnds.length) {
				List<ServiceRate> list = new ArrayList<ServiceRate>();
				serviceRateDao.delProductRates(productQuery.getProductId());
				if (periodNumStarts.length > 0 && periodNumEnds.length > 0) {
					for (int i = 0; i < periodNumStarts.length; i++) {
						ServiceRate sr = new ServiceRate();
						sr.setProductId(productQuery.getProductId());
						sr.setPeriodNumStart(Integer.parseInt(periodNumStarts[i]));
						sr.setPeriodNumEnd(Integer.parseInt(periodNumEnds[i]));
						sr.setServiceRate(Float.parseFloat(serviceRate[i]));
						list.add(sr);
					}
					serviceRateDao.addProductRates(list);
					cacheProductRatesMemory(list, productQuery.getProductId());
				}
			}
		}
	}

	/**
	 * @param list
	 * @param productId
	 */
	protected void cacheProductRatesMemory(List<ServiceRate> list, int productId) {
		List<ProductRateCache> caches = new ArrayList<ProductRateCache>();
		serviceRateDao.deleteProductRateCaches(productId);
		for (ServiceRate serviceRate : list) {
			for (int i = serviceRate.getPeriodNumStart(); i <= serviceRate.getPeriodNumEnd(); i++) {
				caches.add(new ProductRateCache(productId, productId + Symbol.UNDER_LINE + i, NumberUtil.formatDouble(serviceRate.getServiceRate())));
			}
		}
		serviceRateDao.addProductRateCaches(caches);
	}

	/**
	 * @param list
	 */
	// protected void cacheProductRatesRedis(List<ProductRate> list) {
	// Jedis jedis = redisClient.getJedis();
	// Pipeline pipe = jedis.pipelined();
	//
	// for (ProductRate productRate : list) {
	// for (int i = productRate.getPeriodNumStart(); i <= productRate.getPeriodNumEnd(); i++) {
	// pipe.set(productRate.getProductId() + Symbol.UNDER_LINE + i, NumberUtil.formatDouble(productRate.getProductRate()));
	// }
	// }
	// pipe.sync();
	// redisClient.releaseConnection(jedis);
	// }

	@Override
	public List<ServiceRate> getServiceRates(ProductQuery productQuery) {
		return serviceRateDao.getServiceRates(productQuery.getProductId());
	}
}
