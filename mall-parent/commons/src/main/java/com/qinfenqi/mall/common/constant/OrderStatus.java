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
public enum OrderStatus {
	CONTRACT_NO(1, "未签合同"), 
	AUDIT_READY(2, "待审核"), 
	AUDIT_PASS(3, "审核通过"), 
	DELIVER_COMPLETE(4, "待收货"), 
	PAYMENTING(5, "还款中"), 
	ORDER_CANCEL(6, "已取消"), 
	ORDER_COMPLETE(7, "已完成"),
	AUDIT_NO_PASS(8, "审核未通过"),
	READY_PAY(9, "待付款"),
	PAY_COMMPLETE(10, "付款完成"),
	RECEIVE_COMMPLETE(11, "已收货");

	/** ID */
	private int id;

	/** 名称 */
	private String name;

	private OrderStatus(int id, String name) {
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
		for (OrderStatus status : OrderStatus.values()) {
			if (status.id == Integer.parseInt(id)) {
				return status.getName();
			}
		}
		return "";
	}
}
