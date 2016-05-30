/**
 * 
 */
package com.qinfenqi.mall.pay.util;

import org.joda.time.DateTime;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月13日 下午2:36:10
 * @author Chang Yuxin
 * @version 1.0
 */
public class PayStatementUtil {
	/**
	 * 
	 */
	public static String getPayStatement() {
		return DateTime.now().getMillis() + "";
	}
}
