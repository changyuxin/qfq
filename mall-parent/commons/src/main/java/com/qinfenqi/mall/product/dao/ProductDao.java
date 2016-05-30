/**
 * 
 */
package com.qinfenqi.mall.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.product.bean.Product;
import com.qinfenqi.mall.product.bean.ProductColor;
import com.qinfenqi.mall.product.bean.ProductList;
import com.qinfenqi.mall.product.bean.ProductSpec;
import com.qinfenqi.mall.product.query.ProductQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 下午2:50:29
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface ProductDao {

	/**
	 * @param productQuery 
	 * @return 
	 */
	List<ProductQuery> getProductList(ProductQuery productQuery);

	/**
	 * @param product
	 */
	void addProduct(Product product);

	/**
	 * @param productId
	 * @return
	 */
	boolean deleteProduct(int productId);

	/**
	 * @param productId
	 * @return
	 */
	Product getProductById(int productId);

	/**
	 * @param productQuery
	 */
	void editProduct(ProductQuery productQuery);
	/**
	 * @param productQuery
	 */
	void editProductCover(ProductQuery productQuery);

	/**
	 * @param productQuery
	 * @return
	 */
	List<ProductQuery> getProductListByCategoryId(ProductQuery productQuery);

	/**
	 * @param productQuery
	 * @return
	 */
	List<ProductQuery> getProductDetailById(ProductQuery productQuery);

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
	 * @param productPid 
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
	int queryProductCode();

	/**
	 * @param i
	 */
	void updateProductCode(int i);

	/**
	 * @param productQuery
	 * @return
	 */
	List<ProductQuery> getProductListByCon(ProductQuery productQuery);

	/**
	 * @param productQuery
	 * @return
	 */
	int getProductCount(ProductQuery productQuery);

	/**
	 * @param productQuery
	 * @return
	 */
	List<ProductQuery> getRecommends(ProductQuery productQuery);

}
