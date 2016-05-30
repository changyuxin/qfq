/**
 * 
 */
package com.qinfenqi.mall.admin.system.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.admin.system.dao.ResourceDao;
import com.qinfenqi.mall.admin.system.dao.RoleDao;
import com.qinfenqi.mall.admin.system.query.ResourceQuery;
import com.qinfenqi.mall.admin.system.query.RoleQuery;
import com.qinfenqi.mall.admin.system.service.RoleService;
import com.qinfenqi.mall.common.cache.Cache;
import com.qinfenqi.mall.common.constant.CacheKey;
import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 上午11:22:39
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("roleservice")
public class RoleServiceImpl implements RoleService, InitializingBean {
	private static final Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
	@Resource
	private RoleDao roleDao;
	@Resource
	private ResourceDao menuDao;

	@Override
	public void afterPropertiesSet() throws Exception {
		// 缓存角色
		cachePermissions();
	}

	/**
	 * 缓存角色
	 */
	private void cachePermissions() {
		List<RoleQuery> roleList = roleDao.getAllRoleList();
		for (RoleQuery roleQuery : roleList) {
			cacheRole(roleQuery);
		}
		logger.info("Caching roles successfully!.............");
	}

	/**
	 * @param roleQuery
	 */
	public void cacheRole(RoleQuery roleQuery) {
		String url = null;
		String key = null;
		ResourceQuery resource = null;
		int[] ids = StringUtil.getIds(roleQuery.getResourceIds());
		Set<String> set = new HashSet<String>();
		for (int id : ids) {
			key = CacheKey.RESOURCE_ID_PREFIX + id;
			if (Cache.containsKey(key)) {
				resource = (ResourceQuery) Cache.get(key);
				url = resource.getUrl();
				if (null != url) {
					set.add(url);
				}
			}
		}
		Cache.put(CacheKey.ROLE_ID_PREFIX + roleQuery.getRoleId(), set);
	}

	@Override
	public List<RoleQuery> getUserRoleList() {
		return roleDao.getUserRoleList();
	}

	@Override
	public List<RoleQuery> getRoleList(RoleQuery roleQuery) {
		return roleDao.getRoleList(roleQuery);
	}

	@Override
	public int getRoleCount(RoleQuery roleQuery) {
		return roleDao.getRoleCount(roleQuery);
	}

	@Override
	public boolean addRole(RoleQuery roleQuery) {
		roleQuery.setResourceNames(getResourceNames(roleQuery));
		roleQuery.setCreateTime(new Date());
		// 缓存角色
		cacheRole(roleQuery);
		return roleDao.createRole(roleQuery);
	}

	/**
	 * 获取资源一级名称
	 * 
	 * @param roleQuery
	 * @return
	 */
	public String getResourceNames(RoleQuery roleQuery) {
		String resourceNames = "";
		String[] ids = roleQuery.getResourceIds().split(Symbol.COMMA);
		for (int i = 0; i < ids.length; i++) {
			ResourceQuery resourceQuery = (ResourceQuery) Cache.get(CacheKey.RESOURCE_ID_PREFIX + ids[i]);
			if (resourceQuery.getIsNav() == 1) {
				resourceNames += resourceQuery.getResourceName() + ",";
			}
		}
		return StringUtil.removeLastComma(resourceNames);

	}

	@Override
	public RoleQuery getRoleById(int roleId) {
		return roleDao.getRoleById(roleId);
	}

	@Override
	public boolean editRole(RoleQuery roleQuery) {
		roleQuery.setResourceNames(getResourceNames(roleQuery));
		// 缓存角色
		String key = CacheKey.ROLE_ID_PREFIX + roleQuery.getRoleId();
		if (Cache.containsKey(key)) {
			Cache.remove(key);
		}
		cacheRole(roleQuery);
		return roleDao.modifyRole(roleQuery);
	}

	@Override
	public boolean deleteRole(RoleQuery roleQuery) {
		// 删除缓存角色
		Cache.remove(CacheKey.ROLE_ID_PREFIX + roleQuery.getRoleId());
		return roleDao.deleteRole(roleQuery);
	}

}
