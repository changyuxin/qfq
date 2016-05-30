/**
 * 
 */
package com.qinfenqi.mall.collar.query;

import java.util.List;

import com.qinfenqi.mall.collar.bean.Collar;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月20日 上午10:03:42
 * @author Chang Yuxin
 * @version 1.0
 */
public class CollarQuery extends Collar {
	private List<String> othersDetail;
	
	private String username;
	
	private String url;
	
	private List<String> SpyPhotos;
	
	/**
	 * @return the othersDetail
	 */
	public List<String> getOthersDetail() {
		return othersDetail;
	}

	/**
	 * @param othersDetail the othersDetail to set
	 */
	public void setOthersDetail(List<String> othersDetail) {
		this.othersDetail = othersDetail;
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
	 * @return the spyPhotos
	 */
	public List<String> getSpyPhotos() {
		return SpyPhotos;
	}

	/**
	 * @param spyPhotos the spyPhotos to set
	 */
	public void setSpyPhotos(List<String> spyPhotos) {
		SpyPhotos = spyPhotos;
	}
	
}
