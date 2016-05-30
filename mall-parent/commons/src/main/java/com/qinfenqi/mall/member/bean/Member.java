/**
 * 
 */
package com.qinfenqi.mall.member.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月6日 下午6:05:44
 * @author Deng bingna
 * @version 1.0 
 */
public class Member extends BaseBean{

	/** 唯一ID */
	private long memberId;
	/** 用户ID */
	private long userId;
	/** 姓名 */
	private String trueName;
	/** 电话 */
	private String phone;
	/** 省份证号 */
	private String idCard;
	private String idCardAddress;
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
	/** 寝室地址 */
	private String schoolBedroom;
	/** 推荐码 */
	private String recommended;
	/** 理由 */
	private String reason;
	/** 创建时间 */
	private Date createTime;
	/** 邮箱 */
	private String email;
	/** 邮箱验证码 */
	private String emailVc;
	/** 邮箱是否绑定 */
	private int isEmailOauth;
	private int isMobileOath;
	
	private int isIdOauth;
	private String idOauthOpinion;
	
	private int isContactOauth;
	private String contactOauthOpinion;
	
	private int isBkcardOauth;
	private String bkcardOauthOpinion;
	
	private int isEcpOauth;
	private String ecpOauthOpinion;
	
	private int isCardOauth;
	private String cardOauthOpinion;
	
	private int isBkflowOauth;
	private String bkflowOauthOpinion;
	
	private double creditLimit;
	private double usedCreditLimit;
	private String graduateYear;
	private String graduateMonth;
	private int certificationType;
	private String xxAccount;
	private String xxPassword;
	private String jwAccount;
	private String jwPassword;
	private String jwUrl;
	private String QQ;
	private String weiXin;
	
	private String friendPhone;
	private String friendName;
	private String friendPhoneAddress;
	private String bankName;
	private String bankCard;
	private String bankPhone;
	private String bankPhoneAddress;
	private String bankCustomerName;
	private String bankCustomerCard;
	private int code;
	
	private String parentName;
	private String parentPhone;
	private String parentPhoneAddress;
	private String motherName;
	private String motherPhone;
	private String motherPhoneAddress;
	
	private String idCardPhoto;
	private String studentPhoto;
	private String statementPhoto;
	private String bkflowPhoto;
	private int bkflowPrice;
	
	private String othersPhoto;
	private String supplyPhoto;
	/** 审核状态。1:待审;2:重审;3:审过;4:不过;5:归档 */
	private int auditStatus;
	private int auditCount;
	private Date auditTime;
	
