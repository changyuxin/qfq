/**
 * 
 */
package com.qinfenqi.mall.pay.service;

import java.util.Map;
import java.util.SortedMap;

import com.qinfenqi.mall.pay.bean.PayLog;
import com.qinfenqi.mall.pay.bean.Payment;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月26日 上午9:50:20
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface WxpayService {

	/**
	 * @param billQuery
	 * @return
	 */
	Map<String, Object> createUnioOrder(Payment payment, String webroot, String domain );

	/**
	 * @param payment
	 * @return
	 */
	PayLog getPayLogByPayLogId(Payment payment);

	/**
	 * @param orderMap
	 * @return
	 */
	String checkPayResult(SortedMap<Object, Object> orderMap);


}
