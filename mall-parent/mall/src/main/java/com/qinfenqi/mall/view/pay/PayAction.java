/**
 * 
 */
package com.qinfenqi.mall.view.pay;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.jdom.JDOMException;

import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.common.constant.Encoding;
import com.qinfenqi.mall.pay.bean.PayLog;
import com.qinfenqi.mall.pay.bean.Payment;
import com.qinfenqi.mall.pay.service.AlipayService;
import com.qinfenqi.mall.pay.service.WxpayService;
import com.qinfenqi.mall.pay.util.alipay.AlipayNotify;
import com.qinfenqi.mall.pay.util.wxpay.HttpUtil;
import com.qinfenqi.mall.pay.util.wxpay.XmlUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月3日 下午12:08:23
 * @author Chang Yuxin
 * @version 1.0
 */
public class PayAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = -7036876533792978452L;
	@Resource
	private AlipayService alipayService;
	@Resource
	private WxpayService wxpayService;

	// 支付对象
	private Payment payment;
	// 返回内容
	private String rtnCnt;

	/**
	 * 支付宝支付
	 * 
	 * @return
	 */
	public String alipay() {
		payment.setUserStyle(getUserStyle());
		rtnCnt = alipayService.buildRequest(payment);
		return "alipay";
	}

	/**
	 * 支付支付通知结果
	 * 
	 * @throws IOException
	 */
	public void alipayNotifyPage() throws IOException {

		PrintWriter out = response.getWriter();
		// 获取支付宝POST过来反馈信息
		Map<String, String> params = dealParamters(request.getParameterMap());

		// 交易状态
		String trade_status = getString("trade_status", Encoding.ISO_8859_1, Encoding.UTF_8);

		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
		if (AlipayNotify.verify(params)) {// 验证成功
			if (trade_status.equals("TRADE_SUCCESS")) {
				alipayService.savePayRecord(params);
			}
			out.println("success"); // 请不要修改或删除
		} else {// 验证失败
			out.println("fail");
		}
	}

	/**
	 * @param parameterMap
	 * @return
	 */
	private Map<String, String> dealParamters(Map<?, ?> requestParams) {
		Map<String, String> params = new HashMap<String, String>();
		for (Iterator<?> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		return params;
	}

	/**
	 * 响应支付反馈结果
	 * 
	 * @throws JDOMException
	 * @throws IOException
	 */
	public void wxpayNotifyPage() throws JDOMException, IOException {
		String result = HttpUtil.getOut(request.getInputStream());
		SortedMap<Object, Object> orderMap = XmlUtil.doXMLParse(result);
		String reulst = wxpayService.checkPayResult(orderMap);
		if ("".equals(result) == false) {
			PrintWriter out = response.getWriter();
			out.write(reulst);
		}
	}

	/**
	 * 查询支付状态
	 * 
	 * @return
	 */
	public String getPayStatus() {
		JSONObject json = new JSONObject();
		PayLog payLog = wxpayService.getPayLogByPayLogId(payment);
		String result = FAILURE;
		if (null != payLog) {
			result = payLog.getStatus() == 2 ? SUCCESS : FAILURE;
		}
		json.put("result", result);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 微信支付
	 * 
	 * @return
	 */
	public String wxpay() {
		Map<String, Object> map = new HashMap<String, Object>();
		payment.setUserStyle(getUserStyle());
		map = wxpayService.createUnioOrder(payment, getWebRootDir(), getBaseHost());
		payment = (Payment) map.get("payment");
		rtnCnt = (String) map.get("rtnCnt");
		return "wxpay";
	}

	/**
	 * 支付首页界面
	 * 
	 * @return
	 */
	public String payment() {

		return "payment";
	}

	/**
	 * @return the payment
	 */
	public Payment getPayment() {
		return payment;
	}

	/**
	 * @param payment
	 *            the payment to set
	 */
	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	/**
	 * @return the rtnCnt
	 */
	public String getRtnCnt() {
		return rtnCnt;
	}

	/**
	 * @param rtnCnt
	 *            the rtnCnt to set
	 */
	public void setRtnCnt(String rtnCnt) {
		this.rtnCnt = rtnCnt;
	}
}
