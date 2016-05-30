/**
 * 
 */
package com.qinfenqi.mall.pay.bean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月2日 下午5:45:16
 * @author Chang Yuxin
 * @version 1.0
 */
public class Payment {
	// 支付方式。1：ali; 2: wx
	private int payType;
	// 支付成功后通知URL
	private String notify_url;
	// 支付标题
	private String body;
	// 支付总额
	private String totalFee;
	// 支付流水编码
	private String outTradeNo;
	// 业务编码
	private String tradeNo;
	// 自定义参数
	private String attach;
	// 支付类型 1:bill, 2:first_pay,3:full_pay
	private String tradeType;
	// 用户ID
	private long userId;
	// 用户类型
	private int userStyle;
	// 是否提前， 1：提前，2：不提前
	private int isEarly = 2;

	/**
	 * @return the payType
	 */
	public int getPayType() {
		return payType;
	}

	/**
	 * @param payType
	 *            the payType to set
	 */
	public void setPayType(int payType) {
		this.payType = payType;
	}

	/**
	 * @return the notify_url
	 */
	public String getNotify_url() {
		return notify_url;
	}

	/**
	 * @param notify_url
	 *            the notify_url to set
	 */
	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}

	/**
	 * @return the body
	 */
	public String getBody() {
		return body;
	}

	/**
	 * @param body
	 *            the body to set
	 */
	public void setBody(String body) {
		this.body = body;
	}

	/**
	 * @return the totalFee
	 */
	public String getTotalFee() {
		return totalFee;
	}

	/**
	 * @param totalFee
	 *            the totalFee to set
	 */
	public void setTotalFee(String totalFee) {
		this.totalFee = totalFee;
	}

	/**
	 * @return the attach
	 */
	public String getAttach() {
		return attach;
	}

	/**
	 * @param attach
	 *            the attach to set
	 */
	public void setAttach(String attach) {
		this.attach = attach;
	}

	/**
	 * @return the outTradeNo
	 */
	public String getOutTradeNo() {
		return outTradeNo;
	}

	/**
	 * @param outTradeNo
	 *            the outTradeNo to set
	 */
	public void setOutTradeNo(String outTradeNo) {
		this.outTradeNo = outTradeNo;
	}

	/**
	 * @return the tradeNo
	 */
	public String getTradeNo() {
		return tradeNo;
	}

	/**
	 * @param tradeNo
	 *            the tradeNo to set
	 */
	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}

	/**
	 * @return the tradeType
	 */
	public String getTradeType() {
		return tradeType;
	}

	/**
	 * @param tradeType
	 *            the tradeType to set
	 */
	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	/**
	 * @return the userId
	 */
	public long getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(long userId) {
		this.userId = userId;
	}

	/**
	 * @return the userStyle
	 */
	public int getUserStyle() {
		return userStyle;
	}

	/**
	 * @param userStyle
	 *            the userStyle to set
	 */
	public void setUserStyle(int userStyle) {
		this.userStyle = userStyle;
	}

	/**
	 * @return the isEarly
	 */
	public int getIsEarly() {
		return isEarly;
	}

	/**
	 * @param isEarly
	 *            the isEarly to set
	 */
	public void setIsEarly(int isEarly) {
		this.isEarly = isEarly;
	}

}
