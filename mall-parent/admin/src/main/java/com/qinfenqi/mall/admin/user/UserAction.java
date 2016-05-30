/**
 * 
 */
package com.qinfenqi.mall.admin.user;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.system.service.UserService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年8月10日 上午10:59:26
 * @author Chang Yuxin
 * @version 1.0
 */
public class UserAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = 7019594951775848845L;
	@Resource
	private UserService userService;

	private UserQuery userQuery = new UserQuery();
	private List<UserQuery> userList;
	private String countStr;

	/**
	 * 用户管理首页
	 * 
	 * @return
	 */
	public String index() {
		countStr = userService.getAllUserCounts();
		return "index";
	}

	/**
	 * 用户列表
	 * 
	 * @return
	 */
	public String getUserPage() {
		userQuery.setOrderField("create_time");
		userList = userService.getAllUserList(userQuery);
		double total = userService.getAllUserCount(userQuery);
		double pageSize = userQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		userQuery.setPageTotal(pageTotal);
		userQuery.setTotal((int) total);
		return "manage";
	}

	/**
	 * 跟踪用户记录
	 * 
	 * @return
	 */
	public String traceRecordPage() {
		return "trace";
	}
	
	
	public String saveTraceRecord(){
		JSONObject json = new JSONObject();
		boolean result = userService.saveTraceRecord(userQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	
	/**
	 * 查看用户
	 * @return
	 */
	public String showUserInfo(){
		userQuery = userService.getUserByUserId(userQuery);
		return "detail";
	}
	
	/**
	 * 删除用户
	 * @return
	 */
	public String deleteUser(){
		JSONObject json = new JSONObject();
		boolean result = userService.deleteActualUser(userQuery);
		json.put("result", result ? SUCCESS : FAILURE);
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
	 * @return the userList
	 */
	public List<UserQuery> getUserList() {
		return userList;
	}

	/**
	 * @param userList
	 *            the userList to set
	 */
	public void setUserList(List<UserQuery> userList) {
		this.userList = userList;
	}

	/**
	 * @return the countStr
	 */
	public String getCountStr() {
		return countStr;
	}

	/**
	 * @param countStr
	 *            the countStr to set
	 */
	public void setCountStr(String countStr) {
		this.countStr = countStr;
	}

}
