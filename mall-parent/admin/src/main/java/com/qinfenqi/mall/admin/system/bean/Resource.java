/**
 * 
 */
package com.qinfenqi.mall.admin.system.bean;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 下午5:17:53
 * @author Chang Yuxin
 * @version 1.0
 */
public class Resource extends BaseBean implements Comparable<Resource>{

	/** 资源ID */
	private int resourceId;
	/** 资源名称 */
	private String resourceName;
	/** 上级资源ID */
	private int parentId;
	/** 资源url */
	private String url;
	/** 是否为公共资源(不做权限判断，登录成功之后，就可访问) 1 是 0 非 */
	private int isCommon;
	/** 是否为导航 0 非 1 是 */
	private int isNav;
	/** 是否为按钮 0 非 1 是 */
	private int isButton;
	/** 是否记录日志 0 非 1 是 */
	private int isLog;
	/** 导航序号 */
	private int navOrder;
	/** 是否启用  0:否 1:是 */
	private int isEnable;

	public int getResourceId() {
		return resourceId;
	}

	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getIsCommon() {
		return isCommon;
	}

	public void setIsCommon(int isCommon) {
		this.isCommon = isCommon;
	}

	public int getIsNav() {
		return isNav;
	}

	public void setIsNav(int isNav) {
		this.isNav = isNav;
	}

	public int getIsButton() {
		return isButton;
	}

	public void setIsButton(int isButton) {
		this.isButton = isButton;
	}

	public int getIsLog() {
		return isLog;
	}

	public void setIsLog(int isLog) {
		this.isLog = isLog;
	}

	/**
	 * @return the navOrder
	 */
	public int getNavOrder() {
		return navOrder;
	}

	/**
	 * @param navOrder the navOrder to set
	 */
	public void setNavOrder(int navOrder) {
		this.navOrder = navOrder;
	}

	/**
	 * @return the isEnable
	 */
	public int getIsEnable() {
		return isEnable;
	}

	/**
	 * @param isEnable the isEnable to set
	 */
	public void setIsEnable(int isEnable) {
		this.isEnable = isEnable;
	}

	@Override
	public int compareTo(Resource o) {
		return this.navOrder - o.getNavOrder();
	}
}
