/**
 * 
 */
package com.qinfenqi.mall.admin;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.admin.system.query.RoleQuery;
import com.qinfenqi.mall.admin.system.service.RoleService;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.service.UserService;
import com.qinfenqi.mall.util.PropertyUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 上午11:03:19
 * @author Chang Yuxin
 * @version 1.0
 */
public class LoginAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -5519571465632379991L;

	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	
	/** 用户名 */
	private String userName = "";
	
	/** 用户密码 */
	private String password = "";
	
	/** 错误信息 */
	private String message = "";
	
	public String execute() throws Exception {
		JSONObject json = new JSONObject();
		userName = userName.trim();
		String ip = request.getRemoteAddr();
		if(checkIp(ip) == false && PropertyUtil.getInt("IPCHECK") == 1){
			message = "您目前访问的地址无效!";
		} else {
			if (StringUtils.isBlank(userName) || StringUtils.isBlank(password)) {
				return LOGIN;
			} else {
				List<User> users = userService.getUserByUserName(userName);
				if (users == null || users.size() == 0) {
					message = "账号不存在!";
				} else {
					User user = users.get(0);
					if (user.getUserStyle() > 0){
						message = "此帐号非后台管理帐号，不能登陆!";
					} 
					if(user.getPassword().equals(password) == false) {
						message = "密码不正确!";
					} 
					if (user != null && user.getIsDelete() == 2){
						message = "帐户删除，请咨询系统管理员!";
					} 
					if (user != null && user.getUserStatus() == 2) {
						message = "帐户已停用，请咨询系统管理员!";
					} else {
						RoleQuery role = roleService.getRoleById(user.getRoleId());
						if(null == role){
							message = "帐户所使用的角色已经被删除，请咨询系统管理员!";
						} else {
							user.setPassword(null);
							// 将上次当前登陆的属性保存到上次登录的属性中
							user.setLastLoginIp(user.getCurrentLoginIp());
							user.setLastLoginTime(user.getCurrentLoginTime());
							setCurrentUser(user);
							getUserLoginInfo(user);
							// 更新当前登录用户的登录信息
							userService.updateUser(user);
							// userService.saveLog(user, message);// 记录登录日志
						}
					}
				}
			}
		}
		json.put("result", StringUtils.isNotBlank(message) ? FAILURE : SUCCESS);
		json.put("message", message);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	
	/**
	 * 用户退出 
	 * @return
	 */
	public String logout(){ 
		User user = getCurrentUser();
		if (user != null) {
			//userService.saveLog(user, "用户退出");//记录用户退出日志
		}
		request.getSession().invalidate();
		return LOGIN;
	}
	

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

}
