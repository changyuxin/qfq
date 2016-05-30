/**
 * 
 */
package com.qinfenqi.mall.order.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月6日 上午11:50:59
 * @author Chang Yuxin
 * @version 1.0 
 */
public class Order extends BaseBean{
	private long orderId;
	private long userId;
	private String orderCode;
	private int orderStatus;
	private int productId;
	private double monthPay;
	private int months;
	private int quantity;
	private double firstPay;
	private int firstPayStatus;
	private int paymentStatus;
	private double productPrice;
	private double serviceRate;
	private double servicePay;
	private double financialRate;
	private double financialPay;
	private String productName;
	private String productImei;
	private String productCovimg;
	private double orderTotal;
	private int deliverStatus;
	private Date deliverTime;
	private String deliverName;
	private String deliverCode;
	private double returnId;
	private String receiveName;
	private String receiveAddress;
	private String receiveZip;
	private String receivePhone;
	private String receiveMobile;
	private double paymentId;
	private String paymentCode;
	private String recommendCode;
	
	private Date createTime;
	private Date finishTime;
	private String auditOpinion;
	private String opLog;
	private Date updateTime;
	
	private int orderTypes;
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
	 * @return the orderCode
	 */
	public String getOrderCode() {
		return orderCode;
	}
	/**
	 * @param orderCode the orderCode to set
	 */
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	/**
	 * @return the orderStatus
	 */
	public int getOrderStatus() {
		return orderStatus;
	}
	/**
	 * @param orderStatus the orderStatus to set
	 */
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}
	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
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
	 * @return the firstPayStatus
	 */
	public int getFirstPayStatus() {
		return firstPayStatus;
	}
	/**
	 * @param firstPayStatus the firstPayStatus to set
	 */
	public void setFirstPayStatus(int firstPayStatus) {
		this.firstPayStatus = firstPayStatus;
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
	 * @return the deliverStatus
	 */
	public int getDeliverStatus() {
		return deliverStatus;
	}
	/**
	 * @param deliverStatus the deliverStatus to set
	 */
	public void setDeliverStatus(int deliverStatus) {
		this.deliverStatus = deliverStatus;
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
	 * @return the orderTotal
	 */
	public double getOrderTotal() {
		return orderTotal;
	}
	/**
	 * @param orderTotal the orderTotal to set
	 */
	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
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
	 * @return the finishTime
	 */
	public Date getFinishTime() {
		return finishTime;
	}
	/**
	 * @param finishTime the finishTime to set
	 */
	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	/**
	 * @return the deliverTime
	 */
	public Date getDeliverTime() {
		return deliverTime;
	}
	/**
	 * @param deliverTime the deliverTime to set
	 */
	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
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
	 * @return the returnId
	 */
	public double getReturnId() {
		return returnId;
	}
	/**
	 * @param returnId the returnId to set
	 */
	public void setReturnId(double returnId) {
		this.returnId = returnId;
	}
	/**
	 * @return the receiveName
	 */
	public String getReceiveName() {
		return receiveName;
	}
	/**
	 * @param receiveName the receiveName to set
	 */
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	/**
	 * @return the receiveAddress
	 */
	public String getReceiveAddress() {
		return receiveAddress;
	}
	/**
	 * @param receiveAddress the receiveAddress to set
	 */
	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}
	/**
	 * @return the receiveZip
	 */
	public String getReceiveZip() {
		return receiveZip;
	}
	/**
	 * @param receiveZip the receiveZip to set
	 */
	public void setReceiveZip(String receiveZip) {
		this.receiveZip = receiveZip;
	}
	/**
	 * @return the receivePhone
	 */
	public String getReceivePhone() {
		return receivePhone;
	}
	/**
	 * @param receivePhone the receivePhone to set
	 */
	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}
	/**
	 * @return the receiveMobile
	 */
	public String getReceiveMobile() {
		return receiveMobile;
	}
	/**
	 * @param receiveMobile the receiveMobile to set
	 */
	public void setReceiveMobile(String receiveMobile) {
		this.receiveMobile = receiveMobile;
	}
	/**
	 * @return the paymentId
	 */
	public double getPaymentId() {
		return paymentId;
	}
	/**
	 * @param paymentId the paymentId to set
	 */
	public void setPaymentId(double paymentId) {
		this.paymentId = paymentId;
	}
	/**
	 * @return the paymentCode
	 */
	public String getPaymentCode() {
		return paymentCode;
	}
	/**
	 * @param paymentCode the paymentCode to set
	 */
	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}
	/**
	 * @return the recommendCode
	 */
	public String getRecommendCode() {
		return recommendCode;
	}
	/**
	 * @param recommendCode the recommendCode to set
	 */
	public void setRecommendCode(String recommendCode) {
		this.recommendCode = recommendCode;
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
	 * @return the productCovimg
	 */
	public String getProductCovimg() {
		return productCovimg;
	}
	/**
	 * @param productCovimg the productCovimg to set
	 */
	public void setProductCovimg(String productCovimg) {
		this.productCovimg = productCovimg;
	}
	/**
	 * @return the deliverName
	 */
	public String getDeliverName() {
		return deliverName;
	}
	/**
	 * @param deliverName the deliverName to set
	 */
	public void setDeliverName(String deliverName) {
		this.deliverName = deliverName;
	}
	/**
	 * @return the deliverCode
	 */
	public String getDeliverCode() {
		return deliverCode;
	}
	/**
	 * @param deliverCode the deliverCode to set
	 */
	public void setDeliverCode(String deliverCode) {
		this.deliverCode = deliverCode;
	}
	/**
	 * @return the productImei
	 */
	public String getProductImei() {
		return productImei;
	}
	/**
	 * @param productImei the productImei to set
	 */
	public void setProductImei(String productImei) {
		this.productImei = productImei;
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
	/**
	 * @return the opLog
	 */
	public String getOpLog() {
		return opLog;
	}
	/**
	 * @param opLog the opLog to set
	 */
	public void setOpLog(String opLog) {
		this.opLog = opLog;
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
	 * @return the updateTime
	 */
	public Date getUpdateTime() {
		return updateTime;
	}
	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * @return the orderTypes
	 */
	public int getOrderTypes() {
		return orderTypes;
	}
	/**
	 * @param orderTypes the orderTypes to set
	 */
	public void setOrderTypes(int orderTypes) {
		this.orderTypes = orderTypes;
	}
	
}
