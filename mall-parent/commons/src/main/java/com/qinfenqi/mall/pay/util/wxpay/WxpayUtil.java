package com.qinfenqi.mall.pay.util.wxpay;

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.SortedMap;

/**
 * @Title: 微信支付工具类
 * @Description: 用于生成随机字符中，签名，
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月25日 下午12:04:10
 * @author Chang Yuxin
 * @version 1.0
 */
public class WxpayUtil {

	/**
	 * @param length
	 * @return
	 */
	public static String CreateNoncestr(int length) {
		String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String res = "";
		for (int i = 0; i < length; i++) {
			Random rd = new Random();
			res += chars.charAt(rd.nextInt(chars.length() - 1));
		}
		return res;
	}

	/**
	 * @return
	 */
	public static String CreateNoncestr() {
		String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String res = "";
		for (int i = 0; i < 16; i++) {
			Random rd = new Random();
			res += chars.charAt(rd.nextInt(chars.length() - 1));
		}
		return res;
	}

	/**
	 * sign签名
	 * 
	 * @param characterEncoding
	 *            编码格式
	 * @param parameters
	 *            请求参数
	 * @return
	 */
	public static String createSign(String characterEncoding, SortedMap<Object, Object> parameters) {
		StringBuffer sb = new StringBuffer();
		Set<Entry<Object, Object>> es = parameters.entrySet();
		Iterator<Entry<Object, Object>> it = es.iterator();
		while (it.hasNext()) {
			Entry<Object, Object> entry = it.next();
			String k = (String) entry.getKey();
			Object v = entry.getValue();
			if (null != v && !"".equals(v) && !"sign".equals(k) && !"key".equals(k)) {
				sb.append(k + "=" + v + "&");
			}
		}
		sb.append("key=" + WxpayConfig.API_KEY);
		String sign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toUpperCase();
		return sign;
	}

	/**
	 * @Description：将请求参数转换为xml格式的string
	 * @param parameters
	 *            请求参数
	 * @return String
	 */
	public static String createRequestXml(SortedMap<Object, Object> parameters) {
		StringBuffer sb = new StringBuffer();
		sb.append("<xml>");
		Set<Entry<Object, Object>> es = parameters.entrySet();
		Iterator<Entry<Object, Object>> it = es.iterator();
		while (it.hasNext()) {
			Entry<Object, Object> entry = it.next();
			String k = (String) entry.getKey();
			String v = (String) entry.getValue();
			if ("attach".equalsIgnoreCase(k) || "body".equalsIgnoreCase(k) || "sign".equalsIgnoreCase(k)) {
				sb.append("<" + k + ">" + "<![CDATA[" + v + "]]></" + k + ">");
			} else {
				sb.append("<" + k + ">" + v + "</" + k + ">");
			}
		}
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 返回给微信的参数
	 * 
	 * @param return_code
	 *            返回编码
	 * @param return_msg
	 *            返回信息
	 * @return
	 */
	public static String createResponseXML(String return_code, String return_msg) {
		return "<xml><return_code><![CDATA[" + return_code + "]]></return_code><return_msg><![CDATA[" + return_msg
				+ "]]></return_msg></xml>";
	}
}
