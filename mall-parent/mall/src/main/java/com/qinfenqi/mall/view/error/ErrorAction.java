/**
 * 
 */
package com.qinfenqi.mall.view.error;

import com.qinfenqi.mall.common.base.BaseAction;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月26日 下午4:00:00
 * @author Chang Yuxin
 * @version 1.0
 */
public class ErrorAction extends BaseAction {

	/** */
	private static final long serialVersionUID = -1224679005672777072L;

	public String error404() {
		return "404";
	}

	public String error500() {
		return "500";
	}
}
