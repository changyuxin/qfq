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
public class CouponRecord extends BaseBean {

	private long recordId;
	private long userId;
	private long couponId;
	private String couponName;
	private long couponSums;
	private int couponType;
	private Date startTime;
	private Date endTime;
	private int status;
	private Date createTime;
	/**
	 * @return the recordId
	 */
	public long getRecordId() {
		return recordId;
	}
	/**
	 * @param recordId the recordId to set
	 */
	public void setRecordId(long recordId) {
		this.recordId = recordId;
	}
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
