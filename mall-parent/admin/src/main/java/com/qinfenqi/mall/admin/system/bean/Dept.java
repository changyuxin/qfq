/**
 * 
 */
package com.qinfenqi.mall.admin.system.bean;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年8月3日 上午11:32:23
 * @author Chang Yuxin
 * @version 1.0
 */
public class Dept extends BaseBean {
	private int deptId;
	private int parentId;
	private String deptName;

	/**
	 * @return the deptId
	 */
	public int getDeptId() {
		return deptId;
	}

	/**
	 * @param deptId
	 *            the deptId to set
	 */
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	/**
	 * @return the parentId
	 */
	public int getParentId() {
		return parentId;
	}

	/**
	 * @param parentId
	 *            the parentId to set
	 */
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	/**
	 * @return the deptName
	 */
	public String getDeptName() {
		return deptName;
	}

	/**
	 * @param deptName
	 *            the deptName to set
	 */
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

}
