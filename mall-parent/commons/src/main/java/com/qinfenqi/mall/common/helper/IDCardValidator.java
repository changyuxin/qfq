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
import com.qinfenqi.mall.bean.IdCard;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月10日 下午6:14:32
 * @author Chang Yuxin
 * @version 1.0
 */
public class IDCardValidator {
	private static final Logger logger = LoggerFactory.getLogger(IDCardValidator.class);
	private static final String APP_KEY = "14344";
	private static final String SIGN = "454bcedbb1815d4c3ba6e8ba912aa7f9";
	private static final String FORMAT = "json";

	public static IdCard validator(String idCard) {
		IdCard id = new IdCard();
		String content = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet("http://api.k780.com:88/?app=idcard.get&idcard=" + idCard + "&appkey=" + APP_KEY + "&sign=" + SIGN
				+ "&format=" + FORMAT);
		CloseableHttpResponse response = null;
		try {
			response = httpclient.execute(httpGet);
			HttpEntity entity = response.getEntity();
			content = EntityUtils.toString(entity);
			logger.info("Query id card message successfully!.........." + content);
			id = new Gson().fromJson(content, IdCard.class);
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

		return id;
	}

	public static void main(String[] args) {
		// String idCard = "220103197812052912";
		// String idCard = "220821197906074531";
		String idCard = "211022199309280012";
		System.out.println("str = " + IDCardValidator.validator(idCard).getResult().get("att"));
	}
}
