/**
 * 
 */
package com.qinfenqi.mall.bill.quartz;

import java.text.ParseException;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月11日 下午3:23:11
 * @author Chang Yuxin
 * @version 1.0
 */
public interface BillQuartzService {

	void updateBillFines() throws ParseException;

	void billSMSNotify();
}
