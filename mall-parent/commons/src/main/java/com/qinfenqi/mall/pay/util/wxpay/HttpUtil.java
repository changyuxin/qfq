package com.qinfenqi.mall.pay.util.wxpay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * @Title:Http工具类
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月24日 上午11:38:11
 * @author Chang Yuxin
 * @version 1.0
 */
public class HttpUtil {

	/**
	 * 发送https请求
	 * 
	 * @param requestContent
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return 返回微信服务器响应的信息
	 * @throws IOException
	 */
	public static String httpRequest(String requestUrl, String requestMethod, String requestContent) throws IOException {
		// 统一下单接口提交 xml格式
		URL orderUrl = new URL("https://api.mch.weixin.qq.com/pay/unifiedorder");
		HttpURLConnection conn = (HttpURLConnection) orderUrl.openConnection();
		conn.setConnectTimeout(30000); // 设置连接主机超时（单位：毫秒)
		conn.setReadTimeout(30000); // 设置从主机读取数据超时（单位：毫秒)
		conn.setDoOutput(true); // post请求参数要放在http正文内，顾设置成true，默认是false
		conn.setDoInput(true); // 设置是否从httpUrlConnection读入，默认情况下是true
		conn.setUseCaches(false); // Post 请求不能使用缓存
		// 设定传送的内容类型是可序列化的java对象(如果不设此项,在传送序列化对象时,当WEB服务默认的不是这种类型时可能抛java.io.EOFException)
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestMethod("POST");// 设定请求的方法为"POST"，默认是GET
		conn.setRequestProperty("Content-Length", requestContent.length() + "");
		OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), WxpayConfig.INPUT_CHARSET);
		out.write(requestContent.toString());
		out.flush();
		out.close();
		return getOut(conn.getInputStream());
	}

	/**
	 * @param request
	 * @param conn
	 * @return String
	 * @throws IOException
	 */
	public static String getOut(InputStream inputStream) {
		// 从输入流读取返回内容
		BufferedReader bufferedReader = null;
		StringBuffer buffer = new StringBuffer();
		try {
			bufferedReader = new BufferedReader(new InputStreamReader(inputStream, WxpayConfig.INPUT_CHARSET));
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != bufferedReader) {
					bufferedReader.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return buffer.toString();
	}
}