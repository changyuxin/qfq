/**
 * 
 */
package com.qinfenqi.mall.common.constant;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月25日 上午10:07:56
 * @author Chang Yuxin
 * @version 1.0 
 */
public enum CompanyType {
	Type_1(1, "外商独资/外企办事处"), 
	Type_2(2, "中外合营（合资/合作）"), 
	Type_3(3, "私营/民营企业"),
	Type_4(4, "国有企业"),
	Type_5(5, "国内上市公司"),
	Type_6(6, "政府机关/非盈利机构"),
	Type_7(7, "事业单位"),
	Type_8(8, "其他");
	
	/** ID */
	private int id;

	/** 名称 */
	private String name;

	private CompanyType(int id, String name) {
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
	public static String getName(int id) {
		for (CompanyType status : CompanyType.values()) {
			if (status.id == id) {
				return status.getName();
			}
		}
		return "";
	}
}	
	
	

