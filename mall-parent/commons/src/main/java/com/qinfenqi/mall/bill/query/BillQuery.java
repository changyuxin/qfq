/**
 * 
 */
package com.qinfenqi.mall.bill.query;

import java.util.Date;

import com.qinfenqi.mall.bill.bean.Bill;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月12日 下午5:31:23
 * @author Chang Yuxin
 * @version 1.0 
 */
public class BillQuery extends Bill{
	private int isCurrPayDate;
	
	private String orderCode;
	private String productName;
	private Date orderTime;
	private String username;
	private String trueName;
	
	private String currentDay;
	private String nextDay;
	private String thirdDay;
	private String yesterday;
	private String beforeYesterday;
	
	private String deliverName;
	private String receiveName;
	
	
	private String indexstatus;
	
	private int userStyle;
	
	// 最后一期的标识 1:最后，2不是最后	
	private int theLast;
	
	private int tradeType;// 1:bill,2:first_pay

	/**
	 * @return the isCurrPayDate
	 */
	public int getIsCurrPayDate() {
		return isCurrPayDate;
	}

	/**
	 * @param isCurrPayDate the isCurrPayDate to set
	 */
	public void setIsCurrPayDate(int isCurrPayDate) {
		this.isCurrPayDate = isCurrPayDate;
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
	 * @return the orderTime
	 */
	public Date getOrderTime() {
		return orderTime;
	}

	/**
	 * @param orderTime the orderTime to set
	 */
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	/**
	 * @return the indexstatus
	 */
	public String getIndexstatus() {
		return indexstatus;
	}

	/**
	 * @param indexstatus the indexstatus to set
	 */
	public void setIndexstatus(String indexstatus) {
		this.indexstatus = indexstatus;
	}

	/**
	 * @return the nextDay
	 */
	public String getNextDay() {
		return nextDay;
	}

	/**
	 * @param nextDay the nextDay to set
	 */
	public void setNextDay(String nextDay) {
		this.nextDay = nextDay;
	}

	/**
	 * @return the thirdDay
	 */
	public String getThirdDay() {
		return thirdDay;
	}

	/**
	 * @param thirdDay the thirdDay to set
	 */
	public void setThirdDay(String thirdDay) {
		this.thirdDay = thirdDay;
	}

	/**
	 * @return the currentDay
	 */
	public String getCurrentDay() {
		return currentDay;
	}

	/**
	 * @param currentDay the currentDay to set
	 */
	public void setCurrentDay(String currentDay) {
		this.currentDay = currentDay;
	}

	/**
	 * @return the trueName
	 */
	public String getTrueName() {
		return trueName;
	}

	/**
	 * @param trueName the trueName to set
	 */
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the userStyle
	 */
	public int getUserStyle() {
		return userStyle;
	}

	/**
	 * @param userStyle the userStyle to set
	 */
	public void setUserStyle(int userStyle) {
		this.userStyle = userStyle;
	}

	/**
	 * @return the yesterday
	 */
	public String getYesterday() {
		return yesterday;
	}

	/**
	 * @param yesterday the yesterday to set
	 */
	public void setYesterday(String yesterday) {
		this.yesterday = yesterday;
	}

	/**
	 * @return the beforeYesterday
	 */
	public String getBeforeYesterday() {
		return beforeYesterday;
	}

	/**
	 * @param beforeYesterday the beforeYesterday to set
	 */
	public void setBeforeYesterday(String beforeYesterday) {
		this.beforeYesterday = beforeYesterday;
	}

	/**
	 * @return the theLast
	 */
	public int getTheLast() {
		return theLast;
	}

	/**
	 * @param theLast the theLast to set
	 */
	public void setTheLast(int theLast) {
		this.theLast = theLast;
	}

	/**
	 * @return the tradeType
	 */
	public int getTradeType() {
		return tradeType;
	}

	/**
	 * @param tradeType the tradeType to set
	 */
	public void setTradeType(int tradeType) {
		this.tradeType = tradeType;
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
	
}
