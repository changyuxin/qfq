/**
 * 
 */
package com.qinfenqi.mall.product.service;

import java.util.List;

import com.qinfenqi.mall.product.bean.ServiceRate;
import com.qinfenqi.mall.product.query.ProductQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月1日 下午4:06:13
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface ServiceRateService {


	/**
	 * @param productQuery
	 * @param periodNumStarts
	 * @param periodNumEnds
	 * @param productRates
	 */
	void addProductRate(ProductQuery productQuery, String[] periodNumStarts, String[] periodNumEnds, String[] serviceRates);

	/**
	 * @param productQuery
	 * @return
	 */
	List<ServiceRate> getServiceRates(ProductQuery productQuery);

}
