/**
 * 
 */
package com.qinfenqi.mall.product.bean;

import java.util.Date;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月1日 下午4:00:56
 * @author Chang Yuxin
 * @version 1.0 
 */
public class ServiceRate {
	private int productId;
	private double serviceRate;
	private int periodNumStart;
	private int periodNumEnd;
	private Date createTime;
	
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
	 * @return the periodNumStart
	 */
	public int getPeriodNumStart() {
		return periodNumStart;
	}
	/**
	 * @param periodNumStart the periodNumStart to set
	 */
	public void setPeriodNumStart(int periodNumStart) {
		this.periodNumStart = periodNumStart;
	}
	/**
	 * @return the periodNumEnd
	 */
	public int getPeriodNumEnd() {
		return periodNumEnd;
	}
	/**
	 * @param periodNumEnd the periodNumEnd to set
	 */
	public void setPeriodNumEnd(int periodNumEnd) {
		this.periodNumEnd = periodNumEnd;
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
