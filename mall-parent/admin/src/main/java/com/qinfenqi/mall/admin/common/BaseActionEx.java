/**
 * 
 */
package com.qinfenqi.mall.admin.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.qinfenqi.mall.admin.system.query.ResourceQuery;
import com.qinfenqi.mall.admin.system.service.ResourceService;
import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.util.PropertyUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 下午7:54:36
 * @author Chang Yuxin
 * @version 1.0
 */
public class BaseActionEx extends BaseAction {

	/**  */
	private static final long serialVersionUID = -5019762392030347959L;
	@Autowired
	public ResourceService resourceService;
	/** 用户所拥有的菜单 */
	public List<ResourceQuery> resources = new ArrayList<ResourceQuery>();

	/**
	 * 获取当前用户的所有菜单
	 * 
	 * @return List<Menu>
	 */
	public List<ResourceQuery> getCurrentUserResources() {
		resources = resourceService.getUserNavList(getCurrentUser());
		return resources;
	}

	/**
	 * 判断url是否有权限
	 * 
	 * @param url
	 * @return
	 */
	public boolean isPermissionUrl(String url) {
		User user = getCurrentUser();
		return resourceService.isAuthority(user.getRoleId(), url);
	}

	/**
	 * 检查登陆Ip是否属于白名单
	 * 
	 * @return
	 */
	public boolean checkIp(String ip) {
		String[] ips = PropertyUtil.get("WHITE_LIST").split(Symbol.COMMA);
		for (String ipstr : ips) {
			if(ipstr.equals(ip)){
				return true;
			}
		}
		return false;
	}
}
