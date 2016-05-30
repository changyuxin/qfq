/**
 * 
 */
package com.qinfenqi.mall.common.dao;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.MallSetting;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月14日 上午11:25:45
 * @author Chang Yuxin
 * @version 1.0 
 */
@Repository
public interface CommonDao {

	/**
	 * @param string
	 * @return
	 */
	
	public MallSetting getMallSetting(String paramKey);
}
