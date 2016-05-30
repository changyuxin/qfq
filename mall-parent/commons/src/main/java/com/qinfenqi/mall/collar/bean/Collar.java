/**
 * 
 */
package com.qinfenqi.mall.collar.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月14日 上午9:06:49
 * @author Chang Yuxin
 * @version 1.0 
 */
public class Collar extends BaseBean{
	/** 唯一ID */
	private long collarId;
	/** 用户ID */
	private long userId;
	/** 姓名 */
	private String trueName;
	/** 性别 */
	private int sex;
	/** 身份证号 */
	private String idCard;
	/** 电话 */
	private String phone;
	/** 信用额度 */
	private double creditLimit;
	/** 已用信用额度 */
	private double usedCreditLimit;
	/** 创建时间 */
	private Date createTime;
	/** 省 */
	private String province;
	/** 市 */
	private String city;
	/** 区 */
	private String district;
	/** 街道 */
	private String street;
	/** 小区 */
	private String neighborhood;
	/** 楼 */
	private String building;
	/** 单元 */
	private String unit;
	/** 层*/
	private String floor;
	/** 室 */
	private String room;
	/** 工作单位名称 */
	private String companyName;
	/** 工作单位性质 */
	private int companyType;
	/** 部门 */
	private String department;
	/** 职位 */
	private String post;
	/** 工作地址 */
	private String companyAddress;
	/** 单位联系人 */
	private String companyContactPerson;
	/** 固定电话 */
	private String companyfixedTelephone;
	/** 联系电话 */
	private String companyPhone;
	/** 省 */
	private String mailProvince;
	/** 市 */
	private String mailCity;
	/** 区 */
	private String mailDistrict;
	/** 街道 */
	private String mailStreet;
	/** 小区 */
	private String mailNeighborhood;
	/** 楼 */
	private String mailBuilding;
	/** 单元 */
	private String mailUnit;
	/** 层*/
	private String mailFloor;
	/** 室 */
	private String mailRoom;
	/** 邮寄电话*/
	private String mailPhone;
	/** 邮寄qq*/
	private String mailQQ;
	/** 邮寄微信*/
	private String mailWeixin;
	/** 邮箱*/
	private String mail;
	/** 父亲姓名*/
	private String fatherName;
	/** 父亲电话*/
	private String fatherPhone;
	/** 母亲姓名*/
	private String motherName;
	/** 母亲电话*/
	private String motherPhone;
	/** 妻子姓名*/
	private String wifeName;
	/** 妻子电话*/
	private String wifePhone;
	/** 朋友姓名*/
	private String friendName;
	/** 朋友电话*/
	private String friendPhone;
	/** 教育水平*/
	private int educationLevel;
	/** 家庭收入*/
	private int familyIncome;
	/** 工作时间*/
	private int workingMonth;
	/** 现工作时间*/
	private int workingYearNow;
	/** 月收入*/
	private int monthIncome;
	/** 月支出*/
	private int monthSpends;
	
	/** 社保状态*/
	private int socialSecurityStatus;
	/** 住房状态*/
	private int housingStatus;
	/** 担保人姓名*/
	private String guaranteeName;
	/** 担保人电话*/
	private String guaranteePhone;
	/** 开户银行*/
	private String bankCard;
	/** 开户姓名*/
	private String bankCardName;
	/** 卡号*/
	private String bankCardId;
	/** 上传资料*/
	private String uploadCardDetail;
	/** 上传流水*/
	private String uploadFlowDetail;
	/** 上传其他*/
	private String uploadOtherDetail;
	/** 补充资料 */
	private String supplyPhoto;
	/** 审核状态 */
	private int auditStatus;
	/** 审核次数 */
	private int auditCount;
	/** 审核意见 */
	private String auditOpinion;
	
