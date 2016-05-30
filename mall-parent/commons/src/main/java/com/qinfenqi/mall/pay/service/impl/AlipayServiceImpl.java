/**
 * 
 */
package com.qinfenqi.mall.pay.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.MallSetting;
import com.qinfenqi.mall.bill.dao.BillDao;
import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.collar.dao.CollarDao;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.common.constant.OrderStatus;
import com.qinfenqi.mall.common.dao.CommonDao;
import com.qinfenqi.mall.member.dao.MemberDao;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.order.dao.OrderDao;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.pay.bean.PayLog;
import com.qinfenqi.mall.pay.bean.Payment;
import com.qinfenqi.mall.pay.dao.PayDao;
import com.qinfenqi.mall.pay.service.AlipayService;
import com.qinfenqi.mall.pay.util.PayStatementUtil;
import com.qinfenqi.mall.pay.util.alipay.AlipayConfig;
import com.qinfenqi.mall.pay.util.alipay.AlipaySubmit;
import com.qinfenqi.mall.util.NumberUtil;
import com.qinfenqi.mall.util.PropertyUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月27日 上午11:31:28
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("alipayService")
public class AlipayServiceImpl implements AlipayService {

	@Resource
	private BillDao billDao;
	@Resource
	private OrderDao orderDao;
	@Resource
	private PayDao payDao;
	@Resource
	private MemberDao memberDao;
	@Resource
	private CollarDao collarDao;
	@Resource
	private CommonDao commonDao;

	/**
	 * @param billQuery
	 * @return String
	 */
	@Override
	public String buildRequest(Payment payment) {

		// 1、 根据payment参数trade_type将payment参数补充完整
		rebuildPayment(payment);

		// //////////////////////////////////请求参数//////////////////////////////////////

		// 支付类型
		String payment_type = "1";
		// 必填，不能修改
		// 服务器异步通知页面路径(需http://格式的完整路径，不能加?id=123这类自定义参数)
		String notify_url = AlipayConfig.NOTIFY_URL;

		// 页面跳转同步通知页面路径(需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/)
		String return_url = AlipayConfig.RETURN_URL;

		// 订单名称(必填)
		String subject = payment.getBody();

		// 商户订单号(商户网站订单系统中唯一订单号，必填)
		String out_trade_no = "";

		// 付款金额(必填)
		String total_fee = "";

		out_trade_no = payment.getOutTradeNo() + "";

		if (PropertyUtil.getInt("TEST_PAY", 1) == 1) {
			// 商户订单号(商户网站订单系统中唯一订单号，必填)
			total_fee = "0.01";
		} else {
			total_fee = payment.getTotalFee();
		}

		// 订单描述
		String body = payment.getBody();

		// 商品展示地址
		String show_url = "";
		// 需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html

		// 防钓鱼时间戳
		String anti_phishing_key = "";
		// 若要使用请调用类文件submit中的query_timestamp函数

		// 客户端的IP地址
		String exter_invoke_ip = "";
		// 非局域网的外网IP地址，如：221.0.0.1

		// 自定义参数
		String extra_common_param = payment.getAttach();

		// ////////////////////////////////////////////////////////////////////////////////

		// 把请求参数打包成数组
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("service", "create_direct_pay_by_user");
		parameters.put("partner", AlipayConfig.PARTNER);
		parameters.put("seller_email", AlipayConfig.SELLER_EMAIL);
		parameters.put("_input_charset", AlipayConfig.INPUT_CHARSET);
		parameters.put("payment_type", payment_type);
		parameters.put("notify_url", notify_url);
		parameters.put("return_url", return_url);
		parameters.put("out_trade_no", out_trade_no);
		parameters.put("subject", subject);
		parameters.put("total_fee", total_fee);
		parameters.put("body", body);
		parameters.put("show_url", show_url);
		parameters.put("anti_phishing_key", anti_phishing_key);
		parameters.put("exter_invoke_ip", exter_invoke_ip);
		parameters.put("extra_common_param", extra_common_param);

		// 建立请求
		String htmlText = AlipaySubmit.buildRequest(parameters, "get", "确认");
		// 保存支付请求记录
		savePayLog(payment, parameters, htmlText);

		return htmlText;
	}

