/**
 * 
 */
package com.qinfenqi.mall.bean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年8月4日 上午9:57:26
 * @author Chang Yuxin
 * @version 1.0
 */
public class Count {
	private String name;
	private String total;
	
	/**
	 * 
	 */
	public Count() {
		super();
	}
	/**
	 * @param string
	 * @param size
	 */
	public Count(String name, String total) {
		this.name = name;
		this.total = total;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
	
	
}
