package com.qinfenqi.mall.pay.util.wxpay;

public class WxpayConfig {
	
	public static final String CODE_URL = "code_url";
	public static final String SPBILL_CREATE_IP = "101.200.234.70";
	public static final String DEVICE_INFO = "WEB";
	public static final String TRADE_TYPE = "NATIVE";
	public static final String INPUT_CHARSET = "UTF-8";
	
	/**
	 * 服务号相关信息
	 */
	public static final String APP_ID = "wx4c7aabf3b2ee0877";// 服务号的应用号
	public static final String APP_SECRECT = "1ed2167d1dd1964e8d4af43ab07b83e7";// 服务号的应用密码
	public static final String TOKEN = "weixinCourse";// 服务号的配置token
	public static final String MCH_ID = "1243100102";// 商户号
	public static final String API_KEY = "Ym19790612Ygl19710924Cyx19781205";// API密钥
	public static final String ENCODING_AES_KEY = "RaiwjfkcFtHxOxcqNcsfFfBPjkQ3mDkX4qrSD6dDXXc";// EncodingAESKey
	public static final String SIGN_TYPE = "MD5";// 签名加密方式
	public static final String NOTIFY_URL = "http://www.qinfenqi.com/pay/wxpayNotifyPage.html";// 微信支付反馈结果地址
	
	/**
	 * 微信支付接口地址
	 */
	// 微信支付统一接口(POST)
	public static final String UNIFIED_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	// 微信退款接口(POST)
	public static final String REFUND_URL = "https://api.mch.weixin.qq.com/secapi/pay/refund";
	// 订单查询接口(POST)
	public static final String CHECK_ORDER_URL = "https://api.mch.weixin.qq.com/pay/orderquery";
	// 关闭订单接口(POST)
	public static final String CLOSE_ORDER_URL = "https://api.mch.weixin.qq.com/pay/closeorder";
	// 退款查询接口(POST)
	public static final String CHECK_REFUND_URL = "https://api.mch.weixin.qq.com/pay/refundquery";
	// 对账单接口(POST)
	public static final String DOWNLOAD_BILL_URL = "https://api.mch.weixin.qq.com/pay/downloadbill";
	// 短链接转换接口(POST)
	public static final String SHORT_URL = "https://api.mch.weixin.qq.com/tools/shorturl";
	// 接口调用上报接口(POST)
	public static final String REPORT_URL = "https://api.mch.weixin.qq.com/payitil/report";
}
