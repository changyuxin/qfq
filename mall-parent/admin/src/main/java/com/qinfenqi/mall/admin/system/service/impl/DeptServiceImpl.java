/**
 * 
 */
package com.qinfenqi.mall.admin.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.admin.system.dao.DeptDao;
import com.qinfenqi.mall.admin.system.query.DeptQuery;
import com.qinfenqi.mall.admin.system.service.DeptService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年8月3日 上午11:35:00
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("deptService")
public class DeptServiceImpl implements DeptService {

	@Resource
	private DeptDao deptDao;

	@Override
	public List<DeptQuery> getDeptList() {
		return deptDao.getDeptList();
	}

}
