/**
 * 
 */
package com.qinfenqi.mall.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.product.bean.Category;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 上午10:05:53
 * @author Chang Yuxin
 * @version 1.0 
 */
@Repository
public interface CategoryDao {

	/**
	 * @return
	 */
	List<Category> getCategoryList();

	/**
	 * @param level
	 * @return
	 */
	List<Category> getCategoryListByLevel(int level);

	/**
	 * @param categoryId
	 * @return
	 */
	Category getCategoryById(int categoryId);

}
