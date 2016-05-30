/**
 * 
 */
package com.qinfenqi.mall.admin.system.service;

import java.util.List;

import com.qinfenqi.mall.admin.system.query.RoleQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 上午11:23:14
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface RoleService {

	/**
	 * @param roleQuery 
	 * @return
	 */
	List<RoleQuery> getRoleList(RoleQuery roleQuery);

	/**
	 * @param roleQuery
	 * @return
	 */
	int getRoleCount(RoleQuery roleQuery);

	/**
	 * @return
	 */
	List<RoleQuery> getUserRoleList();

	/**
	 * @param roleQuery
	 * @return
	 */
	boolean addRole(RoleQuery roleQuery);

	/**
	 * @param roleId
	 * @return
	 */
	RoleQuery getRoleById(int roleId);

	/**
	 * @param roleQuery
	 * @return
	 */
	boolean editRole(RoleQuery roleQuery);

	/**
	 * @param roleQuery
	 * @return
	 */
	boolean deleteRole(RoleQuery roleQuery);

}
