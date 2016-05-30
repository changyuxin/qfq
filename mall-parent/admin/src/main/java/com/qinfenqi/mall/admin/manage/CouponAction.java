/**
 * 
 */
package com.qinfenqi.mall.admin.manage;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.manage.query.CouponQuery;
import com.qinfenqi.mall.manage.service.CouponService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年11月9日 下午4:16:19
 * @author Chang Yuxin
 * @version 1.0
 */
public class CouponAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = 550037915907707717L;
	@Resource
	private CouponService couponService;
	private CouponQuery couponQuery = new CouponQuery();
	private List<CouponQuery> coupons;

	public String manage() {
		return "manage";
	}

	/**
	 * 获取优惠券列表
	 * 
	 * @return
	 */
	public String queryCouponList() {
		coupons = couponService.getCouponList(couponQuery);
		double total = couponService.getCouponCount(couponQuery);
		double pageSize = couponQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		couponQuery.setPageTotal(pageTotal);
		couponQuery.setTotal((int) total);
		return "list";

	}

	/**
	 * 保存优惠券页面
	 * 
	 * @return
	 */
	public String saveCouponPage() {
		long couponId = couponQuery.getCouponId();
		if (couponId > 0) {
			couponQuery = couponService.getCouponById(couponQuery);
		}
		return "save";
	}

	/**
	 * 保存优惠券
	 * 
	 * @return
	 */
	public String saveCoupon() {
		long couponId = couponQuery.getCouponId();
		boolean result = false;
		if (couponId == 0) {
			result = couponService.addCoupon(couponQuery);
		} else {
			result = couponService.editCoupon(couponQuery);
		}
		JSONObject json = new JSONObject();
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 删除优惠券
	 * 
	 * @return
	 */
	public String deleteCoupon() {
		JSONObject json = new JSONObject();
		boolean result = couponService.deleteCoupon(couponQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;

	}

	public String enableCoupon() {
		JSONObject json = new JSONObject();
		boolean result = false;
		result = couponService.enableCoupon(couponQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * @return the coupon
	 */
	public CouponQuery getCouponQuery() {
		return couponQuery;
	}

	/**
	 * @param coupon
	 *            the coupon to set
	 */
	public void setCouponQuery(CouponQuery couponQuery) {
		this.couponQuery = couponQuery;
	}

	/**
	 * @return the coupons
	 */
	public List<CouponQuery> getCoupons() {
		return coupons;
	}

	/**
	 * @param coupons
	 *            the coupons to set
	 */
	public void setCoupons(List<CouponQuery> coupons) {
		this.coupons = coupons;
	}

}
