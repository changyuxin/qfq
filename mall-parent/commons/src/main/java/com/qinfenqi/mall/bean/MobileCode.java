/**
 * 
 */
package com.qinfenqi.mall.bean;

import java.util.Date;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月5日 下午2:42:38
 * @author Chang Yuxin
 * @version 1.0 
 */
public class MobileCode {
	private double mobile;
	private int code;
	private Date createTime;
	/**
	 * @return the mobile
	 */
	public double getMobile() {
		return mobile;
	}
	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(double mobile) {
		this.mobile = mobile;
	}
	/**
	 * @return the code
	 */
	public int getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(int code) {
		this.code = code;
	}
	/**
	 * @return the createTime
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