	/**
	 * @return the collarId
	 */
	public long getCollarId() {
		return collarId;
	}
	/**
	 * @param collarId the collarId to set
	 */
	public void setCollarId(long collarId) {
		this.collarId = collarId;
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
	 * @return the creditLimit
	 */
	public double getCreditLimit() {
		return creditLimit;
	}
	/**
	 * @param creditLimit the creditLimit to set
	 */
	public void setCreditLimit(double creditLimit) {
		this.creditLimit = creditLimit;
	}
	/**
	 * @return the usedCreditLimit
	 */
	public double getUsedCreditLimit() {
		return usedCreditLimit;
	}
	/**
	 * @param usedCreditLimit the usedCreditLimit to set
	 */
	public void setUsedCreditLimit(double usedCreditLimit) {
		this.usedCreditLimit = usedCreditLimit;
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
	 * @return the street
	 */
	public String getStreet() {
		return street;
	}
	/**
	 * @param street the street to set
	 */
	public void setStreet(String street) {
		this.street = street;
	}
	/**
	 * @return the neighborhood
	 */
	public String getNeighborhood() {
		return neighborhood;
	}
	/**
	 * @param neighborhood the neighborhood to set
	 */
	public void setNeighborhood(String neighborhood) {
		this.neighborhood = neighborhood;
	}
	/**
	 * @return the building
	 */
	public String getBuilding() {
		return building;
	}
	/**
	 * @param building the building to set
	 */
	public void setBuilding(String building) {
		this.building = building;
	}
	/**
	 * @return the floor
	 */
	public String getFloor() {
		return floor;
	}
	/**
	 * @param floor the floor to set
	 */
	public void setFloor(String floor) {
		this.floor = floor;
	}
	/**
	 * @return the room
	 */
	public String getRoom() {
		return room;
	}
	/**
	 * @param room the room to set
	 */
	public void setRoom(String room) {
		this.room = room;
	}
	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}
	/**
	 * @param companyName the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	/**
	 * @return the companyType
	 */
	public int getCompanyType() {
		return companyType;
	}
	/**
	 * @param companyType the companyType to set
	 */
	public void setCompanyType(int companyType) {
		this.companyType = companyType;
	}
	/**
	 * @return the department
	 */
	public String getDepartment() {
		return department;
	}
	/**
	 * @param department the department to set
	 */
	public void setDepartment(String department) {
		this.department = department;
	}
	/**
	 * @return the post
	 */
	public String getPost() {
		return post;
	}
	/**
	 * @param post the post to set
	 */
	public void setPost(String post) {
		this.post = post;
	}
	/**
	 * @return the companyAddress
	 */
	public String getCompanyAddress() {
		return companyAddress;
	}
	/**
	 * @param companyAddress the companyAddress to set
	 */
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	/**
	 * @return the companyContactPerson
	 */
	public String getCompanyContactPerson() {
		return companyContactPerson;
	}
	/**
	 * @param companyContactPerson the companyContactPerson to set
	 */
	public void setCompanyContactPerson(String companyContactPerson) {
		this.companyContactPerson = companyContactPerson;
	}
	/**
	 * @return the companyfixedTelephone
	 */
	public String getCompanyfixedTelephone() {
		return companyfixedTelephone;
	}
	/**
	 * @param companyfixedTelephone the companyfixedTelephone to set
	 */
	public void setCompanyfixedTelephone(String companyfixedTelephone) {
		this.companyfixedTelephone = companyfixedTelephone;
	}
	/**
	 * @return the companyPhone
	 */
	public String getCompanyPhone() {
		return companyPhone;
	}
	/**
	 * @param companyPhone the companyPhone to set
	 */
	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	/**
	 * @return the mailProvince
	 */
	public String getMailProvince() {
		return mailProvince;
	}
	/**
	 * @param mailProvince the mailProvince to set
	 */
	public void setMailProvince(String mailProvince) {
		this.mailProvince = mailProvince;
	}
	/**
	 * @return the mailCity
	 */
	public String getMailCity() {
		return mailCity;
	}
	/**
	 * @param mailCity the mailCity to set
	 */
	public void setMailCity(String mailCity) {
		this.mailCity = mailCity;
	}
	/**
	 * @return the mailDistrict
	 */
	public String getMailDistrict() {
		return mailDistrict;
	}
	/**
	 * @param mailDistrict the mailDistrict to set
	 */
	public void setMailDistrict(String mailDistrict) {
		this.mailDistrict = mailDistrict;
	}
	/**
	 * @return the mailStreet
	 */
	public String getMailStreet() {
		return mailStreet;
	}
	/**
	 * @param mailStreet the mailStreet to set
	 */
	public void setMailStreet(String mailStreet) {
		this.mailStreet = mailStreet;
	}
	/**
	 * @return the mailNeighborhood
	 */
	public String getMailNeighborhood() {
		return mailNeighborhood;
	}
	/**
	 * @param mailNeighborhood the mailNeighborhood to set
	 */
	public void setMailNeighborhood(String mailNeighborhood) {
		this.mailNeighborhood = mailNeighborhood;
	}
	/**
	 * @return the mailBuilding
	 */
	public String getMailBuilding() {
		return mailBuilding;
	}
	/**
	 * @param mailBuilding the mailBuilding to set
	 */
	public void setMailBuilding(String mailBuilding) {
		this.mailBuilding = mailBuilding;
	}
	/**
	 * @return the mailFloor
	 */
	public String getMailFloor() {
		return mailFloor;
	}
	/**
	 * @param mailFloor the mailFloor to set
	 */
	public void setMailFloor(String mailFloor) {
		this.mailFloor = mailFloor;
	}
	/**
	 * @return the mailRoom
	 */
	public String getMailRoom() {
		return mailRoom;
	}
	/**
	 * @param mailRoom the mailRoom to set
	 */
	public void setMailRoom(String mailRoom) {
		this.mailRoom = mailRoom;
	}
	/**
	 * @return the mailPhone
	 */
	public String getMailPhone() {
		return mailPhone;
	}
	/**
	 * @param mailPhone the mailPhone to set
	 */
	public void setMailPhone(String mailPhone) {
		this.mailPhone = mailPhone;
	}
	/**
	 * @return the mailQQ
	 */
	public String getMailQQ() {
		return mailQQ;
	}
	/**
	 * @param mailQQ the mailQQ to set
	 */
	public void setMailQQ(String mailQQ) {
		this.mailQQ = mailQQ;
	}
	/**
	 * @return the mailWeixin
	 */
	public String getMailWeixin() {
		return mailWeixin;
	}
	/**
	 * @param mailWeixin the mailWeixin to set
	 */
	public void setMailWeixin(String mailWeixin) {
		this.mailWeixin = mailWeixin;
	}
	/**
	 * @return the mail
	 */
	public String getMail() {
		return mail;
	}
	/**
	 * @param mail the mail to set
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}
	/**
	 * @return the fatherName
	 */
	public String getFatherName() {
		return fatherName;
	}
	/**
	 * @param fatherName the fatherName to set
	 */
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	/**
	 * @return the fatherPhone
	 */
	public String getFatherPhone() {
		return fatherPhone;
	}
	/**
	 * @param fatherPhone the fatherPhone to set
	 */
	public void setFatherPhone(String fatherPhone) {
		this.fatherPhone = fatherPhone;
	}
	/**
	 * @return the motherName
	 */
	public String getMotherName() {
		return motherName;
	}
	/**
	 * @param motherName the motherName to set
	 */
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	/**
	 * @return the motherPhone
	 */
	public String getMotherPhone() {
		return motherPhone;
	}
	/**
	 * @param motherPhone the motherPhone to set
	 */
	public void setMotherPhone(String motherPhone) {
		this.motherPhone = motherPhone;
	}
	/**
	 * @return the wifeName
	 */
	public String getWifeName() {
		return wifeName;
	}
	/**
	 * @param wifeName the wifeName to set
	 */
	public void setWifeName(String wifeName) {
		this.wifeName = wifeName;
	}
	/**
	 * @return the wifePhone
	 */
	public String getWifePhone() {
		return wifePhone;
	}
	/**
	 * @param wifePhone the wifePhone to set
	 */
	public void setWifePhone(String wifePhone) {
		this.wifePhone = wifePhone;
	}
	/**
	 * @return the friendName
	 */
	public String getFriendName() {
		return friendName;
	}
	/**
	 * @param friendName the friendName to set
	 */
	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
	/**
	 * @return the friendPhone
	 */
	public String getFriendPhone() {
		return friendPhone;
	}
	/**
	 * @param friendPhone the friendPhone to set
	 */
	public void setFriendPhone(String friendPhone) {
		this.friendPhone = friendPhone;
	}
	/**
	 * @return the educationLevel
	 */
	public int getEducationLevel() {
		return educationLevel;
	}
	/**
	 * @param educationLevel the educationLevel to set
	 */
	public void setEducationLevel(int educationLevel) {
		this.educationLevel = educationLevel;
	}
	/**
	 * @return the familyIncome
	 */
	public int getFamilyIncome() {
		return familyIncome;
	}
	/**
	 * @param familyIncome the familyIncome to set
	 */
	public void setFamilyIncome(int familyIncome) {
		this.familyIncome = familyIncome;
	}
	/**
	 * @return the workingMonth
	 */
	public int getWorkingMonth() {
		return workingMonth;
	}
	/**
	 * @param workingMonth the workingMonth to set
	 */
	public void setWorkingMonth(int workingMonth) {
		this.workingMonth = workingMonth;
	}
	/**
	 * @return the workingYearNow
	 */
	public int getWorkingYearNow() {
		return workingYearNow;
	}
	/**
	 * @param workingYearNow the workingYearNow to set
	 */
	public void setWorkingYearNow(int workingYearNow) {
		this.workingYearNow = workingYearNow;
	}
	/**
	 * @return the monthIncome
	 */
	public int getMonthIncome() {
		return monthIncome;
	}
	/**
	 * @param monthIncome the monthIncome to set
	 */
	public void setMonthIncome(int monthIncome) {
		this.monthIncome = monthIncome;
	}
	/**
	 * @return the monthSpends
	 */
	public int getMonthSpends() {
		return monthSpends;
	}
	/**
	 * @param monthSpends the monthSpends to set
	 */
	public void setMonthSpends(int monthSpends) {
		this.monthSpends = monthSpends;
	}
	/**
	 * @return the socialSecurityStatus
	 */
	public int getSocialSecurityStatus() {
		return socialSecurityStatus;
	}
	/**
	 * @param socialSecurityStatus the socialSecurityStatus to set
	 */
	public void setSocialSecurityStatus(int socialSecurityStatus) {
		this.socialSecurityStatus = socialSecurityStatus;
	}
	/**
	 * @return the housingStatus
	 */
	public int getHousingStatus() {
		return housingStatus;
	}
	/**
	 * @param housingStatus the housingStatus to set
	 */
	public void setHousingStatus(int housingStatus) {
		this.housingStatus = housingStatus;
	}
	/**
	 * @return the guaranteeName
	 */
	public String getGuaranteeName() {
		return guaranteeName;
	}
	/**
	 * @param guaranteeName the guaranteeName to set
	 */
	public void setGuaranteeName(String guaranteeName) {
		this.guaranteeName = guaranteeName;
	}
	
	/**
	 * @return the guaranteePhone
	 */
	public String getGuaranteePhone() {
		return guaranteePhone;
	}
	/**
	 * @param guaranteePhone the guaranteePhone to set
	 */
	public void setGuaranteePhone(String guaranteePhone) {
		this.guaranteePhone = guaranteePhone;
	}
	/**
	 * @return the bankCard
	 */
	public String getBankCard() {
		return bankCard;
	}
	/**
	 * @param bankCard the bankCard to set
	 */
	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}
	/**
	 * @return the bankCardName
	 */
	public String getBankCardName() {
		return bankCardName;
	}
	/**
	 * @param bankCardName the bankCardName to set
	 */
	public void setBankCardName(String bankCardName) {
		this.bankCardName = bankCardName;
	}
	/**
	 * @return the bankCardId
	 */
	public String getBankCardId() {
		return bankCardId;
	}
	/**
	 * @param bankCardId the bankCardId to set
	 */
	public void setBankCardId(String bankCardId) {
		this.bankCardId = bankCardId;
	}
	/**
	 * @return the uploadCardDetail
	 */
	public String getUploadCardDetail() {
		return uploadCardDetail;
	}
	/**
	 * @param uploadCardDetail the uploadCardDetail to set
	 */
	public void setUploadCardDetail(String uploadCardDetail) {
		this.uploadCardDetail = uploadCardDetail;
	}
	/**
	 * @return the uploadFlowDetail
	 */
	public String getUploadFlowDetail() {
		return uploadFlowDetail;
	}
	/**
	 * @param uploadFlowDetail the uploadFlowDetail to set
	 */
	public void setUploadFlowDetail(String uploadFlowDetail) {
		this.uploadFlowDetail = uploadFlowDetail;
	}
	/**
	 * @return the uploadOtherDetail
	 */
	public String getUploadOtherDetail() {
		return uploadOtherDetail;
	}
	/**
	 * @param uploadOtherDetail the uploadOtherDetail to set
	 */
	public void setUploadOtherDetail(String uploadOtherDetail) {
		this.uploadOtherDetail = uploadOtherDetail;
	}
	/**
	 * @return the auditStatus
	 */
	public int getAuditStatus() {
		return auditStatus;
	}
	/**
	 * @param auditStatus the auditStatus to set
	 */
	public void setAuditStatus(int auditStatus) {
		this.auditStatus = auditStatus;
	}
	/**
	 * @return the auditCount
	 */
	public int getAuditCount() {
		return auditCount;
	}
	/**
	 * @param auditCount the auditCount to set
	 */
	public void setAuditCount(int auditCount) {
		this.auditCount = auditCount;
	}
	/**
	 * @return the unit
	 */
	public String getUnit() {
		return unit;
	}
	/**
	 * @param unit the unit to set
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}
	/**
	 * @return the mailUnit
	 */
	public String getMailUnit() {
		return mailUnit;
	}
	/**
	 * @param mailUnit the mailUnit to set
	 */
	public void setMailUnit(String mailUnit) {
		this.mailUnit = mailUnit;
	}
	/**
	 * @return the auditOpinion
	 */
	public String getAuditOpinion() {
		return auditOpinion;
	}
	/**
	 * @param auditOpinion the auditOpinion to set
	 */
	public void setAuditOpinion(String auditOpinion) {
		this.auditOpinion = auditOpinion;
	}
	/**
	 * @return the supplyPhoto
	 */
	public String getSupplyPhoto() {
		return supplyPhoto;
	}
	/**
	 * @param supplyPhoto the supplyPhoto to set
	 */
	public void setSupplyPhoto(String supplyPhoto) {
		this.supplyPhoto = supplyPhoto;
	}
	
}
