/**
 * 
 */
package com.qinfenqi.mall.pay.service;

import java.util.Map;

import com.qinfenqi.mall.pay.bean.Payment;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月27日 上午11:30:37
 * @author Chang Yuxin
 * @version 1.0
 */
public interface AlipayService {

	/**
	 * @param payment
	 * @return
	 */
	String buildRequest(Payment payment);

	/**
	 * @param params
	 */
	boolean savePayRecord(Map<String, String> params);
}
