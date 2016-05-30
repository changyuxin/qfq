package com.qinfenqi.mall.view.common;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.qinfenqi.mall.common.constant.Constant;

@Component("loginInterceptor")
public class LoginInterceptor extends MethodFilterInterceptor {
	// private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	private static final long serialVersionUID = -595527669236070035L;
	/** 合法请求后缀 */
	public static final String REQUESTURI_SUFFIX = ".do";
	/** 验证失败或超时转向 */
	public static final String INDEX = "index/index!indexPage.do";
	/** 限制访问转向 */
	public static final String FORBIDDEN_RESULT = "forbidden";

	/**
	 * 额外要放开的Action
	 */
	protected static final String[] FREE_ACTIONS = {
			// Login
			"login.do",
			"login!logout.do",
			"login/login!regist.do",
			"login/login!userLogin.do",
			"login/login!checkRegist.do",
			"login/login!getMobileCode.do",
			"login/login!checkMobileCode.do",
			"login/login!userRegist.do",
			"login/login!findpwd.do",
			"login/login!checkValidateCode.do",
			"login/login!modifyPwdJsp.do",
			"login/login!updatePwd.do",
			"login/login!findpwdfinish.do",
			
			// Index
			"index/index!indexPage.do",
			"index/index!getProductList.do",
			"index/index!statement.do",
			
			// White collar
			//"collar/collar!infoPage.do",
			"collar/collar!regist.do",
			//"collar/collar!collarInfoImprove.do",
			"collar/collar!checkAuthCode.do",
			"collar/collar!collarRegist.do",
			
			
			// Error
			"error/error!error404.do",
			"error/error!error500.do",
			
			// Tenpay
			"pay/pay!wxpayNotifyPage.do",
			
			// Alipay
			"pay/pay!alipayNotifyPage.do",
			
			// Product
			"product/product!queryProduct.do", 
			"product/product!showProdList.do",
			"product/product!cacuMonthPay.do",
			"product/product!showProDetail.do",
			"product/product!getRecommends.do",
			"product/product!queryProductListByCon.do",
			
			// Product
			"product/product!showfreeProDetail.do",
			
			// Channel
			"channel/channel!employ.do",
			"channel/channel!zero.do",
			"channel/channel!preorder.do",
			"channel/channel!eleven.do",
			"channel/channel!apple.do",
			"channel/channel!free.do",
			
			//activity
			"activity/activity!rule.do",
			"activity/activity!detail.do",
			
			// Wechat 
			"weixin/weixin!exchange.do",
			
			// Help
			"help/help!statement.do", 
			"help/help!account.do", 
			"help/help!aboutus.do", 
			"help/help!joinus.do", 
			"help/help!how.do", 
			"help/help!most.do",
			"help/help!limit.do", 
			"help/help!audit.do", 
			"help/help!returnProd.do", 
			"help/help!promise.do", 
			"help/help!product.do",
			"help/help!order.do", 
			"help/help!consult.do", 
			"help/help!link.do", 
			"help/help!invoice.do", 
			"help/help!wechatpay.do",
			"help/help!faq.do", 
			"help/help!shopping.do", 
			"help/help!business.do", 
			"help/help!agreement.do", 
			"help/help!payment.do",
			"help/help!freight.do", 
			"help/help!payment.do", 
			"help/help!zeropay.do", 
			"help/help!whocan.do", 
			"help/help!contactus.do", 
			
			// Center
			"center/center!updateMemberMail.do",
			"center/center!getValidateCode.do",
			"center/center!getPhoneValidateCode.do",
			"center/center!idCardValid.do"
		};

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		String result = INDEX;
		String currentURL = getCurrentURL();
		System.out.println("=======================currentURL ====================== " + currentURL + "===============================");
		if (currentURL.endsWith(REQUESTURI_SUFFIX)) {
			for (String action : FREE_ACTIONS) {
				if (currentURL.equals(action)) {
					return invocation.invoke();
				}
			}
			ActionContext ctx = invocation.getInvocationContext();
			// 如果当前用户未登录过系统
			if (ctx.getSession().get(Constant.CURRENT_USER) != null) {
				// 返回请求内容
				return invocation.invoke();
			} 
			else 
			{
				return "login";
			}
		}
		return result;

	}

	/**
	 * 获取当前url
	 * 
	 * @return String
	 */
	public String getCurrentURL() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String currentURL = request.getRequestURI();
		String contextPath = request.getContextPath();
		if (currentURL.startsWith(contextPath)) {
			currentURL = currentURL.replaceFirst(contextPath + "/", "");
		}

		return currentURL;
	}

	/**
	 * 获取当前请求参数的Json
	 * 
	 * @return String
	 */
	public String getCurrentParameters() {
		String parameterJson = "";
		JSONObject json = new JSONObject();
		HttpServletRequest request = ServletActionContext.getRequest();
		Enumeration<?> parameterEnum = request.getParameterNames();
		while (parameterEnum.hasMoreElements()) {
			String paramName = (String) parameterEnum.nextElement();
			String[] values = request.getParameterValues(paramName);
			for (int i = 0; i < values.length; i++) {
				json.put(paramName, values);
			}
		}
		if (json.size() > 0) {
			parameterJson = json.toString();
		}
		return parameterJson;
	}

}
