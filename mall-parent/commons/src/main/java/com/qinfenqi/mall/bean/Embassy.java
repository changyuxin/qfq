/**
 * 
 */
package com.qinfenqi.mall.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月6日 下午5:53:29
 * @author Deng bingna
 * @version 1.0 
 */
public class Embassy extends BaseBean {

	/** 唯一ID */
	private long embassyId;
	/** 用户ID */
	private long userId;
	/** 编号 */
	private String serialNum;
	/** 姓名 */
	private String trueName;
	/** 性别 */
	private int sex;
	/** 电话 */
	private String phone;
	/** 省份证号 */
	private String idCard;
	/** 省 */
	private String province;
	/** 市 */
	private String city;
	/** 区*/
	private String district;
	/** 学校 */
	private String school;
	/** 校区 */
	private String schoolZone;
	/** 开户行 */
	private String bkcardName;
	/** 银行卡号 */
	private String bkcardNum;
	/** 推荐码 */
	private String recommendedCode;
	/** 理由 */
	private String reason;
	/** 创建时间 */
	private Date createTime;
	
	private int status;
	/**
	 * @return the embassyId
	 */
	public long getEmbassyId() {
		return embassyId;
	}
	/**
	 * @param embassyId the embassyId to set
	 */
	public void setEmbassyId(long embassyId) {
		this.embassyId = embassyId;
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
	 * @return the serialNum
	 */
	public String getSerialNum() {
		return serialNum;
	}
	/**
	 * @param serialNum the serialNum to set
	 */
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	/**
	 * @return the trueName
	 */
	public String getTrueName() {
		return trueName;
	}
	/**
	 * @param trueName the trueName to set
	 */
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the idCard
	 */
	public String getIdCard() {
		return idCard;
	}
	/**
	 * @param idCard the idCard to set
	 */
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	/**
	 * @return the province
	 */
	public String getProvince() {
		return province;
	}
	/**
	 * @param province the province to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}
	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the district
	 */
	public String getDistrict() {
		return district;
	}
	/**
	 * @param district the district to set
	 */
	public void setDistrict(String district) {
		this.district = district;
	}
	/**
	 * @return the school
	 */
	public String getSchool() {
		return school;
	}
	/**
	 * @param school the school to set
	 */
	public void setSchool(String school) {
		this.school = school;
	}
	/**
	 * @return the schoolZone
	 */
	public String getSchoolZone() {
		return schoolZone;
	}
	/**
	 * @param schoolZone the schoolZone to set
	 */
	public void setSchoolZone(String schoolZone) {
		this.schoolZone = schoolZone;
	}
	/**
	 * @return the recommended
	 */
	public String getRecommendedCode() {
		return recommendedCode;
	}
	/**
	 * @param recommended the recommended to set
	 */
	public void setRecommendedCode(String recommendedCode) {
		this.recommendedCode = recommendedCode;
	}
	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * @param reason the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
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
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	/**
	 * @return the sex
	 */
	public int getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(int sex) {
		this.sex = sex;
	}
	/**
	 * @return the bkcardName
	 */
	public String getBkcardName() {
		return bkcardName;
	}
	/**
	 * @param bkcardName the bkcardName to set
	 */
	public void setBkcardName(String bkcardName) {
		this.bkcardName = bkcardName;
	}
	/**
	 * @return the bkcardNum
	 */
	public String getBkcardNum() {
		return bkcardNum;
	}
	/**
	 * @param bkcardNum the bkcardNum to set
	 */
	public void setBkcardNum(String bkcardNum) {
		this.bkcardNum = bkcardNum;
	}
	
}
