/**
 * 
 */
package com.qinfenqi.mall.bill.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月12日 下午3:02:26
 * @author Chang Yuxin
 * @version 1.0
 */
public class Bill extends BaseBean{
	private long billId;
	private long userId;
	private long orderId;
	private int currentMonth;
	private int months;
	private double principal;
	private double servicePay;
	private double financialPay;
	private double lateFines;
	private int lateDays;
	private double monthPay;
	private Date paymentDate;
	private Date actualPaymentDate;
	private int paymentStatus;
	private String auditOpinion;
	/**
	 * @return the billId
	 */
	public long getBillId() {
		return billId;
	}
	/**
	 * @param billId the billId to set
	 */
	public void setBillId(long billId) {
		this.billId = billId;
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
	 * @return the principal
	 */
	public double getPrincipal() {
		return principal;
	}
	/**
	 * @param principal the principal to set
	 */
	public void setPrincipal(double principal) {
		this.principal = principal;
	}

	/**
	 * @return the servicePay
	 */
	public double getServicePay() {
		return servicePay;
	}
	/**
	 * @param servicePay the servicePay to set
	 */
	public void setServicePay(double servicePay) {
		this.servicePay = servicePay;
	}
	
	/**
	 * @return the financialPay
	 */
	public double getFinancialPay() {
		return financialPay;
	}
	/**
	 * @param financialPay the financialPay to set
	 */
	public void setFinancialPay(double financialPay) {
		this.financialPay = financialPay;
	}
	/**
	 * @return the lateFines
	 */
	public double getLateFines() {
		return lateFines;
	}
	/**
	 * @param lateFines the lateFines to set
	 */
	public void setLateFines(double lateFines) {
		this.lateFines = lateFines;
	}
	
	/**
	 * @return the lateDays
	 */
	public int getLateDays() {
		return lateDays;
	}
	/**
	 * @param lateDays the lateDays to set
	 */
	public void setLateDays(int lateDays) {
		this.lateDays = lateDays;
	}
	/**
	 * @return the monthPay
	 */
	public double getMonthPay() {
		return monthPay;
	}
	/**
	 * @param monthPay the monthPay to set
	 */
	public void setMonthPay(double monthPay) {
		this.monthPay = monthPay;
	}
	/**
	 * @return the paymentDate
	 */
	public Date getPaymentDate() {
		return paymentDate;
	}
	/**
	 * @param paymentDate the paymentDate to set
	 */
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	/**
	 * @return the actualPaymentDate
	 */
	public Date getActualPaymentDate() {
		return actualPaymentDate;
	}
	/**
	 * @param actualPaymentDate the actualPaymentDate to set
	 */
	public void setActualPaymentDate(Date actualPaymentDate) {
		this.actualPaymentDate = actualPaymentDate;
	}
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
	
	/**
	 * @return the auditOpinion
	 */
	public String getAuditOpinion() {
		return auditOpinion;
	}
	/**
	 * @param auditOpinion the auditOpinion to set
	 */
	public void setAuditOpinion(String auditOpinion) {
		this.auditOpinion = auditOpinion;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Bill [billId=" + billId + ", userId=" + userId + ", orderId=" + orderId + ", currentMonth="
				+ currentMonth + ", months=" + months + ", principal=" + principal + ", servicePay=" + servicePay + ", lateFines="
				+ lateFines + ", monthPay=" + monthPay + ", paymentDate=" + paymentDate + ", actualPaymentDate=" + actualPaymentDate
				+ ", paymentStatus=" + paymentStatus + "]";
	}
	
}
