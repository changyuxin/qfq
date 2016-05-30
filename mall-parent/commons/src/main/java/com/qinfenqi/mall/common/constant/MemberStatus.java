/**
 * 
 */
package com.qinfenqi.mall.common.constant;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月17日 上午9:59:22
 * @author Chang Yuxin
 * @version 1.0
 */
public enum MemberStatus {
	AUDIT_READY(1, "待审核"), 
	AUDIT_REPEAT(2, "重新审核"), 
	AUDIT_PASS(3, "审核通过"), 
	AUDIT_NO_PASSE(4, "审核不通过");

	/** ID */
	private int id;

	/** 名称 */
	private String name;

	private MemberStatus(int id, String name) {
		this.id = id;
		this.name = name;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
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
		for (MemberStatus status : MemberStatus.values()) {
			if (status.id == Integer.parseInt(id)) {
				return status.getName();
			}
		}
		return "";
	}
}
