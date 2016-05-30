/**
 * 
 */
package com.qinfenqi.mall.member.bean;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2016年5月14日 下午6:21:37
 * @author Sun Xiang
 * @version 1.0 
 */
public class MemberCredit {
	private long orderId;
	/** 用户ID */
	private long userId;
	private int currentMonth;
	private int months;
	private int paymentStatus;
	/**
	 * @return the paymentStatus
	 */
	public int getPaymentStatus() {
		return paymentStatus;
	}
	/**
	 * @param paymentStatus the paymentStatus to set
	 */
	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	private double sumMonthPay;
	/**
	 * @return the orderId
	 */
	public long getOrderId() {
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(long orderId) {
		this.orderId = orderId;
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
	 * @return the currentMonth
	 */
	public int getCurrentMonth() {
		return currentMonth;
	}
	/**
	 * @param currentMonth the currentMonth to set
	 */
	public void setCurrentMonth(int currentMonth) {
		this.currentMonth = currentMonth;
	}
	/**
	 * @return the months
	 */
	public int getMonths() {
		return months;
	}
	/**
	 * @param months the months to set
	 */
	public void setMonths(int months) {
		this.months = months;
	}
	/**
	 * @return the sumMonthPay
	 */
	public double getSumMonthPay() {
		return sumMonthPay;
	}
	/**
	 * @param sumMonthPay the sumMonthPay to set
	 */
	public void setSumMonthPay(double sumMonthPay) {
		this.sumMonthPay = sumMonthPay;
	}
	/**
	 * @return the creditLimit
	 */
	public double getCreditLimit() {
		return creditLimit;
	}
	/**
	 * @param creditLimit the creditLimit to set
	 */
	public void setCreditLimit(double creditLimit) {
		this.creditLimit = creditLimit;
	}
	/**
	 * @return the usedCreditLimit
	 */
	public double getUsedCreditLimit() {
		return usedCreditLimit;
	}
	/**
	 * @param usedCreditLimit the usedCreditLimit to set
	 */
	public void setUsedCreditLimit(double usedCreditLimit) {
		this.usedCreditLimit = usedCreditLimit;
	}
	private double creditLimit;
	private double usedCreditLimit;

}
