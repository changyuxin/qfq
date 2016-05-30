/**
 * 
 */
package com.qinfenqi.mall.admin.system.query;

import java.util.ArrayList;
import java.util.List;

import com.qinfenqi.mall.admin.system.bean.Resource;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月22日 上午10:51:30
 * @author Chang Yuxin
 * @version 1.0
 */
public class ResourceQuery extends Resource {
	
	/** 扩展字段 */
	/** 存储父子关系，迭代系统导航使用 */
	private List<ResourceQuery> children = new ArrayList<ResourceQuery>();
	
	public void addChild(ResourceQuery resourceQuery){
		children.add(resourceQuery);
	}

	/**
	 * @return the children
	 */
	public List<ResourceQuery> getChildren() {
		return children;
	}

	/**
	 * @param children the children to set
	 */
	public void setChildren(List<ResourceQuery> children) {
		this.children = children;
	}

	private String parentName;

	/**
	 * @return the parentName
	 */
	public String getParentName() {
		return parentName;
	}

	/**
	 * @param parentName
	 *            the parentName to set
	 */
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	
	
}
