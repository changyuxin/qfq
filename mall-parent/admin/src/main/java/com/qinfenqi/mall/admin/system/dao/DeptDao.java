/**
 * 
 */
package com.qinfenqi.mall.admin.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.admin.system.query.DeptQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年8月3日 上午11:36:08
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface DeptDao {

	/**
	 * @return
	 */
	List<DeptQuery> getDeptList();

}
