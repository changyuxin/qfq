/**
 * 
 */
package com.qinfenqi.mall.common.helper;

import java.io.IOException;
import java.util.HashMap;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.cloopen.rest.sdk.CCPRestSmsSDK;
import com.qinfenqi.mall.util.PropertyUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月8日 下午12:34:58
 * @author Chang Yuxin
 * @version 1.0
 */

public class SMSSender {

	private static SMSSender sender = new SMSSender();

	public static SMSSender getInstance() {
		return sender;
	}

	/**
	 * @param mobile
	 * @param templateId
	 * @param msg
	 * @param minute
	 * @return boolean
	 */
	public HashMap<String, Object> send(String mobile, String templateId, String msg, String minute) {
		CCPRestSmsSDK REST_API = new CCPRestSmsSDK();
		// 初始化SDK
		REST_API.init(PropertyUtil.get("MSG.BASE.URL"), PropertyUtil.get("MSG.PORT"));
		REST_API.setAccount(PropertyUtil.get("MSG.ACOUNT.SID"), PropertyUtil.get("MSG.AUTH.TOKEN"));
		REST_API.setAppId(PropertyUtil.get("MSG.APP.ID"));
		return REST_API.sendTemplateSMS(mobile, templateId, new String[] { msg, minute });
	}

	/**
	 * @param mobile
	 * @param templateId
	 * @param msg
	 * @return
	 * @throws IOException 
	 */
	public boolean send(String mobile, String templateId, String[] msg) throws IOException {
		String url = createSMSReq(mobile, templateId, msg);
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet(url);
		CloseableHttpResponse response = null;
		try {
			response = httpclient.execute(httpGet);
			HttpEntity entity = response.getEntity();
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
		return false;
	}

	/**
	 * @param mobile
	 * @param templateId
	 * @param msg
	 * @return
	 */
	public String createSMSReq(String mobile, String templateId, String[] msg) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(PropertyUtil.get("SMS_URL"));
		buffer.append("?action=").append(PropertyUtil.get("SMS_TYPE"));
		buffer.append("&userid=").append(PropertyUtil.get("SMS_USERID"));
		buffer.append("&account=").append(PropertyUtil.get("SMS_ACCOUNT"));
		buffer.append("&password=").append(PropertyUtil.get("SMS_PASSWORD"));
		buffer.append("&mobile=").append(mobile);
		if(null == templateId){
			buffer.append("&content=").append(msg[0]);
		} else {
			buffer.append("&content=").append(createSMS(templateId, msg));
		}
		buffer.append("&sendTime=").append(PropertyUtil.get("SMS_SENDTIME"));
		buffer.append("&extno=").append(PropertyUtil.get("SMS_EXTNO"));
		return buffer.toString();
	}

	/**
	 * @param templateId
	 * @param msg
	 * @return String
	 */
	private String createSMS(String templateId, String[] msg) {
		String SMS = PropertyUtil.get(templateId);
		for (int i = 0; i < msg.length; i++) {
			String key = "{" + (i + 1) + "}";
			SMS = SMS.replace(key, msg[i]);
		}
		return SMS;
	}

}
