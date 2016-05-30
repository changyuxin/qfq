/**
 * 
 */
package com.qinfenqi.mall.pay.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.jdom.JDOMException;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.MallSetting;
import com.qinfenqi.mall.bean.Wxuser;
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
import com.qinfenqi.mall.pay.service.WxpayService;
import com.qinfenqi.mall.pay.util.PayStatementUtil;
import com.qinfenqi.mall.pay.util.wxpay.HttpUtil;
import com.qinfenqi.mall.pay.util.wxpay.WxpayConfig;
import com.qinfenqi.mall.pay.util.wxpay.WxpayUtil;
import com.qinfenqi.mall.pay.util.wxpay.XmlUtil;
import com.qinfenqi.mall.qrcode.QRCodeBuilder;
import com.qinfenqi.mall.util.NumberUtil;
import com.qinfenqi.mall.util.PropertyUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月25日 下午12:26:21
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("wxPayService")
public class WxpayServiceImpl implements WxpayService {

	private static final Logger logger = LoggerFactory.getLogger(WxpayServiceImpl.class);

	@Resource
	private PayDao payDao;
	@Resource
	private BillDao billDao;
	@Resource
	private OrderDao orderDao;
	@Resource
	private MemberDao memberDao;
	@Resource
	private CollarDao collarDao;
	@Resource
	private CommonDao commonDao;

	/**
	 * 创建统一订单
	 * 
	 * @param billQuery
	 */
	@Override
	public Map<String, Object> createUnioOrder(Payment payment, String webroot, String domain) {

		// 1、 根据payment参数trade_type将payment参数补充完整
		rebuildPayment(payment);

		Map<String, Object> map = new HashMap<String, Object>();
		SortedMap<Object, Object> orderMap = new TreeMap<Object, Object>();
		// 1、检查是否已经生成支付订单，
		String codeUrl = null;
		PayLog payLog = payDao.getPayLogByPayLogId(payment);
		// 2、如果已经生成，直接返回code_url,
		if (payLog != null) {
			// 3、 再检查订单生成的code_url是否超过两小时
			long payTime = new DateTime(payLog.getCreateTime()).getMillis() / 1000;
			long currTime = DateTime.now().getMillis() / 1000;
			if (currTime - payTime > 7200) {
				// 4、如果超过两个小时，重新创建支付订单
				orderMap = createPayOrder(payment);
				codeUrl = (String) orderMap.get(WxpayConfig.CODE_URL);
			} else {
				codeUrl = payLog.getRtnCnt();
			}
		} else {
			// 5、如果未生成，则创建支付订单后返回code_url
			orderMap = createPayOrder(payment);
			codeUrl = (String) orderMap.get(WxpayConfig.CODE_URL);
		}
		// 6、保存支付请求记录
		savePayLog(payment, orderMap);
		map.put("rtnCnt", this.createQRCode(codeUrl, webroot, domain));
		map.put("payment", payment);
		return map;
	}

