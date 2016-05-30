/**
 * 
 */
package com.qinfenqi.mall.manage.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.common.base.BaseService;
import com.qinfenqi.mall.manage.bean.CouponRecord;
import com.qinfenqi.mall.manage.dao.CouponDao;
import com.qinfenqi.mall.manage.query.CouponQuery;
import com.qinfenqi.mall.manage.service.CouponService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月9日 下午5:00:57
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("couponService")
public class CouponServiceImpl extends BaseService implements CouponService {

	@Resource
	private CouponDao couponDao;

	@Override
	public List<CouponQuery> getCouponList(CouponQuery couponQuery) {
		return couponDao.getCouponList(couponQuery);
	}

	@Override
	public int getCouponCount(CouponQuery couponQuery) {
		return couponDao.getCouponCount(couponQuery);
	}

	@Override
	public CouponQuery getCouponById(CouponQuery couponQuery) {
		return couponDao.getCouponById(couponQuery);
	}

	@Override
	public boolean addCoupon(CouponQuery couponQuery) {
		couponQuery.setCreateTime(new Date());
		return couponDao.createCoupon(couponQuery);
	}

	@Override
	public boolean editCoupon(CouponQuery couponQuery) {
		return couponDao.modifyCoupon(couponQuery);
	}

	@Override
	public boolean deleteCoupon(CouponQuery couponQuery) {
		return couponDao.deleteCoupon(couponQuery);
	}

	@Override
	public boolean enableCoupon(CouponQuery couponQuery) {
		return couponDao.enableCoupon(couponQuery);
	}

	@Override
	public List<CouponRecord> getCouponRecordList(CouponRecord couponRecord){
		return couponDao.getCouponRecordList(couponRecord);
	}

}
