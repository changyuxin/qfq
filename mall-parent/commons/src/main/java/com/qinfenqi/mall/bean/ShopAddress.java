/**
 * 
 */
package com.qinfenqi.mall.bean;

import java.util.Date;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月6日 下午2:53:13
 * @author Deng bingna
 * @version 1.0 
 */
public class ShopAddress {

	/** 唯一ID */
	private long addressId;
	/** 用户ID */
	private long userId;
	/** 收货人 */
	private String receiveName;
	/** 省编码 */
	private String provinceNum;
	/** 市编码 */
	private String cityNum;
	/** 地区编码 */
	private String districtNum;
	/** 街道 */
	private String roadNum;
	/** 电话 */
	private String phoneNum;
	/** 详细地址 */
	private String address;
	/** 创建时间 */
	private Date createTime;
	/** 修改时间 */
	private Date updateTime;
	
	private int isDefault = 1;
	
	
	
	
	/**
	 * @return the addressId
	 */
	public long getAddressId() {
		return addressId;
	}
	/**
	 * @param addressId the addressId to set
	 */
	public void setAddressId(long addressId) {
		this.addressId = addressId;
	}
	/**
	 * @return the userId
	 */
	public long getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(long userId) {
		this.userId = userId;
	}
	/**
	 * @return the receiveName
	 */
	public String getReceiveName() {
		return receiveName;
	}
	/**
	 * @param receiveName the receiveName to set
	 */
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	/**
	 * @return the provinceNum
	 */
	public String getProvinceNum() {
		return provinceNum;
	}
	/**
	 * @param provinceNum the provinceNum to set
	 */
	public void setProvinceNum(String provinceNum) {
		this.provinceNum = provinceNum;
	}
	/**
	 * @return the cityNum
	 */
	public String getCityNum() {
		return cityNum;
	}
	/**
	 * @param cityNum the cityNum to set
	 */
	public void setCityNum(String cityNum) {
		this.cityNum = cityNum;
	}
	/**
	 * @return the districtNum
	 */
	public String getDistrictNum() {
		return districtNum;
	}
	/**
	 * @param districtNum the districtNum to set
	 */
	public void setDistrictNum(String districtNum) {
		this.districtNum = districtNum;
	}
	/**
	 * @return the roadNum
	 */
	public String getRoadNum() {
		return roadNum;
	}
	/**
	 * @param roadNum the roadNum to set
	 */
	public void setRoadNum(String roadNum) {
		this.roadNum = roadNum;
	}
	/**
	 * @return the phoneNum
	 */
	public String getPhoneNum() {
		return phoneNum;
	}
	/**
	 * @param phoneNum the phoneNum to set
	 */
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
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
	 * @return the isDefault
	 */
	public int getIsDefault() {
		return isDefault;
	}
	/**
	 * @param isDefault the isDefault to set
	 */
	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}
}
