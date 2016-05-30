/**
 * 
 */
package com.qinfenqi.mall.wxpay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.SortedMap;
import java.util.TreeMap;

import org.jdom.JDOMException;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.qinfenqi.mall.common.constant.Encoding;
import com.qinfenqi.mall.pay.util.wxpay.WxpayConfig;
import com.qinfenqi.mall.pay.util.wxpay.WxpayUtil;
import com.qinfenqi.mall.pay.util.wxpay.XmlUtil;
import com.qinfenqi.mall.qrcode.QRCodeBuilder;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月24日 下午12:24:28
 * @author Chang Yuxin
 * @version 1.0
 */
public class PayService {
	private static final Logger logger = LoggerFactory.getLogger(PayService.class);

	/**
	 * @return SortedMap<Object, Object
	 */
	public static SortedMap<Object, Object> createParameters() {
		SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();
		parameters.put("appid", WxpayConfig.APP_ID);
		parameters.put("attach", "支付测试");
		parameters.put("body", "JSAPI支付测试");
		parameters.put("device_info", "WEB");
		parameters.put("mch_id", WxpayConfig.MCH_ID);
		parameters.put("nonce_str", "1add1a30ac87aa2db72f57a2375d8fec");
		parameters.put("notify_url", WxpayConfig.NOTIFY_URL);
		// parameters.put("openid", "oUpF8uMuAJO_M2pxb1Q9zNjWeS6o");
		parameters.put("out_trade_no", "1415659998");
		parameters.put("product_id", "1");
		parameters.put("spbill_create_ip", "101.200.234.70");
		parameters.put("total_fee", "1");
		parameters.put("trade_type", "NATIVE");
		parameters.put("sign", WxpayUtil.createSign(Encoding.UTF_8, parameters));

		return parameters;
	}

	@Test
	public void testPay() throws IOException, JDOMException {

		String requestUrl = WxpayUtil.createRequestXml(createParameters());

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
		conn.setRequestProperty("Content-Length", requestUrl.length() + "");
		OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), Encoding.UTF_8);
		out.write(requestUrl.toString());
		out.flush();
		out.close();
		String result = getOut(conn);
		logger.info("result=========返回的xml=============" + result);
		SortedMap<Object, Object> orderMap = XmlUtil.doXMLParse(result);
		logger.info("orderMap===========================" + orderMap);
		// 生成二维码
		if (null != orderMap.get("code_url")) {
			QRCodeBuilder.build(180, 180, "D:/new.png", (String) orderMap.get("code_url"));
		}
	}

	/**
	 * @param conn
	 * @return
	 * @throws IOException
	 */
	private static String getOut(HttpURLConnection conn) throws IOException {
		// 从输入流读取返回内容
		InputStream inputStream = conn.getInputStream();
		InputStreamReader inputStreamReader = new InputStreamReader(inputStream, WxpayConfig.INPUT_CHARSET);
		BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
		String str = null;
		StringBuffer buffer = new StringBuffer();
		while ((str = bufferedReader.readLine()) != null) {
			buffer.append(str);
		}
		return buffer.toString();
	}

	@Test
	public void testSign() {
		SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();
		parameters.put("appid", "wx4c7aabf3b2ee0877");
		parameters.put("attach", "billid=121");
		parameters.put("bank_type", "CMB_CREDIT");
		parameters.put("cash_fee", "1");
		parameters.put("device_info", "WEB");
		parameters.put("fee_type", "CNY");
		parameters.put("is_subscribe", "Y");
		parameters.put("mch_id", "1243100102");
		parameters.put("nonce_str", "nw2cPiXILffdcX8x4MzE5E2DGfig0N0z");
		parameters.put("openid", "oox4cuNfJD_ZyOrBdzG8BJFWhQpE");
		parameters.put("out_trade_no", "180");
		parameters.put("result_code", "SUCCESS");
		parameters.put("return_code", "SUCCESS");
		parameters.put("time_end", "20150626110929");
		parameters.put("total_fee", "1");
		parameters.put("trade_type", "NATIVE");
		parameters.put("transaction_id", "1009610188201506260304922970");

		String sign = WxpayUtil.createSign(Encoding.UTF_8, parameters);

		System.out.print("08552882F48076AAD6370D16823B17AC".equals(sign));

	}

}
