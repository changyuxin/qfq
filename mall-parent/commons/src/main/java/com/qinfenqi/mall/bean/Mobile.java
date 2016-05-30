/**
 * 
 */
package com.qinfenqi.mall.bean;

import java.util.Map;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年9月28日 下午3:52:39
 * @author Chang Yuxin
 * @version 1.0
 */
public class Mobile {
	private Map<String, String> data;
	private String message;
	private String error_code;
	/**
	 * @return the data
	 */
	public Map<String, String> getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(Map<String, String> data) {
		this.data = data;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return the error_code
	 */
	public String getError_code() {
		return error_code;
	}
	/**
	 * @param error_code the error_code to set
	 */
	public void setError_code(String error_code) {
		this.error_code = error_code;
	}
	
}
