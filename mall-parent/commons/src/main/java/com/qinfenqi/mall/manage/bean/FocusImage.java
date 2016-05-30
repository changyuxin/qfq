/**
 * 
 */
package com.qinfenqi.mall.manage.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月2日 上午9:46:30
 * @author Chang Yuxin
 * @version 1.0
 */
public class FocusImage extends BaseBean{
	private int focusId;
	private String focusDesc;
	private String focusLink;
	private String imageUrl;
	private String bgColor;
	// 轮播图排序
	private int focusOrder;
	// 是否启用。1：启用，2：不启用
	private int isEnable;
	private Date createTime;
	private Date modifyTime;
	/**
	 * @return the focusId
	 */
	public int getFocusId() {
		return focusId;
	}
	/**
	 * @param focusId the focusId to set
	 */
	public void setFocusId(int focusId) {
		this.focusId = focusId;
	}
	/**
	 * @return the focusLink
	 */
	public String getFocusLink() {
		return focusLink;
	}
	/**
	 * @param focusLink the focusLink to set
	 */
	public void setFocusLink(String focusLink) {
		this.focusLink = focusLink;
	}
	/**
	 * @return the imageUrl
	 */
	public String getImageUrl() {
		return imageUrl;
	}
	/**
	 * @param imageUrl the imageUrl to set
	 */
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	/**
	 * @return the bgColor
	 */
	public String getBgColor() {
		return bgColor;
	}
	/**
	 * @param bgColor the bgColor to set
	 */
	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}
	
	/**
	 * @return the focusOrder
	 */
	public int getFocusOrder() {
		return focusOrder;
	}
	/**
	 * @param focusOrder the focusOrder to set
	 */
	public void setFocusOrder(int focusOrder) {
		this.focusOrder = focusOrder;
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
	/**
	 * @return the focusDesc
	 */
	public String getFocusDesc() {
		return focusDesc;
	}
	/**
	 * @param focusDesc the focusDesc to set
	 */
	public void setFocusDesc(String focusDesc) {
		this.focusDesc = focusDesc;
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
	 * @return the modifyTime
	 */
	public Date getModifyTime() {
		return modifyTime;
	}
	/**
	 * @param modifyTime the modifyTime to set
	 */
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
}
