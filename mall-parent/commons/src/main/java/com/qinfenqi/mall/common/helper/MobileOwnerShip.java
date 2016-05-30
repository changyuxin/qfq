/**
 * 
 */
package com.qinfenqi.mall.common.helper;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.qinfenqi.mall.bean.Mobile;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年9月25日 下午4:22:52
 * @author Chang Yuxin
 * @version 1.0
 */
public class MobileOwnerShip {
	private static final Logger logger = LoggerFactory.getLogger(DeliverInfoHelper.class);
	private static final String KEY = "a9f3fb0a634a455f588e22b9719e464e";

	/**
	 * @param order
	 * @param id
	 * @return
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public static Mobile getMobileOwnerShip(String mobile) throws ClientProtocolException, IOException {
		Mobile m = new Mobile();
		String content = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet("http://a.apix.cn/apixlife/phone/phone?phone=" + mobile);
		CloseableHttpResponse response = null;
		httpGet.addHeader("accept", "application/json");
		httpGet.addHeader("content-type", "application/json");
		httpGet.addHeader("apix-key", KEY);
		try {
			response = httpclient.execute(httpGet);
			// System.out.println(response.getStatusLine());
			HttpEntity entity = response.getEntity();
			content = EntityUtils.toString(entity);
			logger.info("======================" + content);
			m = new Gson().fromJson(content, Mobile.class);
			logger.info("Deliver info content is: " + content);
			EntityUtils.consume(entity);
		} finally {
			try {
				if (null != response) {
					response.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return m;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Mobile mobile = null;
		try {
			mobile = MobileOwnerShip.getMobileOwnerShip("18800412963");
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.print(mobile.getData());
	}
}
