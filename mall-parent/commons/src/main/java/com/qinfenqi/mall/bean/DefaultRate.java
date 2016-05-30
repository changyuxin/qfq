/**
 * 
 */
package com.qinfenqi.mall.bean;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月1日 上午11:03:31
 * @author Chang Yuxin
 * @version 1.0 
 */
public class DefaultRate {
	private double serviceRate;
	private int periodNumStart;
	private int periodNumEnd;
	
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
	
}
