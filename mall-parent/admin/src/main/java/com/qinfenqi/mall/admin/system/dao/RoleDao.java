/**
 * 
 */
package com.qinfenqi.mall.admin.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.admin.system.query.RoleQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 下午5:47:22
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface RoleDao {

	/**
	 * @param roleId
	 * @return List<RoleQuery>
	 */
	RoleQuery getRoleById(int roleId);

	/**
	 * @return List<RoleQuery>
	 */
	List<RoleQuery> getAllRoleList();

	/**
	 * @return List<RoleQuery>
	 */
	List<RoleQuery> getUserRoleList();

	/**
	 * @param roleQuery
	 * @return List<RoleQuery>
	 */
	List<RoleQuery> getRoleList(RoleQuery roleQuery);

	/**
	 * @param roleQuery
	 * @return List<RoleQuery>
	 */
	int getRoleCount(RoleQuery roleQuery);

	/**
	 * @param roleQuery
	 * @return
	 */
	boolean createRole(RoleQuery roleQuery);

	/**
	 * @param roleQuery
	 * @return
	 */
	boolean modifyRole(RoleQuery roleQuery);

	/**
	 * @param roleQuery
	 * @return
	 */
	boolean deleteRole(RoleQuery roleQuery);

}
