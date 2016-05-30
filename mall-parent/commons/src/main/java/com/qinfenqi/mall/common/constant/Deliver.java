/**
 * 
 */
package com.qinfenqi.mall.common.constant;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月9日 下午5:24:44
 * @author Chang Yuxin
 * @version 1.0
 */
public enum Deliver {
	SHUNFENG("shunfeng", "顺丰快递"), 
	YUANTONG("yuantong", "圆通快递"), 
	SHENTONG("shentong", "申通快递"), 
	ZHONGTONG("zhongtong", "中通快递"), 
	HUITONG("huitong", "汇通快递"), 
	YUNDA("yunda", "韵达快递"), 
	TIANTIAN("tiantian", "天天快递"), 
	EMS("ems", "邮政EMS");

	private String code;
	private String name;

	/**
	 * @param code
	 * @param name
	 */
	private Deliver(String code, String name) {
		this.code = code;
		this.name = name;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
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
	public static String getName(String code) {
		for (Deliver d : Deliver.values()) {
			if (d.code.equals(code)) {
				return d.getName();
			}
		}
		return "";
	}
	
}
