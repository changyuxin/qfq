/**
 * 
 */
package com.qinfenqi.mall.view.login;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;

import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.member.service.MemberService;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.system.service.UserService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月4日 上午9:35:12
 * @author Chang Yuxin
 * @version 1.0
 */
public class LoginAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = 6029336344794945384L;
	private static final String VALIDATE_CODE_KEY = "validateCode";

	@Resource
	private UserService userService;
	@Resource
	private MemberService memberService;

	private UserQuery userQuery;

	/** 会员实体 */
	private MemberQuery memberQuery = new MemberQuery();

	/** 错误信息 */
	private String message = "";

	/** 验证码 */
	private String validateCode;
	private String password;
	private String password2;

	public String login() {
		return "index";
	}

	public String regist() {
		return "regist";
	}

	/**
	 * 忘记密码
	 */
	public String findpwd() {
		return "findpwd";
	}

	/**
	 * 进入忘记密码-设置新密码页面
	 * 
	 * @return
	 */
	public String modifyPwdJsp() {

		return "modifyPwdJsp";
	}

	/**
	 * 忘记密码-保存设置的新密码
	 */
	public void updatePwd() {

		int rtn = 0;
		if (null != password && password.trim().length() > 0) {
			List<User> userList = new ArrayList<User>();
			userList = userService.getUserByUserName(userQuery.getUserName());
			if (null == userList || userList.size() == 0) {
				rtn = -2;// 用户不存在
			}
		}

		if (rtn == 0) {
			// 更新密码
			userQuery.setPassword(password.trim());
			if (userQuery != null) {
				rtn = userService.updateUserPasswordByPhone(userQuery);
				if (rtn < 0) {
					rtn = -3; // 更新密码出错
				}
			}
		}

		ajaxResponse(rtn + "");

	}

	/**
	 * 跳转到找回密码完成页面
	 * 
	 * @return
	 */
	public String findpwdfinish() {

		return "findpwdfinish";

	}

	public String checkValidateCode() {

		JSONObject json = new JSONObject();
		json.put("code", 0);

		if (validateCode == null || validateCode.length() == 0) {
			json.put("code", -1);
		} else {
			if (!session.get(VALIDATE_CODE_KEY).equals(validateCode.toLowerCase())) {
				json.put("code", -2);
			}
		}

		ajaxReturnValue = json.toString();

		return AJAX;
	}

	/**
	 * 注册
	 * 
	 * @return
	 */
	public String userRegist() {
		JSONObject json = new JSONObject();
		userQuery.setRegisterIp(request.getRemoteAddr());
		List<User> users = userService.getUserByUserName(userQuery.getUserName());
		String message = "";
		if(users.size() == 0){
			userService.createUser(userQuery);
			getUserLoginInfo(userQuery);
			// 更新当前登录用户的登录信息
			userService.updateUser(userQuery);
			// 保存用户到session
			setCurrentUser(userQuery);
		} else {
			message = "已经注册，无需再注册!";
		}
		json.put("result", StringUtils.isNotBlank(message) ? FAILURE : SUCCESS);
		json.put("message", message);
		ajaxReturnValue = json.toString();
		return AJAX;

	}

	/**
	 * 验证手机号是否注册过
	 * 
	 * @return
	 */
	public String checkRegist() {
		JSONObject json = new JSONObject();
		List<User> users = userService.getUserByUserName(userQuery.getUserName());
		json.put("result", users.size() > 0 ? FAILURE : SUCCESS);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 生成短信验证码
	 * 
	 * @return String
	 */
	public String getMobileCode() {
		JSONObject json = new JSONObject();
		boolean result = userService.createMobileCode(userQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 验证短信验证码
	 * 
	 * @return String
	 */
	public String checkMobileCode() {
		JSONObject json = new JSONObject();
		boolean result = userService.checkMobileCode(userQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 登录
	 * 
	 * @return String
	 */

	public String userLogin() {
		JSONObject json = new JSONObject();
		List<User> users = userService.getUserByUserName(userQuery.getUserName());
		if (users == null || users.size() == 0) {
			message = "账号不存在!";
		} else {
			User user = users.get(0);
			if (user.getPassword().equals(userQuery.getPassword()) == false) {
				message = "密码不正确!";
			} else {
				user.setPassword(null);
				// 将上次当前登陆的属性保存到上次登录的属性中
				user.setLastLoginIp(user.getCurrentLoginIp());
				user.setLastLoginTime(user.getCurrentLoginTime());
				setCurrentUser(user);
			}
			getUserLoginInfo(user);
			// 更新当前登录用户的登录信息
			userService.updateUser(user);
			// userService.saveLog(user, message);// 记录登录日志
		}
		json.put("result", StringUtils.isNotBlank(message) ? FAILURE : SUCCESS);
		json.put("message", message);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 用户退出
	 * 
	 * @return
	 */
	public String logout() {
		User user = getCurrentUser();
		if (user != null) {
			// TODO
			// userService.saveLog(user, "用户退出");//记录用户退出日志
		}
		request.getSession().invalidate();
		JSONObject json = new JSONObject();
		json.put("result", SUCCESS);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * @return the userQuery
	 */
	public UserQuery getUserQuery() {
		return userQuery;
	}

	/**
	 * @param userQuery
	 *            the userQuery to set
	 */
	public void setUserQuery(UserQuery userQuery) {
		this.userQuery = userQuery;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return the memberQuery
	 */
	public MemberQuery getMemberQuery() {
		return memberQuery;
	}

	/**
	 * @param memberQuery
	 *            the memberQuery to set
	 */
	public void setMemberQuery(MemberQuery memberQuery) {
		this.memberQuery = memberQuery;
	}

	/**
	 * @return the validateCode
	 */
	public String getValidateCode() {
		return validateCode;
	}

	/**
	 * @param validateCode
	 *            the validateCode to set
	 */
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the password2
	 */
	public String getPassword2() {
		return password2;
	}

	/**
	 * @param password2
	 *            the password2 to set
	 */
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
}
