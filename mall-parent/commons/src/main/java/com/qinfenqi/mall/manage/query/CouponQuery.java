/**
 * 
 */
package com.qinfenqi.mall.manage.query;

import com.qinfenqi.mall.manage.bean.Coupon;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月13日 上午10:12:18
 * @author Chang Yuxin
 * @version 1.0
 */
public class CouponQuery extends Coupon {
	private int status = 0;

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	
}
