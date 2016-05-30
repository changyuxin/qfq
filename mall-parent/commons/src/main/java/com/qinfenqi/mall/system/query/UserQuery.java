/**
 * 
 */
package com.qinfenqi.mall.system.query;

import com.qinfenqi.mall.system.bean.User;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月5日 下午2:14:01
 * @author Chang Yuxin
 * @version 1.0
 */
public class UserQuery extends User {

	private int code;
	// 授权码
	private String authCode;

	private String deptName;
	
	private long collarId;

	private String roleName;

	private String password1;
	
	private String currentIpArea;
	private String lastIpArea;
	private String registIpArea;

	private String record;
	
	private String trueName;
	
	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName
	 *            the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * @return the deptName
	 */
	public String getDeptName() {
		return deptName;
	}

	/**
	 * @param deptName the deptName to set
	 */
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	/**
	 * @return the code
	 */
	public int getCode() {
		return code;
	}

	/**
	 * @param code
	 *            the code to set
	 */
	public void setCode(int code) {
		this.code = code;
	}

	/**
	 * @return the authCode
	 */
	public String getAuthCode() {
		return authCode;
	}

	/**
	 * @param authCode
	 *            the authCode to set
	 */
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	/**
	 * @return the collarId
	 */
	public long getCollarId() {
		return collarId;
	}

	/**
	 * @param collarId
	 *            the collarId to set
	 */
	public void setCollarId(long collarId) {
		this.collarId = collarId;
	}

	/**
	 * @return the password1
	 */
	public String getPassword1() {
		return password1;
	}

	/**
	 * @param password1
	 *            the password1 to set
	 */
	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	/**
	 * @return the currentIpArea
	 */
	public String getCurrentIpArea() {
		return currentIpArea;
	}

	/**
	 * @param currentIpArea the currentIpArea to set
	 */
	public void setCurrentIpArea(String currentIpArea) {
		this.currentIpArea = currentIpArea;
	}

	/**
	 * @return the lastIpArea
	 */
	public String getLastIpArea() {
		return lastIpArea;
	}

	/**
	 * @param lastIpArea the lastIpArea to set
	 */
	public void setLastIpArea(String lastIpArea) {
		this.lastIpArea = lastIpArea;
	}

	/**
	 * @return the registIpArea
	 */
	public String getRegistIpArea() {
		return registIpArea;
	}

	/**
	 * @param registIpArea the registIpArea to set
	 */
	public void setRegistIpArea(String registIpArea) {
		this.registIpArea = registIpArea;
	}

	/**
	 * @return the record
	 */
	public String getRecord() {
		return record;
	}

	/**
	 * @param record the record to set
	 */
	public void setRecord(String record) {
		this.record = record;
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
	
}
