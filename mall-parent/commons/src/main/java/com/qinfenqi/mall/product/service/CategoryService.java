/**
 * 
 */
package com.qinfenqi.mall.product.service;

import java.util.List;

import com.qinfenqi.mall.product.bean.Category;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 上午10:05:00
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface CategoryService {

	/**
	 * @return
	 */
	List<Category> getCategoryList();

	/**
	 * @param categoryLevel
	 * @return
	 */
	List<Category> getCategoryListByLevel(int categoryLevel);

	/**
	 * @param categoryId
	 * @return
	 */
	Category getCategoryById(int categoryId);

}
