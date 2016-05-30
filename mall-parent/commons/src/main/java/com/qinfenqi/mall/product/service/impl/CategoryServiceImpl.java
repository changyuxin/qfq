/**
 * 
 */
package com.qinfenqi.mall.product.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.product.bean.Category;
import com.qinfenqi.mall.product.dao.CategoryDao;
import com.qinfenqi.mall.product.service.CategoryService;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 上午10:06:32
 * @author Chang Yuxin
 * @version 1.0 
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Resource
	private CategoryDao categoryDao;
	
	@Override
	public List<Category> getCategoryList() {
		List<Category> categoryList = categoryDao.getCategoryList();
		return dealCategoryList(categoryList);
	}

	/**
	 * @param categoryList
	 */
	private List<Category> dealCategoryList(List<Category> categoryList) {
		Map<Integer, Category> map = new HashMap<Integer, Category>();
		List<Category> categorys = new ArrayList<Category>();
		for (Category category : categoryList) {
			if(category.getLevel() == 1){
				map.put(category.getCategoryId(), category);
				categorys.add(category);
			} else {
				map.get(category.getPcategoryId()).addChildren(category);
			}
		}
		return categorys;
	}

	@Override
	public List<Category> getCategoryListByLevel(int categoryLevel) {
		return categoryDao.getCategoryListByLevel(categoryLevel);
	}

	@Override
	public Category getCategoryById(int categoryId) {
		return categoryDao.getCategoryById(categoryId);
	}

}
