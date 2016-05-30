/**
 * 
 */
package com.qinfenqi.mall.order.query;

import java.util.Date;
import java.util.List;

import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.order.bean.Order;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月10日 上午8:48:08
 * @author Chang Yuxin
 * @version 1.0 
 */
public class OrderQuery extends Order{
	
	private Date stopTime;
	private List<BillQuery> billQuerys;
	// 已经还几期
	private int overMonths;
	// 还剩几期
	private int remainMonths;
	
	private String startTime;
	
	private String endTime;
	
	private int userStyle;
	
	private int productCode;
	
	/**
	 * @return the stopTime
	 */
	public Date getStopTime() {
		return stopTime;
	}

	/**
	 * @param stopTime the stopTime to set
	 */
	public void setStopTime(Date stopTime) {
		this.stopTime = stopTime;
	}

	/**
	 * @return the billQuerys
	 */
	public List<BillQuery> getBillQuerys() {
		return billQuerys;
	}

	/**
	 * @param billQuerys the billQuerys to set
	 */
	public void setBillQuerys(List<BillQuery> billQuerys) {
		this.billQuerys = billQuerys;
	}

	/**
	 * @return the overMonths
	 */
	public int getOverMonths() {
		return overMonths;
	}

	/**
	 * @param overMonths the overMonths to set
	 */
	public void setOverMonths(int overMonths) {
		this.overMonths = overMonths;
	}

	/**
	 * @return the remainMonths
	 */
	public int getRemainMonths() {
		return remainMonths;
	}

	/**
	 * @param remainMonths the remainMonths to set
	 */
	public void setRemainMonths(int remainMonths) {
		this.remainMonths = remainMonths;
	}

	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
	 * @return the productCode
	 */
	public int getProductCode() {
		return productCode;
	}

	/**
	 * @param productCode the productCode to set
	 */
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	
}
