/**
 * 
 */
package com.qinfenqi.mall.admin.system;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.admin.system.query.ResourceQuery;
import com.qinfenqi.mall.admin.system.service.ResourceService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月22日 上午9:15:26
 * @author Chang Yuxin
 * @version 1.0
 */
public class ResourceAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -2409239998060901033L;
	@Autowired
	private ResourceService resourceService;

	private ResourceQuery resourceQuery = new ResourceQuery();

	private List<ResourceQuery> navResources;

	private List<ResourceQuery> resourceList;

	/**
	 * 资源管理界面
	 * 
	 * @return
	 */
	public String manage() {
		resourceList = resourceService.getResourceList(resourceQuery);
		double total = resourceService.getResourceCount(resourceQuery);
		double pageSize = resourceQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		resourceQuery.setPageTotal(pageTotal);
		resourceQuery.setTotal((int) total);

		// 查询所有一级导航
		ResourceQuery rq = new ResourceQuery();
		rq.setIsNav(1);
		rq.setPage(false);
		navResources = resourceService.getResourceList(rq);
		return "manage";
	}
	
	/**
	 * 保存资源界面
	 * 
	 * @return
	 */
	public String saveResourcePage() {
		long resourceId = resourceQuery.getResourceId();
		if (resourceId > 0) {
			resourceQuery = resourceService.getResourceById(resourceQuery);
		}
		
		// 查询所有一级导航
		ResourceQuery rq = new ResourceQuery();
		rq.setIsNav(1);
		rq.setPage(false);
		navResources = resourceService.getResourceList(rq);
		return "save";
	}

	/**
	 * 保存资源
	 * 
	 * @return
	 */
	public String saveResource() {
		long resourceId = resourceQuery.getResourceId();
		boolean result = false;
		if (resourceId == 0) {
			result = resourceService.addResource(resourceQuery);
		} else {
			result = resourceService.editResource(resourceQuery);
		}
		JSONObject json = new JSONObject();
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 删除资源
	 * 
	 * @return
	 */
	public String deleteResource() {
		JSONObject json = new JSONObject();
		boolean result = resourceService.deleteResource(resourceQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 启用、停用
	 * 
	 * @return
	 */
	public String enableResource() {
		JSONObject json = new JSONObject();
		boolean result = resourceService.enableResource(resourceQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * @return the resourceQuery
	 */
	public ResourceQuery getResourceQuery() {
		return resourceQuery;
	}

	/**
	 * @param resourceQuery
	 *            the resourceQuery to set
	 */
	public void setResourceQuery(ResourceQuery resourceQuery) {
		this.resourceQuery = resourceQuery;
	}

	/**
	 * @return the navResources
	 */
	public List<ResourceQuery> getNavResources() {
		return navResources;
	}

	/**
	 * @param navResources
	 *            the navResources to set
	 */
	public void setNavResources(List<ResourceQuery> navResources) {
		this.navResources = navResources;
	}

	/**
	 * @return the resourceList
	 */
	public List<ResourceQuery> getResourceList() {
		return resourceList;
	}

	/**
	 * @param resourceList
	 *            the resourceList to set
	 */
	public void setResourceList(List<ResourceQuery> resourceList) {
		this.resourceList = resourceList;
	}

}
