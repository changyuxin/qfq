/**
 * 
 */
package com.qinfenqi.mall.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月9日 上午10:36:23
 * @author Chang Yuxin
 * @version 1.0
 */
public class AuthCode extends BaseBean {
	private int codeId;
	private String refereeName;
	private String name;
	private String mobile;
	private String code;
	private int isUsed;
	private Date createTime;
	private Date usedTime;

	/**
	 * @return the codeId
	 */
	public int getCodeId() {
		return codeId;
	}

	/**
	 * @param codeId
	 *            the codeId to set
	 */
	public void setCodeId(int codeId) {
		this.codeId = codeId;
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
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile
	 *            the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code
	 *            the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the isUsed
	 */
	public int getIsUsed() {
		return isUsed;
	}

	/**
	 * @param isUsed
	 *            the isUsed to set
	 */
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	/**
	 * @return the createTime
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime
	 *            the createTime to set
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * @return the usedTime
	 */
	public Date getUsedTime() {
		return usedTime;
	}

	/**
	 * @param usedTime the usedTime to set
	 */
	public void setUsedTime(Date usedTime) {
		this.usedTime = usedTime;
	}

	/**
	 * @return the refereeName
	 */
	public String getRefereeName() {
		return refereeName;
	}

	/**
	 * @param refereeName the refereeName to set
	 */
	public void setRefereeName(String refereeName) {
		this.refereeName = refereeName;
	}
	
}
