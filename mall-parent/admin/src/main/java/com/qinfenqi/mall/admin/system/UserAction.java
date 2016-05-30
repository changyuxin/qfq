/**
 * 
 */
package com.qinfenqi.mall.admin.system;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.admin.system.query.DeptQuery;
import com.qinfenqi.mall.admin.system.query.RoleQuery;
import com.qinfenqi.mall.admin.system.service.DeptService;
import com.qinfenqi.mall.admin.system.service.RoleService;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.system.service.UserService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 上午11:04:24
 * @author Chang Yuxin
 * @version 1.0
 */
public class UserAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = 6333699769057096333L;
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	@Resource
	private DeptService deptService;
	private List<UserQuery> userList;

	private UserQuery userQuery = new UserQuery();

	private List<RoleQuery> roleList;
	
	private List<DeptQuery> deptList;

	/**
	 * 后台用户管理界面
	 * 
	 * @return
	 */
	public String manage() {

		userList = userService.getUserList(userQuery);
		double total = userService.getUserCount(userQuery);
		double pageSize = userQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		userQuery.setPageTotal(pageTotal);
		userQuery.setTotal((int) total);

		return "manage";
	}

	/**
	 * 保存用户界面
	 */
	public String saveUserPage() {
		roleList = roleService.getUserRoleList();
		deptList = deptService.getDeptList();
		long userId = userQuery.getUserId();
		if(userId > 0){
			userQuery = userService.getUserByUserId(userQuery);
		}
		return "save";
	}

	/**
	 * 保存用户
	 * 
	 * @return
	 */
	public String saveUser() {
		long userId = userQuery.getUserId();
		boolean result = false;
		if (userId == 0) {
			result = userService.addUser(userQuery);
		} else {
			result = userService.editUser(userQuery);
		}
		JSONObject json = new JSONObject();
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;

	}
	
	/**
	 * 删除用户
	 * 
	 * @return
	 */
	public String deleteUser(){
		JSONObject json = new JSONObject();
		boolean result = userService.deleteUser(userQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	/**
	 * 启用、停用用户
	 * 
	 * @return
	 */
	public String enableUser(){
		JSONObject json = new JSONObject();
		boolean result = userService.enableUser(userQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
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
	 * @return the roleList
	 */
	public List<RoleQuery> getRoleList() {
		return roleList;
	}

	/**
	 * @param roleList
	 *            the roleList to set
	 */
	public void setRoleList(List<RoleQuery> roleList) {
		this.roleList = roleList;
	}

	/**
	 * @return the deptList
	 */
	public List<DeptQuery> getDeptList() {
		return deptList;
	}

	/**
	 * @param deptList the deptList to set
	 */
	public void setDeptList(List<DeptQuery> deptList) {
		this.deptList = deptList;
	}

}