	/**
	 * @param payment
	 * @param parameters
	 * @param htmlText
	 */
	private void savePayLog(Payment payment, Map<String, String> parameters, String htmlText) {
		PayLog payLog = payDao.getPayLogByPayLogId(payment);
		if (null == payLog) {
			payLog = new PayLog();

			// 记录支付编号
			payLog.setPayLogId(Long.parseLong(payment.getOutTradeNo()));

			payLog.setUserId(payment.getUserId());
			payLog.setTradeNo(Long.parseLong(payment.getTradeNo()));
			payLog.setBody(payment.getBody());
			payLog.setTradeType(Integer.parseInt(payment.getTradeType()));
			payLog.setRtnCnt(htmlText);
			payLog.setPayType(payment.getPayType());

			// 记录还款金额
			payLog.setTotal(payment.getTotalFee());

			payLog.setRequestParams(parameters.toString());
			payDao.createPayLog(payLog);
		}

	}

	/**
	 * @param payment
	 */
	private void rebuildPayment(Payment payment) {
		String tradeType = payment.getTradeType();

		// 支付流水编码
		payment.setOutTradeNo(PayStatementUtil.getPayStatement());

		if ("1".equals(tradeType)) {
			BillQuery billQuery = new BillQuery();
			billQuery.setBillId(Long.parseLong(payment.getTradeNo()));
			billQuery = billDao.getBillById(billQuery);
			buildPaymentByBill(payment, billQuery);
		} else if ("2".equals(tradeType)) {
			OrderQuery orderQuery = new OrderQuery();
			orderQuery.setOrderId(Long.parseLong(payment.getTradeNo()));
			orderQuery = orderDao.getOrderById(orderQuery);
			buildPaymentByOrder(payment, orderQuery);
		} else if ("3".equals(tradeType)) {
			OrderQuery orderQuery = new OrderQuery();
			orderQuery.setOrderId(Long.parseLong(payment.getTradeNo()));
			orderQuery = orderDao.getOrderById(orderQuery);
			buildPaymentByOrder(payment, orderQuery);
		}
	}

	/**
	 * @param payment
	 * @param orderQuery
	 */
	private void buildPaymentByOrder(Payment payment, OrderQuery orderQuery) {

		payment.setAttach("tradeType:" + payment.getTradeType() + "#userId:" + orderQuery.getUserId() + "#userStyle:"
				+ payment.getUserStyle() + "#tradeNo:" + payment.getTradeNo());
		// 分期支付订单
		if (orderQuery.getOrderTypes() == 1) {
			payment.setBody(orderQuery.getReceiveName() + "-" + orderQuery.getProductName() + " (首付) ");
			payment.setTotalFee(orderQuery.getFirstPay() + "");
		}
		// 全款支付订单
		if (orderQuery.getOrderTypes() == 2) {
			payment.setBody(orderQuery.getReceiveName() + "-" + orderQuery.getProductName() + " (全款) ");
			payment.setTotalFee(orderQuery.getProductPrice() + "");
		}

		payment.setUserId(orderQuery.getUserId());
	}

	/**
	 * @param payment
	 * @param billQuery
	 * @return
	 */
	private void buildPaymentByBill(Payment payment, BillQuery billQuery) {
		payment.setAttach("tradeType:" + payment.getTradeType() + "#userId:" + billQuery.getUserId() + "#userStyle:"
				+ payment.getUserStyle() + "#tradeNo:" + payment.getTradeNo());
		payment.setBody(billQuery.getReceiveName() + "-" + billQuery.getProductName() + " (" + billQuery.getCurrentMonth() + "/"
				+ billQuery.getMonths() + ")");

		if (payment.getIsEarly() == 1) {
			MallSetting setting = commonDao.getMallSetting("EARLY_PAY_RATE");
			double rate = 1.0;
			if (null != setting) {
				rate = Float.parseFloat(setting.getParamValue());
			}
			double fee = 0;
			// 服务费
			double servicePay = NumberUtil.formatDouble(billQuery.getServicePay() * rate, NumberUtil.DOT_LAST_TWO);
			// 财务费
			double financialPay = 0;
			if (billQuery.getFinancialPay() > 0) {
				financialPay = NumberUtil.formatDouble(billQuery.getFinancialPay() * rate, NumberUtil.DOT_LAST_TWO);
			}
			fee = billQuery.getPrincipal() + servicePay + financialPay;
			payment.setTotalFee(fee + "");
		} else {
			payment.setTotalFee((billQuery.getMonthPay() + billQuery.getLateFines()) + "");
		}

		// payment.setTotalFee((billQuery.getMonthPay() + billQuery.getLateFines()) + "");
		payment.setUserId(billQuery.getUserId());
	}

