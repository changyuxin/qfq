/**
 * 
 */
package com.qinfenqi.mall.admin.log;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.qinfenqi.mall.bean.Log;
import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.log.service.LogService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月13日 下午4:05:55
 * @author Chang Yuxin
 * @version 1.0
 */
public class LogAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = 3179116709003048646L;

	@Resource
	private LogService logService;

	private Log log;
	private List<Log> logs = new ArrayList<Log>();

	public String logList() {
		logs = logService.getLogList(log);
		return "list";
	}

	/**
	 * @return the log
	 */
	public Log getLog() {
		return log;
	}

	/**
	 * @param log
	 *            the log to set
	 */
	public void setLog(Log log) {
		this.log = log;
	}

	/**
	 * @return the logs
	 */
	public List<Log> getLogs() {
		return logs;
	}

	/**
	 * @param logs the logs to set
	 */
	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}

}
