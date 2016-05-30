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
 * @bulid: 2015年9月28日 下午3:56:02
 * @author Chang Yuxin
 * @version 1.0
 */
public class IdCard {
	private String success;
	private Map<String, String> result;

	/**
	 * @return the success
	 */
	public String getSuccess() {
		return success;
	}

	/**
	 * @param success
	 *            the success to set
	 */
	public void setSuccess(String success) {
		this.success = success;
	}

	/**
	 * @return the result
	 */
	public Map<String, String> getResult() {
		return result;
	}

	/**
	 * @param result
	 *            the result to set
	 */
	public void setResult(Map<String, String> result) {
		this.result = result;
	}

}
