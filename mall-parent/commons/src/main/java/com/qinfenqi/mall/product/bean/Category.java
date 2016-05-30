/**
 * 
 */
package com.qinfenqi.mall.product.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 上午10:08:13
 * @author Chang Yuxin
 * @version 1.0
 */
public class Category {
	/** 分类ID */
	private int categoryId;
	/** 父分类ID */
	private int pcategoryId;
	/** 分类名称 */
	private String categoryName;
	/** 分类图标 */
	private String categoryImg;
	/** 分类列表TITLE */
	private String categoryListImg;
	/** 创建时间 */
	private Date createTime;
	/** 分类级别 */
	private int level;
	/** 是否删除 */
	private int isDelete;
	/** 子节点 */
	private List<Category> children = new ArrayList<Category>();
	/**
	 * @param category
	 */
	public void addChildren(Category category){
		children.add(category);
	}
	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}
	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	/**
	 * @return the pcategoryId
	 */
	public int getPcategoryId() {
		return pcategoryId;
	}
	/**
	 * @param pcategoryId the pcategoryId to set
	 */
	public void setPcategoryId(int pcategoryId) {
		this.pcategoryId = pcategoryId;
	}
	/**
	 * @return the categoryName
	 */
	public String getCategoryName() {
		return categoryName;
	}
	/**
	 * @param categoryName the categoryName to set
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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
	 * @return the level
	 */
	public int getLevel() {
		return level;
	}
	/**
	 * @param level the level to set
	 */
	public void setLevel(int level) {
		this.level = level;
	}
	/**
	 * @return the isDelete
	 */
	public int getIsDelete() {
		return isDelete;
	}
	/**
	 * @param isDelete the isDelete to set
	 */
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	/**
	 * @return the children
	 */
	public List<Category> getChildren() {
		return children;
	}
	/**
	 * @param children the children to set
	 */
	public void setChildren(List<Category> children) {
		this.children = children;
	}
	/**
	 * @return the categoryImg
	 */
	public String getCategoryImg() {
		return categoryImg;
	}
	/**
	 * @param categoryImg the categoryImg to set
	 */
	public void setCategoryImg(String categoryImg) {
		this.categoryImg = categoryImg;
	}
	/**
	 * @return the categoryListImg
	 */
	public String getCategoryListImg() {
		return categoryListImg;
	}
	/**
	 * @param categoryListImg the categoryListImg to set
	 */
	public void setCategoryListImg(String categoryListImg) {
		this.categoryListImg = categoryListImg;
	}
	
}
