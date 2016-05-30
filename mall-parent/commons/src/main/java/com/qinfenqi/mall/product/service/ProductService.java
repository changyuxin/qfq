/**
 * 
 */
package com.qinfenqi.mall.product.service;

import java.util.List;

import com.qinfenqi.mall.product.bean.Product;
import com.qinfenqi.mall.product.bean.ProductColor;
import com.qinfenqi.mall.product.bean.ProductList;
import com.qinfenqi.mall.product.bean.ProductSpec;
import com.qinfenqi.mall.product.query.ProductQuery;
import com.qinfenqi.mall.system.bean.User;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 上午10:02:45
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface ProductService {

	/**
	 * @param productQuery
	 * @return
	 */
	List<ProductQuery> getProductList(ProductQuery productQuery);

	/**
	 * @param product
	 */
	void addProduct(ProductQuery productQuery);

	/**
	 * @param product
	 */
	void editProduct(ProductQuery productQuery);

	/**
	 * @param productQuery
	 * @return
	 */
	boolean deleteProduct(ProductQuery productQuery);

	/**
	 * @param productId
	 * @return
	 */
	Product getProductById(int productId);

	/**
	 * @param productQuery
	 */
	void editProductCover(ProductQuery productQuery);

	/**
	 * @param productQuery
	 * @return
	 */
	ProductQuery getProductDetailById(ProductQuery productQuery, User user);

	/**
	 * @param productQuery
	 * @param productNum
	 * @return
	 */
	List<ProductQuery> getProductListByCategoryId(ProductQuery productQuery, int productNum, User user);

	/**
	 * @param brandId 
	 * @return
	 */
	List<ProductList> getProdsByBrandId(int brandId);

	/**
	 * @return
	 */
	List<ProductColor> getColors();

	/**
	 * @return
	 */
	List<ProductSpec> getSpecs();

	/**
	 * @param productPid
	 * @return
	 */
	List<ProductColor> getProductColors(int productPid);

	/**
	 * @param productPid
	 * @return
	 */
	List<ProductSpec> getProductSpecs(int productPid);

	/**
	 * @param productQuery
	 * @return
	 */
	ProductQuery queryProduct(ProductQuery productQuery);

	/**
	 * @return
	 */
	int getProductCode();

	/**
	 * @param productQuery
	 * @return
	 */
	ProductQuery cacuMonthPay(ProductQuery productQuery, User user);

	/**
	 * @param productQuery
	 * @return
	 */
	List<ProductQuery> getProdListByCid(ProductQuery productQuery);

	/**
	 * @param productQuery
	 * @return
	 */
	List<ProductQuery> getProductListByCon(ProductQuery productQuery, User user);

	/**
	 * @param productQuery
	 * @return
	 */
	int getProductCount(ProductQuery productQuery);

	/**
	 * @param productQuery
	 * @return
	 */
	List<ProductQuery> getRecommends(ProductQuery productQuery, User user);

}
