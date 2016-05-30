/**
 * 
 */
package com.qinfenqi.mall.admin.system.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.admin.system.bean.Resource;
import com.qinfenqi.mall.admin.system.dao.ResourceDao;
import com.qinfenqi.mall.admin.system.dao.RoleDao;
import com.qinfenqi.mall.admin.system.query.ResourceQuery;
import com.qinfenqi.mall.admin.system.service.ResourceService;
import com.qinfenqi.mall.common.cache.Cache;
import com.qinfenqi.mall.common.constant.CacheKey;
import com.qinfenqi.mall.system.bean.User;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月20日 下午2:36:00
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("resourceService")
public class ResourceServiceImpl implements ResourceService, InitializingBean {

	private static final Logger logger = LoggerFactory.getLogger(ResourceServiceImpl.class);
	@Autowired
	private ResourceDao resourceDao;
	@Autowired
	private RoleDao roleDao;

	@Override
	public void afterPropertiesSet() throws Exception {
		// 缓存资源
		cacheResourceList();
	}

	/**
	 * 判断角色是否有该url权限
	 * 
	 * @param roleId
	 * @param url
	 * @return boolean
	 */
	public boolean isAuthority(int roleId, String url) {
		String roleKey = CacheKey.ROLE_ID_PREFIX + roleId;
		boolean result = false;
		if (roleId == -1) {
			result = true;
		} else {
			if (Cache.containsKey(roleKey)) {
				@SuppressWarnings("unchecked")
				Set<String> set = (Set<String>) Cache.get(roleKey);
				result = set.contains(url);
			} else {
				List<ResourceQuery> list = queryResourceList(roleId);
				for (ResourceQuery resource : list) {
					if (null != url && url.equals(resource.getUrl())) {
						result = true;
					}
				}
			}
		}
		return result;
	}

	/**
	 * 缓存资源
	 */
	private void cacheResourceList() {
		List<ResourceQuery> list = resourceDao.getAllResourceList();
		Map<Integer, ResourceQuery> parentResourceMap = new HashMap<Integer, ResourceQuery>();
		for (ResourceQuery resource : list) {
			Cache.put(CacheKey.RESOURCE_ID_PREFIX + resource.getResourceId(), resource);
			Cache.put(CacheKey.RESOURCE_URL_PREFIX + resource.getUrl(), resource);
			if(resource.getParentId() == 0){
				parentResourceMap.put(resource.getResourceId(), resource);
			}
		}
		for (int i = 0; i< list.size(); i++) {
			ResourceQuery resource = list.get(i);
			if(resource.getParentId() > 0 && parentResourceMap.containsKey(resource.getParentId())){
				parentResourceMap.get(resource.getParentId()).addChild(resource);
				list.remove(i);
				i--;
			}
		}
		Cache.put(CacheKey.RESOURCE_ALL_PREFIX, list);
		logger.info("Caching resources successfully!.............");
	}

	/**
	 * 查询用户所拥有的资源
	 * 
	 * @param user
	 * @return List<Menu>
	 */
	public List<ResourceQuery> getUserResourceList(User user) {
		String roleKey = CacheKey.ROLE_ID_PREFIX + user.getRoleId();
		List<ResourceQuery> list = new ArrayList<ResourceQuery>();
		if (Cache.containsKey(roleKey)) {
			@SuppressWarnings("unchecked")
			Set<String> set = (Set<String>) Cache.get(roleKey);
			for (String url : set) {
				ResourceQuery resource = (ResourceQuery) Cache.get(CacheKey.RESOURCE_URL_PREFIX + url);
				if(resource.getIsEnable() == 1){
					list.add(resource);
				}
			}
		} else {
			list = queryResourceList(user.getRoleId());
		}
		return list;
	}

	/**
	 * @param roleId
	 * @return
	 */
	public List<ResourceQuery> queryResourceList(int roleId) {
		String resourceIds = roleDao.getRoleById(roleId).getResourceIds();
		String[] resourceArr = resourceIds.split(",");
		int[] ids = new int[resourceArr.length];
		for (int i = 0, j = resourceArr.length; i < j; i++) {
			ids[i] = Integer.parseInt(resourceArr[i]);
		}
		return resourceDao.getResourceListByIds(ids);
	}

	@Override
	public List<ResourceQuery> getUserNavList(User user) {
		List<ResourceQuery> list = getUserResourceList(user);
		for (int i = 0; i < list.size(); i++) {
			ResourceQuery resource = list.get(i);
			if (resource.getIsNav() != 1) {
				list.remove(i);
				i--;
			}
		}
		Collections.sort(list);
		return list;
	}

	@Override
	public List<ResourceQuery> getResourceList(ResourceQuery resourceQuery) {
		List<ResourceQuery> list = resourceDao.getResourceList(resourceQuery);
		for (ResourceQuery resource : list) {
			String key = CacheKey.RESOURCE_ID_PREFIX + resource.getParentId();
			if (Cache.containsKey(key)) {
				resource.setParentName(((Resource) Cache.get(key)).getResourceName());
			}
		}
		return list;
	}

	@Override
	public int getResourceCount(ResourceQuery resourceQuery) {
		return resourceDao.getResourceCount(resourceQuery);
	}

	@Override
	public boolean addResource(ResourceQuery resourceQuery) {
		boolean result = resourceDao.createResource(resourceQuery);
		cacheResourceList();
		return result;
	}

	@Override
	public ResourceQuery getResourceById(ResourceQuery resourceQuery) {
		String key = CacheKey.RESOURCE_ID_PREFIX + resourceQuery.getResourceId();
		if (Cache.containsKey(key)) {
			return (ResourceQuery) Cache.get(key);
		} else {
			return resourceDao.getResourceById(resourceQuery);
		}
	}

	@Override
	public boolean editResource(ResourceQuery resourceQuery) {
		boolean result = resourceDao.modifyResource(resourceQuery);
		cacheResourceList();
		return result;
	}

	@Override
	public boolean deleteResource(ResourceQuery resourceQuery) {
		boolean result = resourceDao.deleteResource(resourceQuery);
		cacheResourceList();
		return result;
	}
	
	/**
	 * 更新缓存的资源
	 * 
	 * @param resourceQuery
	 */
	public void updateCacheResource(ResourceQuery resourceQuery){
		String idKey = CacheKey.RESOURCE_ID_PREFIX + resourceQuery.getResourceId();
		ResourceQuery resource = (ResourceQuery) Cache.get(idKey);
		resource.setIsEnable(resourceQuery.getIsEnable());
		Cache.put(idKey, resource);
		String urlKey = CacheKey.RESOURCE_ID_PREFIX + resource.getUrl();
		if(Cache.containsKey(urlKey)){
			Cache.remove(urlKey);
		}
		Cache.put(urlKey, resource);
	}
	
	@Override
	public boolean enableResource(ResourceQuery resourceQuery) {
		// updateCacheResource(resourceQuery);
		boolean result = resourceDao.enableResource(resourceQuery);
		cacheResourceList();
		return result;
	}

}
