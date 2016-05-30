/**
 * 
 */
package com.qinfenqi.mall.bean;

import java.util.List;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月8日 下午3:47:44
 * @author Chang Yuxin
 * @version 1.0 
 */
public class DeliverInfo {
	private String id;
	private String name;
	private String order;
	private int num;
	private String updateTime;
	private String message;
	private int errCode;
	private int status;
	private List<DeliverInfoData> data;
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the order
	 */
	public String getOrder() {
		return order;
	}
	/**
	 * @param order the order to set
	 */
	public void setOrder(String order) {
		this.order = order;
	}
	/**
	 * @return the num
	 */
	public int getNum() {
		return num;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(int num) {
		this.num = num;
	}
	/**
	 * @return the updateTime
	 */
	public String getUpdateTime() {
		return updateTime;
	}
	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return the errCode
	 */
	public int getErrCode() {
		return errCode;
	}
	/**
	 * @param errCode the errCode to set
	 */
	public void setErrCode(int errCode) {
		this.errCode = errCode;
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
	 * @return the data
	 */
	public List<DeliverInfoData> getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(List<DeliverInfoData> data) {
		this.data = data;
	}
}

