/**
 * 
 */
package com.qinfenqi.mall.manage.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月9日 下午4:57:21
 * @author Chang Yuxin
 * @version 1.0
 */
public class Coupon extends BaseBean {

	private long couponId;
	private String couponName;
	private long couponSums;
	private int couponTotal;
	private int userDraw;
	private int couponType;
	private Date startTime;
	private Date endTime;
	private int isEnable;
	private Date createTime;
	/**
	 * @return the couponId
	 */
	public long getCouponId() {
		return couponId;
	}
	/**
	 * @param couponId the couponId to set
	 */
	public void setCouponId(long couponId) {
		this.couponId = couponId;
	}
	/**
	 * @return the couponName
	 */
	public String getCouponName() {
		return couponName;
	}
	/**
	 * @param couponName the couponName to set
	 */
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	/**
	 * @return the couponSums
	 */
	public long getCouponSums() {
		return couponSums;
	}
	/**
	 * @param couponSums the couponSums to set
	 */
	public void setCouponSums(long couponSums) {
		this.couponSums = couponSums;
	}
	/**
	 * @return the couponTotal
	 */
	public int getCouponTotal() {
		return couponTotal;
	}
	/**
	 * @param couponTotal the couponTotal to set
	 */
	public void setCouponTotal(int couponTotal) {
		this.couponTotal = couponTotal;
	}
	
	/**
	 * @return the userDraw
	 */
	public int getUserDraw() {
		return userDraw;
	}
	/**
	 * @param userDraw the userDraw to set
	 */
	public void setUserDraw(int userDraw) {
		this.userDraw = userDraw;
	}
	/**
	 * @return the startTime
	 */
	public Date getStartTime() {
		return startTime;
	}
	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	/**
	 * @return the endTime
	 */
	public Date getEndTime() {
		return endTime;
	}
	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	/**
	 * @return the isEnable
	 */
	public int getIsEnable() {
		return isEnable;
	}
	/**
	 * @param isEnable the isEnable to set
	 */
	public void setIsEnable(int isEnable) {
		this.isEnable = isEnable;
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
	/**
	 * @return the couponType
	 */
	public int getCouponType() {
		return couponType;
	}
	/**
	 * @param couponType the couponType to set
	 */
	public void setCouponType(int couponType) {
		this.couponType = couponType;
	}
	
}
