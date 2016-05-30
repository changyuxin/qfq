package com.qinfenqi.mall.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang.StringUtils;

/**
 * 字符串工具类
 * 
 * @author WangDuo
 * 
 */
public class StringUtil {

	/**
	 * 判断src使用逗号分割后是否包含str
	 * 
	 * @param src
	 * @param str
	 * @return
	 */
	public static boolean containWithComma(String src, String str) {
		return Arrays.asList(src.split(", ")).contains(str) || Arrays.asList(src.split(",")).contains(str);
	}
	
	/**
	 * 节掉最后的字符
	 * 	
	 * @param sourceStr
	 * @param endStr
	 * @return
	 */
	public static String replaceEndStr(String sourceStr, String endStr) {
		if (sourceStr.endsWith(endStr)) {
			return sourceStr.substring(0, sourceStr.lastIndexOf(endStr));
		}
		return sourceStr;
	}
	
	/**
	 * 去掉字符串多余的逗号
	 * @param words
	 * @return
	 */
	public static String processWords(String words){
		StringBuffer buffer = new StringBuffer();
		String[] arr = words.split(",");
		for(String s : arr){
			s = s.trim();
			if(s.length() == 0)
				continue;
			buffer.append(s).append(",");
		}
		String str = buffer.toString();
		if(str.length() == 0)
			return "";
		return str.substring(0, str.length()-1);		
	}
	
	/**
     * Ids字符串逗号截取为int数组
     * @param string
     * @return
     */
    public static int[] getIds(String string) {
		String[] array = string.split(",");
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < array.length; i++) {
			if (StringUtils.isNumeric(array[i].trim()))
				list.add(new Integer(array[i].trim()));
		}
		if (list.isEmpty()) {
			return null;
		}
		int[] rtn = new int[list.size()];
		int index = 0;
		for (int i : list)
			rtn[index++] = i;
		return rtn;
	}
	
    /**
	 * 判断整型
	 */
	public static boolean isNumber(String str) {
		return str.matches("^-?\\d+$");
	}

	/**
	 * @param productImgs
	 * @return
	 */
	public static List<String> String2List(String productImgs) {
		List<String> list = new ArrayList<String>();
		if(null != productImgs && "".equals(productImgs) == false){
			list = Arrays.asList(productImgs.split(","));
		}
		return list;
	}

	/**
	 * @param str
	 * @return
	 */
	public static String removeLastComma(String str) {
		if(str.lastIndexOf(",") != -1){
			return str.substring(0, str.length() - 1);
		} else {
			return str;
		}
	}
    
}
