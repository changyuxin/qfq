/**
 * 
 */
package com.qinfenqi.mall.bean;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月26日 上午9:42:35
 * @author Chang Yuxin
 * @version 1.0 
 */
public class Wxuser {
	private long userId;
	private String openId;
	private String isSubscribe;
	/**
	 * @return the userId
	 */
	public long getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(long userId) {
		this.userId = userId;
	}
	/**
	 * @return the openId
	 */
	public String getOpenId() {
		return openId;
	}
	/**
	 * @param openId the openId to set
	 */
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	/**
	 * @return the isSubscribe
	 */
	public String getIsSubscribe() {
		return isSubscribe;
	}
	/**
	 * @param isSubscribe the isSubscribe to set
	 */
	public void setIsSubscribe(String isSubscribe) {
		this.isSubscribe = isSubscribe;
	}
	
}
