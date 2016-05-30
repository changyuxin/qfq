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
public enum PaymentStatus {
	NOPAYMENT("1", "还款中"), 
	ALREADYPAY("2", "已还款"), 
	DELAYPAY("3", "已延期");

	/** ID */
	private String id;

	/** 名称 */
	private String name;

	private PaymentStatus(String id, String name) {
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
		for (PaymentStatus status : PaymentStatus.values()) {
			if (status.id.equals(id)) {
				return status.getName();
			}
		}
		return "";
	}
}
