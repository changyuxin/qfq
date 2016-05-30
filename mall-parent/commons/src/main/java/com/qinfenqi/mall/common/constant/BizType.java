/**
 * 
 */
package com.qinfenqi.mall.common.constant;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月13日 下午3:18:17
 * @author Chang Yuxin
 * @version 1.0
 */
public enum BizType {
	ORDER(1, "订单"), 
	CONTRACT(2, "合同"), 
	MEMBER(3, "大学生会员"), 
	COLLAR(4, "白领会员"), 
	BILL(5, "帐单"),
	USER(6, "用户");
	private int id;
	private String name;

	/**
	 * 返回名称
	 * 
	 * @param id
	 * @return
	 */
	public static String getName(String id) {
		for (BizType biz : BizType.values()) {
			if (biz.id == Integer.parseInt(id)) {
				return biz.getName();
			}
		}
		return "";
	}

	/**
	 * @param id
	 * @param name
	 */
	private BizType(int id, String name) {
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

}
