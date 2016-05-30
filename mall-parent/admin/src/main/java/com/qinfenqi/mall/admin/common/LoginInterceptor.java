package com.qinfenqi.mall.admin.common;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.qinfenqi.mall.admin.system.service.ResourceService;
import com.qinfenqi.mall.common.constant.Constant;
import com.qinfenqi.mall.system.bean.User;

@Component("loginInterceptor")
public class LoginInterceptor extends MethodFilterInterceptor {
	// private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	private static final long serialVersionUID = -595527669236070035L;
	/** 合法请求后缀 */
	public static final String REQUESTURI_SUFFIX = ".do";
	/** 验证失败或超时转向 */
	public static final String TIMEOUT_RESULT = "timeout";
	/** 限制访问转向 */
	public static final String FORBIDDEN_RESULT = "forbidden";

	@Autowired
	public ResourceService resourceService;
	/**
	 * 额外要放开的Action
	 */
	private static final String[] FREE_ACTIONS = { "login.do", "login!logout.do" };

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		String result = TIMEOUT_RESULT;
		String currentURL = getCurrentURL();
		System.out.println("==================== currentURL =====================" + currentURL);
		if (currentURL.endsWith(REQUESTURI_SUFFIX)) {
			for (String action : FREE_ACTIONS) {
				if (currentURL.equals(action)) {
					return invocation.invoke();
				}
			}
			ActionContext ctx = invocation.getInvocationContext();
			User user = (User) ctx.getSession().get(Constant.CURRENT_USER);
			// 如果当前用户未登录过系统
			if (user != null) {
				boolean b = resourceService.isAuthority(user.getRoleId(), currentURL);
				if (b) {
					// 返回请求内容
					return invocation.invoke();
				} else {
					result = FORBIDDEN_RESULT;
				}

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
