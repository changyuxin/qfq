/**
 * 
 */
package com.qinfenqi.mall.view.weixin;

import java.io.IOException;
import java.io.PrintWriter;

import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.weixin.util.SignUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月9日 下午12:54:58
 * @author Chang Yuxin
 * @version 1.0
 */
public class WeixinAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = 3350508907381722806L;

	public void exchange() throws IOException {
		// 微信加密签名
		String signature = request.getParameter("signature");
		// 时间戳
		String timestamp = request.getParameter("timestamp");
		// 随机数
		String nonce = request.getParameter("nonce");
		// 随机字符串
		String echostr = request.getParameter("echostr");

		PrintWriter out = response.getWriter();
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			out.print(echostr);
		}
		out.close();
		out = null;
	}

	public String oauth() {

		return null;
	}

}
