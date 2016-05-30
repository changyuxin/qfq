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
 * @bulid: 2015年7月13日 下午2:43:50
 * @author Chang Yuxin
 * @version 1.0 
 */
public class Log {
	private long logId;
	private long userId;
	private String userName;
	private int bizType;
	private long bizId;
	private String description;
	private Date createTime;
	/**
	 * @return the logId
	 */
	public long getLogId() {
		return logId;
	}
	/**
	 * @param logId the logId to set
	 */
	public void setLogId(long logId) {
		this.logId = logId;
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
	 * @return the bizType
	 */
	public int getBizType() {
		return bizType;
	}
	/**
	 * @param bizType the bizType to set
	 */
	public void setBizType(int bizType) {
		this.bizType = bizType;
	}
	/**
	 * @return the bizId
	 */
	public long getBizId() {
		return bizId;
	}
	/**
	 * @param bizId the bizId to set
	 */
	public void setBizId(long bizId) {
		this.bizId = bizId;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
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
