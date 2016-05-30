/**
 * 
 */
package com.qinfenqi.mall.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.product.bean.Brand;
import com.qinfenqi.mall.product.dao.BrandDao;
import com.qinfenqi.mall.product.service.BrandService;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 下午7:19:11
 * @author Chang Yuxin
 * @version 1.0 
 */
@Service("brandService")
public class BrandServiceImpl implements BrandService {
	
	@Resource
	private BrandDao brandDao;

	@Override
	public List<Brand> getBrandList() {
		return brandDao.getBrandList();
	}
}