	private String embassyName;
	private long embassyId;
	private Date distEmbaTime;
	/**
	 * @return the memberId
	 */
	public long getMemberId() {
		return memberId;
	}
	/**
	 * @param memberId the memberId to set
	 */
	public void setMemberId(long memberId) {
		this.memberId = memberId;
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
	 * @return the idCardAddress
	 */
	public String getIdCardAddress() {
		return idCardAddress;
	}
	/**
	 * @param idCardAddress the idCardAddress to set
	 */
	public void setIdCardAddress(String idCardAddress) {
		this.idCardAddress = idCardAddress;
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
	 * @return the schoolBedroom
	 */
	public String getSchoolBedroom() {
		return schoolBedroom;
	}
	/**
	 * @param schoolBedroom the schoolBedroom to set
	 */
	public void setSchoolBedroom(String schoolBedroom) {
		this.schoolBedroom = schoolBedroom;
	}
	/**
	 * @return the recommended
	 */
	public String getRecommended() {
		return recommended;
	}
	/**
	 * @param recommended the recommended to set
	 */
	public void setRecommended(String recommended) {
		this.recommended = recommended;
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
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the emailVc
	 */
	public String getEmailVc() {
		return emailVc;
	}
	/**
	 * @param emailVc the emailVc to set
	 */
	public void setEmailVc(String emailVc) {
		this.emailVc = emailVc;
	}
	/**
	 * @return the isEmailOauth
	 */
	public int getIsEmailOauth() {
		return isEmailOauth;
	}
	/**
	 * @param isEmailOauth the isEmailOauth to set
	 */
	public void setIsEmailOauth(int isEmailOauth) {
		this.isEmailOauth = isEmailOauth;
	}
	/**
	 * @return the isMobileOath
	 */
	public int getIsMobileOath() {
		return isMobileOath;
	}
	/**
	 * @param isMobileOath the isMobileOath to set
	 */
	public void setIsMobileOath(int isMobileOath) {
		this.isMobileOath = isMobileOath;
	}
	/**
	 * @return the isIdOauth
	 */
	public int getIsIdOauth() {
		return isIdOauth;
	}
	/**
	 * @param isIdOauth the isIdOauth to set
	 */
	public void setIsIdOauth(int isIdOauth) {
		this.isIdOauth = isIdOauth;
	}
	/**
	 * @return the idOauthOpinion
	 */
	public String getIdOauthOpinion() {
		return idOauthOpinion;
	}
	/**
	 * @param idOauthOpinion the idOauthOpinion to set
	 */
	public void setIdOauthOpinion(String idOauthOpinion) {
		this.idOauthOpinion = idOauthOpinion;
	}
	/**
	 * @return the isContactOauth
	 */
	public int getIsContactOauth() {
		return isContactOauth;
	}
	/**
	 * @param isContactOauth the isContactOauth to set
	 */
	public void setIsContactOauth(int isContactOauth) {
		this.isContactOauth = isContactOauth;
	}
	/**
	 * @return the contactOauthOpinion
	 */
	public String getContactOauthOpinion() {
		return contactOauthOpinion;
	}
	/**
	 * @param contactOauthOpinion the contactOauthOpinion to set
	 */
	public void setContactOauthOpinion(String contactOauthOpinion) {
		this.contactOauthOpinion = contactOauthOpinion;
	}
	/**
	 * @return the isBkcardOauth
	 */
	public int getIsBkcardOauth() {
		return isBkcardOauth;
	}
	/**
	 * @param isBkcardOauth the isBkcardOauth to set
	 */
	public void setIsBkcardOauth(int isBkcardOauth) {
		this.isBkcardOauth = isBkcardOauth;
	}
	/**
	 * @return the bkcardOauthOpinion
	 */
	public String getBkcardOauthOpinion() {
		return bkcardOauthOpinion;
	}
	/**
	 * @param bkcardOauthOpinion the bkcardOauthOpinion to set
	 */
	public void setBkcardOauthOpinion(String bkcardOauthOpinion) {
		this.bkcardOauthOpinion = bkcardOauthOpinion;
	}
	/**
	 * @return the isEcpOauth
	 */
	public int getIsEcpOauth() {
		return isEcpOauth;
	}
	/**
	 * @param isEcpOauth the isEcpOauth to set
	 */
	public void setIsEcpOauth(int isEcpOauth) {
		this.isEcpOauth = isEcpOauth;
	}
	/**
	 * @return the ecpOauthOpinion
	 */
	public String getEcpOauthOpinion() {
		return ecpOauthOpinion;
	}
	/**
	 * @param ecpOauthOpinion the ecpOauthOpinion to set
	 */
	public void setEcpOauthOpinion(String ecpOauthOpinion) {
		this.ecpOauthOpinion = ecpOauthOpinion;
	}
	/**
	 * @return the isCardOauth
	 */
	public int getIsCardOauth() {
		return isCardOauth;
	}
	/**
	 * @param isCardOauth the isCardOauth to set
	 */
	public void setIsCardOauth(int isCardOauth) {
		this.isCardOauth = isCardOauth;
	}
	/**
	 * @return the cardOauthOpinion
	 */
	public String getCardOauthOpinion() {
		return cardOauthOpinion;
	}
	/**
	 * @param cardOauthOpinion the cardOauthOpinion to set
	 */
	public void setCardOauthOpinion(String cardOauthOpinion) {
		this.cardOauthOpinion = cardOauthOpinion;
	}
	/**
	 * @return the isBkflowOauth
	 */
	public int getIsBkflowOauth() {
		return isBkflowOauth;
	}
	/**
	 * @param isBkflowOauth the isBkflowOauth to set
	 */
	public void setIsBkflowOauth(int isBkflowOauth) {
		this.isBkflowOauth = isBkflowOauth;
	}
	/**
	 * @return the bkflowOauthOpinion
	 */
	public String getBkflowOauthOpinion() {
		return bkflowOauthOpinion;
	}
	/**
	 * @param bkflowOauthOpinion the bkflowOauthOpinion to set
	 */
	public void setBkflowOauthOpinion(String bkflowOauthOpinion) {
		this.bkflowOauthOpinion = bkflowOauthOpinion;
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
	 * @return the graduateYear
	 */
	public String getGraduateYear() {
		return graduateYear;
	}
	/**
	 * @param graduateYear the graduateYear to set
	 */
	public void setGraduateYear(String graduateYear) {
		this.graduateYear = graduateYear;
	}
	/**
	 * @return the graduateMonth
	 */
	public String getGraduateMonth() {
		return graduateMonth;
	}
	/**
	 * @param graduateMonth the graduateMonth to set
	 */
	public void setGraduateMonth(String graduateMonth) {
		this.graduateMonth = graduateMonth;
	}
	/**
	 * @return the certificationType
	 */
	public int getCertificationType() {
		return certificationType;
	}
	/**
	 * @param certificationType the certificationType to set
	 */
	public void setCertificationType(int certificationType) {
		this.certificationType = certificationType;
	}
	/**
	 * @return the xxAccount
	 */
	public String getXxAccount() {
		return xxAccount;
	}
	/**
	 * @param xxAccount the xxAccount to set
	 */
	public void setXxAccount(String xxAccount) {
		this.xxAccount = xxAccount;
	}
	/**
	 * @return the xxPassword
	 */
	public String getXxPassword() {
		return xxPassword;
	}
	/**
	 * @param xxPassword the xxPassword to set
	 */
	public void setXxPassword(String xxPassword) {
		this.xxPassword = xxPassword;
	}
	/**
	 * @return the jwAccount
	 */
	public String getJwAccount() {
		return jwAccount;
	}
	/**
	 * @param jwAccount the jwAccount to set
	 */
	public void setJwAccount(String jwAccount) {
		this.jwAccount = jwAccount;
	}
	/**
	 * @return the jwPassword
	 */
	public String getJwPassword() {
		return jwPassword;
	}
	/**
	 * @param jwPassword the jwPassword to set
	 */
	public void setJwPassword(String jwPassword) {
		this.jwPassword = jwPassword;
	}
	/**
	 * @return the jwUrl
	 */
	public String getJwUrl() {
		return jwUrl;
	}
	/**
	 * @param jwUrl the jwUrl to set
	 */
	public void setJwUrl(String jwUrl) {
		this.jwUrl = jwUrl;
	}
	/**
	 * @return the qQ
	 */
	public String getQQ() {
		return QQ;
	}
	/**
	 * @param qQ the qQ to set
	 */
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	/**
	 * @return the weiXin
	 */
	public String getWeiXin() {
		return weiXin;
	}
	/**
	 * @param weiXin the weiXin to set
	 */
	public void setWeiXin(String weiXin) {
		this.weiXin = weiXin;
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
	 * @return the friendPhoneAddress
	 */
	public String getFriendPhoneAddress() {
		return friendPhoneAddress;
	}
	/**
	 * @param friendPhoneAddress the friendPhoneAddress to set
	 */
	public void setFriendPhoneAddress(String friendPhoneAddress) {
		this.friendPhoneAddress = friendPhoneAddress;
	}
	/**
	 * @return the bankName
	 */
	public String getBankName() {
		return bankName;
	}
	/**
	 * @param bankName the bankName to set
	 */
	public void setBankName(String bankName) {
		this.bankName = bankName;
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
	 * @return the bankPhone
	 */
	public String getBankPhone() {
		return bankPhone;
	}
	/**
	 * @param bankPhone the bankPhone to set
	 */
	public void setBankPhone(String bankPhone) {
		this.bankPhone = bankPhone;
	}
	
	/**
	 * @return the bankPhoneAddress
	 */
	public String getBankPhoneAddress() {
		return bankPhoneAddress;
	}
	/**
	 * @param bankPhoneAddress the bankPhoneAddress to set
	 */
	public void setBankPhoneAddress(String bankPhoneAddress) {
		this.bankPhoneAddress = bankPhoneAddress;
	}
	/**
	 * @return the bankCustomerName
	 */
	public String getBankCustomerName() {
		return bankCustomerName;
	}
	/**
	 * @param bankCustomerName the bankCustomerName to set
	 */
	public void setBankCustomerName(String bankCustomerName) {
		this.bankCustomerName = bankCustomerName;
	}
	/**
	 * @return the bankCustomerCard
	 */
	public String getBankCustomerCard() {
		return bankCustomerCard;
	}
	/**
	 * @param bankCustomerCard the bankCustomerCard to set
	 */
	public void setBankCustomerCard(String bankCustomerCard) {
		this.bankCustomerCard = bankCustomerCard;
	}
	/**
	 * @return the code
	 */
	public int getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(int code) {
		this.code = code;
	}
	/**
	 * @return the parentName
	 */
	public String getParentName() {
		return parentName;
	}
	/**
	 * @param parentName the parentName to set
	 */
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	/**
	 * @return the parentPhone
	 */
	public String getParentPhone() {
		return parentPhone;
	}
	/**
	 * @param parentPhone the parentPhone to set
	 */
	public void setParentPhone(String parentPhone) {
		this.parentPhone = parentPhone;
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
	 * @return the idCardPhoto
	 */
	public String getIdCardPhoto() {
		return idCardPhoto;
	}
	/**
	 * @param idCardPhoto the idCardPhoto to set
	 */
	public void setIdCardPhoto(String idCardPhoto) {
		this.idCardPhoto = idCardPhoto;
	}
	/**
	 * @return the studentPhoto
	 */
	public String getStudentPhoto() {
		return studentPhoto;
	}
	/**
	 * @param studentPhoto the studentPhoto to set
	 */
	public void setStudentPhoto(String studentPhoto) {
		this.studentPhoto = studentPhoto;
	}
	/**
	 * @return the statementPhoto
	 */
	public String getStatementPhoto() {
		return statementPhoto;
	}
	/**
	 * @param statementPhoto the statementPhoto to set
	 */
	public void setStatementPhoto(String statementPhoto) {
		this.statementPhoto = statementPhoto;
	}
	/**
	 * @return the bkflowPhoto
	 */
	public String getBkflowPhoto() {
		return bkflowPhoto;
	}
	/**
	 * @param bkflowPhoto the bkflowPhoto to set
	 */
	public void setBkflowPhoto(String bkflowPhoto) {
		this.bkflowPhoto = bkflowPhoto;
	}
	/**
	 * @return the bkflowPrice
	 */
	public int getBkflowPrice() {
		return bkflowPrice;
	}
	/**
	 * @param bkflowPrice the bkflowPrice to set
	 */
	public void setBkflowPrice(int bkflowPrice) {
		this.bkflowPrice = bkflowPrice;
	}
	/**
	 * @return the othersPhoto
	 */
	public String getOthersPhoto() {
		return othersPhoto;
	}
	/**
	 * @param othersPhoto the othersPhoto to set
	 */
	public void setOthersPhoto(String othersPhoto) {
		this.othersPhoto = othersPhoto;
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
	 * @return the auditTime
	 */
	public Date getAuditTime() {
		return auditTime;
	}
	/**
	 * @param auditTime the auditTime to set
	 */
	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}
	/**
	 * @return the embassyName
	 */
	public String getEmbassyName() {
		return embassyName;
	}
	/**
	 * @param embassyName the embassyName to set
	 */
	public void setEmbassyName(String embassyName) {
		this.embassyName = embassyName;
	}
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
	 * @return the distEmbaTime
	 */
	public Date getDistEmbaTime() {
		return distEmbaTime;
	}
	/**
	 * @param distEmbaTime the distEmbaTime to set
	 */
	public void setDistEmbaTime(Date distEmbaTime) {
		this.distEmbaTime = distEmbaTime;
	}
	/**
	 * @return the parentPhoneAddress
	 */
	public String getParentPhoneAddress() {
		return parentPhoneAddress;
	}
	/**
	 * @param parentPhoneAddress the parentPhoneAddress to set
	 */
	public void setParentPhoneAddress(String parentPhoneAddress) {
		this.parentPhoneAddress = parentPhoneAddress;
	}
	/**
	 * @return the motherPhoneAddress
	 */
	public String getMotherPhoneAddress() {
		return motherPhoneAddress;
	}
	/**
	 * @param motherPhoneAddress the motherPhoneAddress to set
	 */
	public void setMotherPhoneAddress(String motherPhoneAddress) {
		this.motherPhoneAddress = motherPhoneAddress;
	}
	
}