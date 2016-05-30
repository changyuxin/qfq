package com.qinfenqi.mall.system.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;



/**
 * <p>Title:</p> 
 * <p>Description:  </p>
 * <p>Copyright: Copyright (c) 2003 - 2008 </p>
 * <p>Company: Run Technology Co.Ltd. Beijing </p>
 * <p>bulid:  2014-4-30 上午10:10:14</p>
 * @author Yang ximing 
 * @version 1.0 
 */
public class User extends BaseBean{
	
	/** 唯一ID */
	private long userId;
	/** 登录名 */
	private String userName;
	/** 密码 */
	private String password;
	/** 角色ID */
	private int roleId;
	/** 部门ID */
	private int deptId;
	/** 创建时间 */
	private Date createTime;
	/** 登录次数 */
	private int loginCount;
	/** 注册IP */
	private String registerIp;
	/** 最后登陆时间 */
	private Date lastLoginTime;
	/** 最后登录IP */
	private String lastLoginIp;
	/** 当前登录时间 */
	private Date currentLoginTime;
	/** 当前登录IP */
	private String currentLoginIp;
	/** 省 */
	private String province;
	/** 市 */
	private String city;
	/** 区 */
	private String district;
	/** 用户状态。1：启动，2：停用 */
	private int userStatus;
	
	private int userStyle;
	
	private int isDelete;
	
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
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
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
	 * @return the deptId
	 */
	public int getDeptId() {
		return deptId;
	}
	/**
	 * @param deptId the deptId to set
	 */
	public void setDeptId(int deptId) {
		this.deptId = deptId;
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
	 * @return the loginCount
	 */
	public int getLoginCount() {
		return loginCount;
	}
	/**
	 * @param loginCount the loginCount to set
	 */
	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}
	/**
	 * @return the registerIp
	 */
	public String getRegisterIp() {
		return registerIp;
	}
	/**
	 * @param registerIp the registerIp to set
	 */
	public void setRegisterIp(String registerIp) {
		this.registerIp = registerIp;
	}
	/**
	 * @return the lastLoginTime
	 */
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	/**
	 * @param lastLoginTime the lastLoginTime to set
	 */
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	/**
	 * @return the lastLoginIp
	 */
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	/**
	 * @param lastLoginIp the lastLoginIp to set
	 */
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	/**
	 * @return the currentLoginTime
	 */
	public Date getCurrentLoginTime() {
		return currentLoginTime;
	}
	/**
	 * @param currentLoginTime the currentLoginTime to set
	 */
	public void setCurrentLoginTime(Date currentLoginTime) {
		this.currentLoginTime = currentLoginTime;
	}
	/**
	 * @return the currentLoginIp
	 */
	public String getCurrentLoginIp() {
		return currentLoginIp;
	}
	/**
	 * @param currentLoginIp the currentLoginIp to set
	 */
	public void setCurrentLoginIp(String currentLoginIp) {
		this.currentLoginIp = currentLoginIp;
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
	 * @return the userStatus
	 */
	public int getUserStatus() {
		return userStatus;
	}
	/**
	 * @param userStatus the userStatus to set
	 */
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	/**
	 * @return the userStyle
	 */
	public int getUserStyle() {
		return userStyle;
	}
	/**
	 * @param userStyle the userStyle to set
	 */
	public void setUserStyle(int userStyle) {
		this.userStyle = userStyle;
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
	
}