	@Override
	public boolean savePayRecord(Map<String, String> params) {
		boolean result = false;
		// 1、 更新支付记录
		result = modifyPayLog(params);
		// 2、 更新用户帐单或首付的还款状态
		result = updatePayStatus(params);
		// 3、 更新用户信用信息
		String tradeType = getParamValue(params, "tradeType");
		if ("1".equals(tradeType)) {
			long userId = Long.parseLong(getParamValue(params, "userId"));
			String userStyle = getParamValue(params, "userStyle");

			// 获取帐单
			long billId = Long.parseLong(getParamValue(params, "tradeNo"));
			BillQuery billQuery = new BillQuery();
			billQuery.setBillId(billId);
			BillQuery bill = billDao.getBillById(billQuery);
			double principal = bill.getPrincipal();

			if ("2".equals(userStyle)) {
				CollarQuery cq = collarDao.getCollarByUserId(userId);
				cq.setCreditLimit(cq.getCreditLimit() + principal);
				cq.setUsedCreditLimit(cq.getUsedCreditLimit() - principal);
				collarDao.updateCreditLimit(cq);
			}
			if ("1".equals(userStyle)) {
				MemberQuery mq = memberDao.getMemberByUserId(userId);
				mq.setCreditLimit(mq.getCreditLimit() + principal);
				mq.setUsedCreditLimit(mq.getUsedCreditLimit() - principal);
				memberDao.updateCreditLimit(mq);
			}
		}
		return result;
	}

	/**
	 * 返回params匹配Key的value
	 * 
	 * @param orderMap
	 * @param key
	 * @return
	 */
	public String getParamValue(Map<String, String> params, String key) {
		Map<String, String> map = new HashMap<String, String>();
		String[] ps = ((String) params.get("extra_common_param")).split("#");
		for (String p : ps) {
			String[] pa = p.split(":");
			map.put(pa[0], pa[1]);
		}
		return map.get(key);
	}

	/**
	 * @param params
	 * @return
	 */
	private boolean modifyPayLog(Map<String, String> params) {
		String outTradeNo = params.get("out_trade_no");
		PayLog payLog = new PayLog();
		payLog.setPayLogId(Long.parseLong(outTradeNo));
		payLog.setResponseParams(params.toString());
		payLog.setStatus(2);
		return payDao.updatePayLog(payLog);
	}

	/**
	 * 更新帐单或首付状态
	 * 
	 * @param params
	 * @return boolean
	 */
	private boolean updatePayStatus(Map<String, String> params) {
		String tradeNo = getParamValue(params, "tradeNo");
		String tradeType = getParamValue(params, "tradeType");
		boolean result = false;
		if ("1".equals(tradeType)) {
			BillQuery billQuery = new BillQuery();
			billQuery.setActualPaymentDate(new Date());
			billQuery.setPaymentStatus(2);
			billQuery.setBillId(Long.parseLong(tradeNo));
			result = billDao.updateBillStatus(billQuery);

			// 判断帐单是否最后一期，如果是，将订单状态改为完成状态，如果不是，不改订单状态
			// dealBill(billQuery);
		} else if ("2".equals(tradeType)) {
			OrderQuery orderQuery = new OrderQuery();
			orderQuery.setOrderId(Long.parseLong(tradeNo));
			orderQuery.setFirstPayStatus(2);
			result = orderDao.updateFirstPayStatus(orderQuery);
		} else if ("3".equals(tradeType)) {
			OrderQuery orderQuery = new OrderQuery();
			orderQuery.setOrderId(Long.parseLong(tradeNo));
			orderQuery.setOrderStatus(OrderStatus.PAY_COMMPLETE.getId());
			result = orderDao.updateOrderStatus(orderQuery);
		}
		return result;
	}

	/**
	 * 判断帐单是否最后一期，如果是，将订单状态改为完成状态，如果不是，不改订单状态
	 * 
	 * @param billQuery
	 */
	protected void dealBill(BillQuery billQuery) {
		billQuery = billDao.getBillById(billQuery);
		List<BillQuery> bills = billDao.getBillListByOrderId(billQuery);
		int sum = 0;
		for (BillQuery bill : bills) {
			if (bill.getPaymentStatus() == 1) {
				sum++;
			} else {
				continue;
			}
		}
		if (sum > 0) {
			OrderQuery order = new OrderQuery();
			order.setOrderStatus(OrderStatus.ORDER_COMPLETE.getId());
			order.setOrderId(billQuery.getOrderId());
			orderDao.updateOrderStatus(order);
		}
	}

}
