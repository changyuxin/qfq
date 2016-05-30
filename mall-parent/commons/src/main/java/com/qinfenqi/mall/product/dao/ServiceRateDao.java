/**
 * 
 */
package com.qinfenqi.mall.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.DefaultRate;
import com.qinfenqi.mall.product.bean.ServiceRate;
import com.qinfenqi.mall.product.bean.ProductRateCache;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月1日 下午4:07:55
 * @author Chang Yuxin
 * @version 1.0 
 */
@Repository
public interface ServiceRateDao {

	/**
	 * @param list
	 * @return 
	 */
	boolean addProductRates(List<ServiceRate> list);

	/**
	 * @param productId
	 */
	boolean delProductRates(int productId);

	/**
	 * @param getProductId
	 * @return
	 */
	List<ServiceRate> getServiceRates(int getProductId);

	/**
	 * @return
	 */
	List<ServiceRate> getAllProductRates();

	/**
	 * @return
	 */
	List<DefaultRate> getDefaultRates();

	/**
	 * @param caches
	 */
	boolean addProductRateCaches(List<ProductRateCache> caches);

	/**
	 * @param productId
	 */
	boolean delProductRateCaches(int productId);

	/**
	 * @return
	 */
	List<ProductRateCache> getProductRateCaches();

	/**
	 * @param rateKey
	 * @return
	 */
	String getProductRateCacheByKey(String rateKey);

	/**
	 * @param productId
	 */
	void deleteProductRateCaches(int productId);

}
