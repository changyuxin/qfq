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

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月8日 下午4:00:48
 * @author Chang Yuxin
 * @version 1.0 
 */
public class DeliverInfoHelper {
	
	private static final Logger logger = LoggerFactory.getLogger(DeliverInfoHelper.class);
	private static final String KEY = "ee51f9b16f6e45d198ce2c3e48d63335";
	
	/**
	 * @param order
	 * @param id
	 * @return
	 */
	public static String getDeliverInfo(String order, String id) {
		
//		Map<String, Object> resultMap = null;
		String content = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet("http://www.aikuaidi.cn/rest/?key=" + KEY + "&order=" + order.trim()
				+ "&id=" + id.trim() + "&ord=desc&show=json");
		CloseableHttpResponse response = null;
		try {
			response = httpclient.execute(httpGet);

			System.out.println(response.getStatusLine());
			HttpEntity entity = response.getEntity();
			content = EntityUtils.toString(entity);
			logger.info("Deliver info content is: " + content);
			EntityUtils.consume(entity);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != response) {
					response.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return content;
	}
}
