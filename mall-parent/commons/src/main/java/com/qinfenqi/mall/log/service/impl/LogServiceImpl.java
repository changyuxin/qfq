/**
 * 
 */
package com.qinfenqi.mall.log.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.Log;
import com.qinfenqi.mall.log.dao.LogDao;
import com.qinfenqi.mall.log.service.LogService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月13日 下午4:20:10
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("logService")
public class LogServiceImpl implements LogService {

	@Resource
	private LogDao logDao;

	@Override
	public List<Log> getLogList(Log log) {
		return logDao.queryLogList(log);
	}
	
}
