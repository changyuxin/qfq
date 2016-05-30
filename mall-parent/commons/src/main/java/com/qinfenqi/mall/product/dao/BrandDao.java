/**
 * 
 */
package com.qinfenqi.mall.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.product.bean.Brand;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 下午7:21:05
 * @author Chang Yuxin
 * @version 1.0 
 */
@Repository
public interface BrandDao {

	/**
	 * @return
	 */
	List<Brand> getBrandList();

}
