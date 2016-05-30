/**
 * 
 */
package com.qinfenqi.mall.product.bean;

import java.util.Date;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 下午7:17:26
 * @author Chang Yuxin
 * @version 1.0 
 */
public class Brand {
	private int brandId;
	private String brandName;
	private int isDelete;
	private Date createTime;
	/**
	 * @return the brandId
	 */
	public int getBrandId() {
		return brandId;
	}
	/**
	 * @param brandId the brandId to set
	 */
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	/**
	 * @return the brandName
	 */
	public String getBrandName() {
		return brandName;
	}
	/**
	 * @param brandName the brandName to set
	 */
	public void setBrandName(String brandName) {
		this.brandName = brandName;
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
	
}
