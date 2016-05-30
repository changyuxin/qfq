/**
 * 
 */
package com.qinfenqi.mall.manage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.manage.bean.CouponRecord;
import com.qinfenqi.mall.manage.query.CouponQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月9日 下午5:02:39
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface CouponDao {

	/**
	 * @param coupon
	 * @return
	 */
	List<CouponQuery> getCouponList(CouponQuery couponQuery);

	/**
	 * @param coupon
	 * @return
	 */
	int getCouponCount(CouponQuery couponQuery);

	/**
	 * @param coupon
	 * @return
	 */
	CouponQuery getCouponById(CouponQuery couponQuery);

	/**
	 * @param coupon
	 * @return
	 */
	boolean createCoupon(CouponQuery couponQuery);

	/**
	 * @param coupon
	 * @return
	 */
	boolean modifyCoupon(CouponQuery couponQuery);

	/**
	 * @param coupon
	 * @return
	 */
	boolean deleteCoupon(CouponQuery couponQuery);

	/**
	 * @param coupon
	 * @return
	 */
	boolean enableCoupon(CouponQuery couponQuery);

	/**
	 * @param couponQuery
	 * @return
	 */
	List<CouponRecord> getCouponRecordList(CouponRecord couponRecord);

}
