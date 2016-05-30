/**
 * 
 */
package com.qinfenqi.mall.admin.system.service;

import java.util.List;

import com.qinfenqi.mall.admin.system.query.ResourceQuery;
import com.qinfenqi.mall.system.bean.User;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月20日 下午2:35:09
 * @author Chang Yuxin
 * @version 1.0
 */
public interface ResourceService {
	/**
	 * 根据roleId判断url是否有访问权限
	 * 
	 * @param roleId
	 * @param url
	 * @return
	 */
	boolean isAuthority(int roleId, String url);

	/**
	 * @param user
	 * @return
	 */
	List<ResourceQuery> getUserNavList(User user);

	/**
	 * @param resourceQuery
	 * @return
	 */
	List<ResourceQuery> getResourceList(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	int getResourceCount(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	boolean addResource(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	ResourceQuery getResourceById(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	boolean editResource(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	boolean deleteResource(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	boolean enableResource(ResourceQuery resourceQuery);
}
