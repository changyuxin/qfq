/**
 * 
 */
package com.qinfenqi.mall.common.constant;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月15日 下午1:26:15
 * @author Chang Yuxin
 * @version 1.0 
 */
public enum Bank {
	ICBC("ICBC", "工商银行"), 
	ABC("ABC", "农业银行"), 
	BOC("BOC", "中国银行"), 
	CCB("CCB", "建设银行"), 
	CMBCHINA("CMBCHINA", "招商银行"), 
	SPDB("SPDB", "浦发银行"), 
	CIB("CIB", "兴业银行"), 
	CEB("CEB", "光大银行"), 
	GDB("GDB", "广发银行"), 
	PINGAN("PINGAN", "平安银行"), 
    HXB("HXB", "华夏银行"), 
    CMBC("CMBC", "民生银行"), 
    SHB("SHB", "上海银行"), 
    ECITIC("ECITIC", "中信银行"), 
    BOCO("BOCO", "交通银行"), 
    POST("POST", "邮政储蓄银行"),
    NCXYS("NCXYS", "农村信用社"),
    NMGYH("NMGYH", "内蒙古银行");
	
	/** ID */
	private String flag;

	/** 名称 */
	private String name;

	private Bank(String flag, String name) {
		this.flag = flag;
		this.name = name;
	}

	/**
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}

	/**
	 * @param flag the flag to set
	 */
	public void setFlag(String flag) {
		this.flag = flag;
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
	 * @param flag
	 * @return
	 */
	public static String getName(String flag) {
		for (Bank bank : Bank.values()) {
			if (bank.flag.equals(flag)) {
				return bank.getName();
			}
		}
		return "";
	}
}
