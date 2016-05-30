/**
 * 
 */
package com.qinfenqi.mall.admin.system;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.admin.system.query.ResourceQuery;
import com.qinfenqi.mall.admin.system.query.RoleQuery;
import com.qinfenqi.mall.admin.system.service.RoleService;
import com.qinfenqi.mall.common.cache.Cache;
import com.qinfenqi.mall.common.constant.CacheKey;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月17日 上午10:01:48
 * @author Chang Yuxin
 * @version 1.0
 */
public class RoleAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -2169690369252409237L;

	@Resource
	private RoleService roleService;

	private List<RoleQuery> roleList;
	private List<ResourceQuery> resourceList;
	private RoleQuery roleQuery = new RoleQuery();

	/**
	 * 角色管理界面
	 * 
	 * @return
	 */
	public String manage() {
		roleList = roleService.getRoleList(roleQuery);
		double total = roleService.getRoleCount(roleQuery);
		double pageSize = roleQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		roleQuery.setPageTotal(pageTotal);
		roleQuery.setTotal((int) total);
		return "manage";
	}

	/**
	 * 保存角色界面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String saveRolePage() {
		resourceList = (List<ResourceQuery>) Cache.get(CacheKey.RESOURCE_ALL_PREFIX);
		for (int i = 0; i < resourceList.size(); i++) {
			ResourceQuery rq = resourceList.get(i);
			if(rq.getIsEnable() != 1){
				resourceList.remove(i);
				i--;
			}
		}
		int roleId = roleQuery.getRoleId();
		if(roleId > 0){
			roleQuery = roleService.getRoleById(roleQuery.getRoleId());
		}
		return "save";
	}
	
	public String saveRole(){
		int roleId = roleQuery.getRoleId();
		boolean result = false;
		if (roleId == 0) {
			result = roleService.addRole(roleQuery);
		} else {
			result = roleService.editRole(roleQuery);
		}
		JSONObject json = new JSONObject();
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	
	public String deleteRole(){
		JSONObject json = new JSONObject();
		boolean result = roleService.deleteRole(roleQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
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
	 * @return the roleQuery
	 */
	public RoleQuery getRoleQuery() {
		return roleQuery;
	}

	/**
	 * @param roleQuery
	 *            the roleQuery to set
	 */
	public void setRoleQuery(RoleQuery roleQuery) {
		this.roleQuery = roleQuery;
	}

	/**
	 * @return the resourceList
	 */
	public List<ResourceQuery> getResourceList() {
		return resourceList;
	}

	/**
	 * @param resourceList the resourceList to set
	 */
	public void setResourceList(List<ResourceQuery> resourceList) {
		this.resourceList = resourceList;
	}
	
}
