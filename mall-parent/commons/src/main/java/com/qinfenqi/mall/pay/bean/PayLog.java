/**
 * 
 */
package com.qinfenqi.mall.pay.bean;

import java.util.Date;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月3日 上午8:42:44
 * @author Chang Yuxin
 * @version 1.0 
 */
public class PayLog {
	private long payLogId;
	private long userId;
	private long tradeNo;
	private int tradeType;// 1:bill,2:first_pay
	private String total;
	private String body;
	private int payType;
	private int status;
	private String rtnCnt;
	private String requestParams;
	private String responseParams;
	private Date createTime;
	/**
	 * @return the payLogId
	 */
	public long getPayLogId() {
		return payLogId;
	}
	/**
	 * @param payLogId the payLogId to set
	 */
	public void setPayLogId(long payLogId) {
		this.payLogId = payLogId;
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
	 * @return the tradeNo
	 */
	public long getTradeNo() {
		return tradeNo;
	}
	/**
	 * @param tradeNo the tradeNo to set
	 */
	public void setTradeNo(long tradeNo) {
		this.tradeNo = tradeNo;
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
	 * @return the total
	 */
	public String getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(String total) {
		this.total = total;
	}
	/**
	 * @return the body
	 */
	public String getBody() {
		return body;
	}
	/**
	 * @param body the body to set
	 */
	public void setBody(String body) {
		this.body = body;
	}
	/**
	 * @return the payType
	 */
	public int getPayType() {
		return payType;
	}
	/**
	 * @param payType the payType to set
	 */
	public void setPayType(int payType) {
		this.payType = payType;
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
	 * @return the rtnCnt
	 */
	public String getRtnCnt() {
		return rtnCnt;
	}
	/**
	 * @param rtnCnt the rtnCnt to set
	 */
	public void setRtnCnt(String rtnCnt) {
		this.rtnCnt = rtnCnt;
	}
	/**
	 * @return the requestParams
	 */
	public String getRequestParams() {
		return requestParams;
	}
	/**
	 * @param requestParams the requestParams to set
	 */
	public void setRequestParams(String requestParams) {
		this.requestParams = requestParams;
	}
	
	/**
	 * @return the responseParams
	 */
	public String getResponseParams() {
		return responseParams;
	}
	/**
	 * @param responseParams the responseParams to set
	 */
	public void setResponseParams(String responseParams) {
		this.responseParams = responseParams;
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PayLog [payLogId=" + payLogId + ", userId=" + userId + ", tradeNo=" + tradeNo + ", tradeType=" + tradeType
				+ ", body=" + body + ", payType=" + payType + ", status=" + status + ", rtnCnt=" + rtnCnt + ", requestParams="
				+ requestParams + ", responseParams=" + responseParams + ", createTime=" + createTime + "]";
	}
	
}
