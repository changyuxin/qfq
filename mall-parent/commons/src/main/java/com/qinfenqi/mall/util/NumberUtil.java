/**
 * 
 */
package com.qinfenqi.mall.util;

import java.text.DecimalFormat;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月4日 下午4:58:16
 * @author Chang Yuxin
 * @version 1.0
 */
public class NumberUtil {

	public static final String DOT_LAST_TWO = "##0.00";

	/**
	 * @param number
	 * @param format
	 * @return fnum.format(number)
	 */
	public static double formatDouble(double number, String format) {
		DecimalFormat fnum = new DecimalFormat(format);
		return Double.parseDouble(fnum.format(number));
	}
	
	/**
	 * @param number
	 * @return
	 */
	public static String formatDouble(double number){
		DecimalFormat fmt = new DecimalFormat("###,##0.0000");
		return fmt.format(number);
	}
	
}
