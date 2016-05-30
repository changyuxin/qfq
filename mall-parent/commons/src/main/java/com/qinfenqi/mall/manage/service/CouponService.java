/**
 * 
 */
package com.qinfenqi.mall.manage.service;

import java.util.List;

import com.qinfenqi.mall.manage.bean.CouponRecord;
import com.qinfenqi.mall.manage.query.CouponQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月9日 下午5:00:37
 * @author Chang Yuxin
 * @version 1.0
 */
public interface CouponService {

	/**
	 * @param coupon
	 * @return
	 */
	List<CouponQuery> getCouponList(CouponQuery couponQuery);

	/**
	 * @param couponQuery
	 * @return
	 */
	int getCouponCount(CouponQuery couponQuery);

	/**
	 * @param couponQuery
	 * @return
	 */
	CouponQuery getCouponById(CouponQuery couponQuery);

	/**
	 * @param couponQuery
	 * @return
	 */
	boolean addCoupon(CouponQuery couponQuery);

	/**
	 * @param couponQuery
	 * @return
	 */
	boolean editCoupon(CouponQuery couponQuery);

	/**
	 * @param couponQuery
	 * @return
	 */
	boolean deleteCoupon(CouponQuery couponQuery);

	/**
	 * @param coupon
	 * @return
	 */
	boolean enableCoupon(CouponQuery coupon);

	/**
	 * @param couponRecord
	 * @return
	 */
	List<CouponRecord> getCouponRecordList(CouponRecord couponRecord);

}
