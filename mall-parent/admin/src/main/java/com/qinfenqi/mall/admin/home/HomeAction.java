/**
 * 
 */
package com.qinfenqi.mall.admin.home;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.admin.system.info.SystemInfoHandler;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 下午3:36:34
 * @author Chang Yuxin
 * @version 1.0
 */
public class HomeAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = 8476817347002736350L;
	/** 系统运行信息 */
	private SystemInfoHandler systemInfo;

	/**
	 * 进入用户管理页
	 * 
	 * @return
	 */
	public String index() {
		return "index";
	}

	/**
	 * 进行系统信息页面
	 * 
	 * @return
	 */
	public String sysinfo() {
		systemInfo = new SystemInfoHandler();
		return "sysinfo";
	}

	/**
	 * @return the systemInfo
	 */
	public SystemInfoHandler getSystemInfo() {
		return systemInfo;
	}

	/**
	 * @param systemInfo
	 *            the systemInfo to set
	 */
	public void setSystemInfo(SystemInfoHandler systemInfo) {
		this.systemInfo = systemInfo;
	}
}
