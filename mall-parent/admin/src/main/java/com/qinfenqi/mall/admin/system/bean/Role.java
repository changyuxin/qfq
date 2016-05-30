/**
 * 
 */
package com.qinfenqi.mall.admin.system.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 下午5:17:46
 * @author Chang Yuxin
 * @version 1.0
 */
public class Role extends BaseBean{
	/** 角色ID */
	private int roleId;
	/** 角色名称 */
	private String roleName;
	/** 创建时间 */
	private Date createTime;
	/** 更新时间 */
	private Date updateTime;
	/** 菜单IDS */
	private String resourceIds;
	/** 菜单名称 */
	private String resourceNames;
	/**
	 * @return the roleId
	 */
	public int getRoleId() {
		return roleId;
	}
	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}
	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	/**
	 * @return the createTime
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * @return the updateTime
	 */
	public Date getUpdateTime() {
		return updateTime;
	}
	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * @return the resourceIds
	 */
	public String getResourceIds() {
		return resourceIds;
	}
	/**
	 * @param resourceIds the resourceIds to set
	 */
	public void setResourceIds(String resourceIds) {
		this.resourceIds = resourceIds;
	}
	/**
	 * @return the resourceNames
	 */
	public String getResourceNames() {
		return resourceNames;
	}
	/**
	 * @param resourceNames the resourceNames to set
	 */
	public void setResourceNames(String resourceNames) {
		this.resourceNames = resourceNames;
	}
}
