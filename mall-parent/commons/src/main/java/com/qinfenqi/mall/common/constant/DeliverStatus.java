/**
 * 
 */
package com.qinfenqi.mall.common.constant;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 上午11:58:32
 * @author Chang Yuxin
 * @version 1.0
 */
public enum DeliverStatus {
	NOTREADY(1, "未发货"),
	ALREADY(2, "已发货");
	
	/** ID */
	private int id;
	
	/** 名称 */
	private String name;
	
	private DeliverStatus(int id, String name) {
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
	 * @param id the id to set
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
	 * @param name the name to set
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
	public static String getName(int id) {
		for (DeliverStatus status : DeliverStatus.values()) {
			if (status.id == id) {
				return status.getName();
			}
		}
		return "";
	}
}
