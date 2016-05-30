/**
 * 
 */
package com.qinfenqi.mall.common.constant;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月12日 下午5:45:24
 * @author Chang Yuxin
 * @version 1.0
 */
public enum EduStatus {
	MIDDLE_SCHOOL("1", "中学"), 
	SENIOR_SCHOOL("2", "高中"), 
	JUNIOR_COLLEGE("3", "专科"), 
	COLLEGE("4", "本科"), 
	MASTER("5", "研究生"), 
	DOCTOR("6", "博士");

	/** ID */
	private String id;

	/** 名称 */
	private String name;

	private EduStatus(String id, String name) {
		this.id = id;
		this.name = name;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 返回名称
	 * 
	 * @param id
	 * @return
	 */
	public static String getName(String id) {
		for (EduStatus status : EduStatus.values()) {
			if (status.id.equals(id)) {
				return status.getName();
			}
		}
		return "";
	}
}