	@Override
	public String checkPayResult(SortedMap<Object, Object> orderMap) {
		logger.info("[Tenpay] pay successfully result is: " + orderMap);
		boolean result = false;
		// 1、验证是否已经支付成功。如果已经成功支付进行下面步骤
		result = validPayResult(orderMap);
		String resultXml = "";
		if (result) {
			PayLog payLog = getPayLog(orderMap);
			logger.info("[Tenpay] payLog: " + payLog);
			result = payLog.getStatus() == 2 ? true : false;
			// 2、如果未成功，则进行以下验证，根据参数验证签名
			if (result == false) {
				// 3、验证签名是否正确
				result = checkSign(orderMap);
				if (result) {
					// 4、更新支付状态
					modifyPayLog(orderMap, payLog);
					// 5、保存微信用户
					saveWxUser(orderMap);
					// 6、更新用户帐单或首付的还款状态
					updatePayStatus(payLog);
					// 7、更新信用
					String tradeType = getParamValue(orderMap, "tradeType");
					if ("1".equals(tradeType)) {
						long userId = Long.parseLong(getParamValue(orderMap, "userId"));
						String userStyle = getParamValue(orderMap, "userStyle");

						// 获取帐单
						long billId = Long.parseLong((String) orderMap.get("out_trade_no"));
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
					// 8、生成返回结果
					resultXml = WxpayUtil.createResponseXML("SUCCESS", "");
				} else {
					resultXml = WxpayUtil.createResponseXML("FAIL", "签名失败");
				}
			}
		}
		return resultXml;
	}

	/**
	 * @param orderMap
	 * @return
	 */
	private boolean validPayResult(SortedMap<Object, Object> orderMap) {
		String returnCode = (String) orderMap.get("result_code");
		if ("SUCCESS".equals(returnCode)) {
			return true;
		}
		if ("FAIL".equals(returnCode)) {
			return false;
		}
		return false;
	}

	/**
	 * 返回orderMap匹配Key的value
	 * 
	 * @param orderMap
	 * @param key
	 * @return
	 */
	public String getParamValue(SortedMap<Object, Object> orderMap, String key) {
		Map<String, String> map = new HashMap<String, String>();
		String[] params = ((String) orderMap.get("attach")).split("&");
		for (String param : params) {
			String[] p = param.split("=");
			map.put(p[0], p[1]);
		}
		return map.get(key);
	}

	/**
	 * @param orderMap
	 * @return
	 */
	private PayLog getPayLog(SortedMap<Object, Object> orderMap) {
		Payment payment = new Payment();
		payment.setOutTradeNo((String)orderMap.get("out_trade_no"));
		return getPayLogByPayLogId(payment);
	}

	/**
	 * 更新帐单或首付状态
	 * 
	 * @param orderMap
	 * @param payLog
	 */
	private void updatePayStatus(PayLog payLog) {
		if (payLog.getTradeType() == 1) {
			BillQuery billQuery = new BillQuery();
			billQuery.setActualPaymentDate(new Date());
			billQuery.setPaymentStatus(2);
			billQuery.setBillId(payLog.getTradeNo());
			billDao.updateBillStatus(billQuery);
			// 判断帐单是否最后一期，如果是，将订单状态改为完成状态，如果不是，不改订单状态
			// dealBill(billQuery);
		} else if (payLog.getTradeType() == 2) {
			OrderQuery orderQuery = new OrderQuery();
			orderQuery.setOrderId(payLog.getTradeNo());
			orderQuery.setFirstPayStatus(2);
			orderDao.updateFirstPayStatus(orderQuery);
		} else if (payLog.getTradeType() == 3) {
			OrderQuery orderQuery = new OrderQuery();
			orderQuery.setOrderId(payLog.getTradeNo());
			orderQuery.setOrderStatus(OrderStatus.PAY_COMMPLETE.getId());
			orderDao.updateOrderStatus(orderQuery);
		}
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

	/**
	 * @param orderMap
	 * @param billQuery
	 */
	protected void saveWxUser(SortedMap<Object, Object> orderMap) {
		Wxuser wxuser = new Wxuser();
		long userId = Long.parseLong(getParamValue(orderMap, "userId"));
		wxuser.setUserId(userId);
		wxuser.setOpenId((String) orderMap.get("openid"));
		wxuser.setIsSubscribe((String) orderMap.get("is_subscribe"));
		payDao.createWxuser(wxuser);
	}

	/**
	 * @param orderMap
	 * @param payLog
	 */
	private void modifyPayLog(SortedMap<Object, Object> orderMap, PayLog payLog) {
		payLog.setPayLogId(Long.parseLong((String) orderMap.get("out_trade_no")));
		payLog.setResponseParams(orderMap.toString());
		payLog.setStatus(2);
		payDao.updatePayLog(payLog);
	}

	/**
	 * 查询支付状态
	 * 
	 * @param payment
	 * @return PayLog
	 */
	public PayLog getPayLogByPayLogId(Payment payment) {
		return payDao.getPayLogByPayLogId(payment);
	}

	/**
	 * 检查签名
	 * 
	 * @param orderMap
	 * @return
	 */
	private boolean checkSign(SortedMap<Object, Object> orderMap) {
		boolean result = false;
		String sign = (String) orderMap.get("sign");
		orderMap.remove("sign");
		String signTmp = WxpayUtil.createSign(WxpayConfig.INPUT_CHARSET, orderMap);
		if (sign.equals(signTmp)) {
			result = true;
		}
		return result;
	}

	/**
	 * 
	 * @param payment
	 * @param orderMap
	 * @param user
	 */
	private void savePayLog(Payment payment, SortedMap<Object, Object> orderMap) {
		PayLog payLog = getPayLogByPayLogId(payment);
		if (null == payLog) {
			payLog = new PayLog();

			// 记录支付编号
			payLog.setPayLogId(Long.parseLong(payment.getOutTradeNo()));

			payLog.setUserId(payment.getUserId());
			payLog.setTradeNo(Long.parseLong(payment.getTradeNo()));
			payLog.setBody(payment.getBody());
			payLog.setTradeType(Integer.parseInt(payment.getTradeType()));
			payLog.setRtnCnt((String) orderMap.get(WxpayConfig.CODE_URL));
			payLog.setPayType(payment.getPayType());

			// 记录还款金额
			payLog.setTotal(Double.parseDouble(payment.getTotalFee()) / 100 + "");

			payLog.setRequestParams(orderMap.toString());
			payDao.createPayLog(payLog);
		}
	}

	/**
	 * @param codeUrl
	 * @param webroot
	 * @param domain
	 * @return
	 */
	private String createQRCode(String codeUrl, String webroot, String domain) {
		DateTime dt = new DateTime();
		String qrcodeImg = "images/qrcode/" + dt.getYear() + "/" + dt.getMonthOfYear() + "/" + dt.getDayOfMonth() + "/";
		String fileName = java.util.UUID.randomUUID().toString() + ".png"; // 采用时间+UUID的方式随即命名
		File qrcodeFile = new File(webroot, qrcodeImg);
		if (qrcodeFile.exists() == false) {
			qrcodeFile.mkdirs();
		}
		String qrcodeImgPath = webroot + qrcodeImg + fileName;
		if (null != codeUrl) {
			QRCodeBuilder.build(170, 170, qrcodeImgPath, codeUrl);
		}
		String qrcodeImgUrl = domain + qrcodeImg + fileName;
		logger.info("=====================        qrcodeImgUrl         =================== " + qrcodeImgUrl);
		return qrcodeImgUrl;
	}

	/**
	 * @param payment
	 * @return
	 */
	private SortedMap<Object, Object> createPayOrder(Payment payment) {
		String requestContent = WxpayUtil.createRequestXml(createParameters(payment));
		String result = null;
		SortedMap<Object, Object> orderMap = new TreeMap<Object, Object>();
		try {
			result = HttpUtil.httpRequest(WxpayConfig.UNIFIED_ORDER_URL, "POST", requestContent);
			orderMap = XmlUtil.doXMLParse(result);
			if ("SUCCESS".equals(orderMap.get("result_code"))) {
				logger.info("[Tenpay] create pay order successfully! Return content is: " + orderMap);
			} else {
				logger.info("[Tenpay] create pay order failure!.....");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JDOMException e) {
			e.printStackTrace();
		}
		return orderMap;
	}

	/**
	 * @param payment
	 * @return SortedMap<Object, Object
	 */
	public SortedMap<Object, Object> createParameters(Payment payment) {
		SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();
		parameters.put("appid", WxpayConfig.APP_ID);
		parameters.put("attach", payment.getAttach());
		parameters.put("body", payment.getBody());
		parameters.put("device_info", WxpayConfig.DEVICE_INFO);
		parameters.put("mch_id", WxpayConfig.MCH_ID);
		parameters.put("nonce_str", WxpayUtil.CreateNoncestr(32));
		parameters.put("notify_url", WxpayConfig.NOTIFY_URL);
		parameters.put("out_trade_no", payment.getOutTradeNo());
		if (PropertyUtil.getInt("TEST_PAY", 1) == 1) {
			parameters.put("total_fee", 1 + "");
		} else {
			parameters.put("total_fee", payment.getTotalFee());
		}
		parameters.put("product_id", payment.getOutTradeNo());
		parameters.put("spbill_create_ip", WxpayConfig.SPBILL_CREATE_IP);
		parameters.put("trade_type", WxpayConfig.TRADE_TYPE);
		parameters.put("sign", WxpayUtil.createSign(WxpayConfig.INPUT_CHARSET, parameters));
		logger.info("=====================   send  parameters         =================== " + parameters);
		return parameters;
	}

	/**
	 * @param payment
	 */
	private void rebuildPayment(Payment payment) {
		String tradeType = payment.getTradeType();
		// 支付流水编码
		payment.setOutTradeNo(PayStatementUtil.getPayStatement());

		// 根据交易类型进行处理
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
		payment.setAttach("tradeType=" + payment.getTradeType() + "&userId=" + orderQuery.getUserId() + "&userStyle="
				+ payment.getUserStyle() + "&tradeNo=" + payment.getTradeNo());

		// 分期支付订单
		if (orderQuery.getOrderTypes() == 1) {
			payment.setBody(orderQuery.getReceiveName() + "-" + orderQuery.getProductName() + " (首付) ");
			payment.setTotalFee(Math.round(orderQuery.getFirstPay() * 100) + "");
		}
		// 全款支付订单
		if (orderQuery.getOrderTypes() == 2) {
			payment.setBody(orderQuery.getReceiveName() + "-" + orderQuery.getProductName() + " (全款) ");
			payment.setTotalFee(Math.round(orderQuery.getProductPrice() * 100) + "");
		}

		payment.setUserId(orderQuery.getUserId());

	}

	/**
	 * @param payment
	 * @param billQuery
	 * @return
	 */
	private void buildPaymentByBill(Payment payment, BillQuery billQuery) {
		payment.setAttach("tradeType=" + payment.getTradeType() + "&userId=" + billQuery.getUserId() + "&userStyle="
				+ payment.getUserStyle() + "&tradeNo=" + payment.getTradeNo());
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
			payment.setTotalFee(Math.round(fee * 100) + "");
		} else {
			payment.setTotalFee(Math.round((billQuery.getMonthPay() + billQuery.getLateFines()) * 100) + "");
		}
		// payment.setTotalFee(Math.round((billQuery.getMonthPay() + billQuery.getLateFines()) * 100) + "");
		payment.setUserId(billQuery.getUserId());
	}

}
