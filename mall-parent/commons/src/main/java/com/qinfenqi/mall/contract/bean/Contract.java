/**
 * 
 */
package com.qinfenqi.mall.contract.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月9日 下午1:25:44
 * @author Chang Yuxin
 * @version 1.0 
 */
public class Contract extends BaseBean{
	private long contractId;
	private long orderId;
	private long userId;
	private String code;
	private String belong;
	private Date deadLine;
	private Date createTime;
	
	private String idCard;
	private String phone;
	private String productName;
	private double serviceRate;
	private double financialRate;
	private int quantity;
	private double productPrice;
	private double firstPay;
	private int months;
	private double monthPay;
	private int paymentDay;
	private int contractStatus;
	
	/**
	 * @return the contractId
	 */
	public long getContractId() {
		return contractId;
	}
	/**
	 * @param contractId the contractId to set
	 */
	public void setContractId(long contractId) {
		this.contractId = contractId;
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
	 * @return the code
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return the belong
	 */
	public String getBelong() {
		return belong;
	}
	/**
	 * @param belong the belong to set
	 */
	public void setBelong(String belong) {
		this.belong = belong;
	}
	/**
	 * @return the deadLine
	 */
	public Date getDeadLine() {
		return deadLine;
	}
	/**
	 * @param deadLine the deadLine to set
	 */
	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
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
	 * @return the idCard
	 */
	public String getIdCard() {
		return idCard;
	}
	/**
	 * @param idCard the idCard to set
	 */
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	/**
	 * @return the serviceRate
	 */
	public double getServiceRate() {
		return serviceRate;
	}
	/**
	 * @param serviceRate the serviceRate to set
	 */
	public void setServiceRate(double serviceRate) {
		this.serviceRate = serviceRate;
	}
	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	/**
	 * @return the productPrice
	 */
	public double getProductPrice() {
		return productPrice;
	}
	/**
	 * @param productPrice the productPrice to set
	 */
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
	/**
	 * @return the firstPay
	 */
	public double getFirstPay() {
		return firstPay;
	}
	/**
	 * @param firstPay the firstPay to set
	 */
	public void setFirstPay(double firstPay) {
		this.firstPay = firstPay;
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
	 * @return the paymentDay
	 */
	public int getPaymentDay() {
		return paymentDay;
	}
	/**
	 * @param paymentDay the paymentDay to set
	 */
	public void setPaymentDay(int paymentDay) {
		this.paymentDay = paymentDay;
	}
	/**
	 * @return the contractStatus
	 */
	public int getContractStatus() {
		return contractStatus;
	}
	/**
	 * @param contractStatus the contractStatus to set
	 */
	public void setContractStatus(int contractStatus) {
		this.contractStatus = contractStatus;
	}
	/**
	 * @return the financialRate
	 */
	public double getFinancialRate() {
		return financialRate;
	}
	/**
	 * @param financialRate the financialRate to set
	 */
	public void setFinancialRate(double financialRate) {
		this.financialRate = financialRate;
	}
	
}
