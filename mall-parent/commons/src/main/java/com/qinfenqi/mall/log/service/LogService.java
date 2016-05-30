/**
 * 
 */
package com.qinfenqi.mall.log.service;

import java.util.List;

import com.qinfenqi.mall.bean.Log;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月13日 下午4:19:40
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface LogService {

	/**
	 * @param log
	 * @return
	 */
	List<Log> getLogList(Log log);

}
