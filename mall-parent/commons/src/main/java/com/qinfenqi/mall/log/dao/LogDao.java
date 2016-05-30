/**
 * 
 */
package com.qinfenqi.mall.log.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.Log;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月13日 下午3:03:17
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface LogDao {

	/**
	 * @param log
	 */
	boolean createLog(Log log);

	/**
	 * @param log
	 * @return
	 */
	List<Log> queryLogList(Log log);

}
