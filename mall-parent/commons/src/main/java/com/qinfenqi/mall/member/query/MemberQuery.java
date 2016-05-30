/**
 * 
 */
package com.qinfenqi.mall.member.query;

import java.util.List;

import com.qinfenqi.mall.member.bean.Member;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月10日 下午2:44:50
 * @author Chang Yuxin
 * @version 1.0 
 */
public class MemberQuery extends Member {
	
	private String username;

    private String startTime;
	
	private String endTime;
	
	private String url;
	
	private String oauthType;
	
	private String opinion;
	
	private List<String> spyPhotos;
	
	private List<String> otherPhotos;
	
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return the opinion
	 */
	public String getOpinion() {
		return opinion;
	}

	/**
	 * @param opinion the opinion to set
	 */
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	/**
	 * @return the oauthType
	 */
	public String getOauthType() {
		return oauthType;
	}

	/**
	 * @param oauthType the oauthType to set
	 */
	public void setOauthType(String oauthType) {
		this.oauthType = oauthType;
	}

	/**
	 * @return the spyPhotos
	 */
	public List<String> getSpyPhotos() {
		return spyPhotos;
	}

	/**
	 * @param spyPhotos the spyPhotos to set
	 */
	public void setSpyPhotos(List<String> spyPhotos) {
		this.spyPhotos = spyPhotos;
	}

	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the otherPhotos
	 */
	public List<String> getOtherPhotos() {
		return otherPhotos;
	}

	/**
	 * @param otherPhotos the otherPhotos to set
	 */
	public void setOtherPhotos(List<String> otherPhotos) {
		this.otherPhotos = otherPhotos;
	}
	
}
