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
 * @bulid: 2016年5月6日 下午4:32:18
 * @author Sun Xiang
 * @version 1.0 
 */
public class Comment implements Comparable<Comment>{
	public int commentId; // 评论id
	/**
	 * @return the showname
	 */
	public String getShowname() {
		return showname;
	}
	/**
	 * @param showname the showname to set
	 */
	public void setShowname(String showname) {
		this.showname = showname;
	}
	public String content; // 评论内容
	public String username; // 用户姓名	
	public String showname; // 用户姓名
	public int productId; //评论的产品
	public String address;//用户住址
	public int satisify; //好评度
	public int priceStar; //好评度
	public int qualityStar; //好评度
	public int serviceStar; //好评度

	/**
	 * @return the priceStar
	 */
	public int getPriceStar() {
		return priceStar;
	}
	/**
	 * @param priceStar the priceStar to set
	 */
	public void setPriceStar(int priceStar) {
		this.priceStar = priceStar;
	}
	/**
	 * @return the qualityStar
	 */
	public int getQualityStar() {
		return qualityStar;
	}
	/**
	 * @param qualityStar the qualityStar to set
	 */
	public void setQualityStar(int qualityStar) {
		this.qualityStar = qualityStar;
	}
	/**
	 * @return the serviceStar
	 */
	public int getServiceStar() {
		return serviceStar;
	}
	/**
	 * @param serviceStar the serviceStar to set
	 */
	public void setServiceStar(int serviceStar) {
		this.serviceStar = serviceStar;
	}
	/**
	 * @return the satisify
	 */
	public int getSatisify() {
		return satisify;
	}
	/**
	 * @param satisify the satisify to set
	 */
	public void setSatisify(int satisify) {
		this.satisify = satisify;
	}
	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
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
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}
	private String pic1Url;
	private String pic2Url;
	private String pic3Url;
	private String pic4Url;
	private String pic5Url;
	/**
	 * @return the commentId
	 */
	public int getCommentId() {
		return commentId;
	}
	/**
	 * @param commentId the commentId to set
	 */
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
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
	 * @return the pic1Url
	 */
	public String getPic1Url() {
		return pic1Url;
	}
	/**
	 * @param pic1Url the pic1Url to set
	 */
	public void setPic1Url(String pic1Url) {
		this.pic1Url = pic1Url;
	}
	/**
	 * @return the pic2Url
	 */
	public String getPic2Url() {
		return pic2Url;
	}
	/**
	 * @param pic2Url the pic2Url to set
	 */
	public void setPic2Url(String pic2Url) {
		this.pic2Url = pic2Url;
	}
	/**
	 * @return the pic3Url
	 */
	public String getPic3Url() {
		return pic3Url;
	}
	/**
	 * @param pic3Url the pic3Url to set
	 */
	public void setPic3Url(String pic3Url) {
		this.pic3Url = pic3Url;
	}
	/**
	 * @return the pic4Url
	 */
	public String getPic4Url() {
		return pic4Url;
	}
	/**
	 * @param pic4Url the pic4Url to set
	 */
	public void setPic4Url(String pic4Url) {
		this.pic4Url = pic4Url;
	}
	/**
	 * @return the pic5Url
	 */
	public String getPic5Url() {
		return pic5Url;
	}
	/**
	 * @param pic5Url the pic5Url to set
	 */
	public void setPic5Url(String pic5Url) {
		this.pic5Url = pic5Url;
	}
	/**
	 * @return the commentDate
	 */
	private Date commentDate; //评论时间

	/**
	 * @return the commentDate
	 */
	public Date getCommentDate() {
		return commentDate;
	}
	/**
	 * @param date the commentDate to set
	 */
	public void setCommentDate(Date date) {
		this.commentDate = date;
	}
	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	@Override
	public int compareTo(Comment o) {
		// TODO Auto-generated method stub
		return o.commentId - this.commentId;
	}
	

}
