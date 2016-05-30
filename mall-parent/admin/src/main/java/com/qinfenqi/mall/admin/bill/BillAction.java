/**
 * 
 */
package com.qinfenqi.mall.admin.bill;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.bill.service.BillService;
import com.qinfenqi.mall.pay.bean.PayLog;
import com.qinfenqi.mall.util.DateUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 下午1:26:16
 * @author Chang Yuxin
 * @version 1.0
 */
public class BillAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -1376614210959518477L;

	@Resource
	private BillService billService;

	private BillQuery billQuery = new BillQuery();

	private List<BillQuery> bills = new ArrayList<BillQuery>();
	
	private List<PayLog> payList;
	
	/**
	 * 首页
	 * 
	 * @return
	 */
	public String index() {
		return "index";
	}

	/**
	 * 获取白领列表
	 * 
	 * @return
	 */
	public String getBillsPage() {

		Date currentDay = new Date();
		String currentDayTime = DateUtil.format(currentDay, DateUtil.DEFAULT_FORMAT);
		// 计算最近后两天
		String nextDay = DateUtil.getDateAfter(currentDay, 1, DateUtil.DATE_FORMAT);
		String thirdDay = DateUtil.getDateAfter(currentDay, 2, DateUtil.DATE_FORMAT);
		
		// 计算最近前两天
		String beforeYesterday = DateUtil.getDateBefore(currentDay, 3, DateUtil.DATE_FORMAT);
		
		billQuery.setCurrentDay(currentDayTime);
		billQuery.setNextDay(nextDay);
		billQuery.setThirdDay(thirdDay);
		billQuery.setBeforeYesterday(beforeYesterday);
		
		billQuery.setPageSize(15);
		bills = billService.getBillList(billQuery);
		double total = billService.getBillCount(billQuery);
		double pageSize = billQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		billQuery.setPageTotal(pageTotal);
		billQuery.setTotal((int) total);
		return "manage";
	}

	public String showBillDetail() {
		billQuery.setOrderField("bill_id");
		billQuery.setPage(false);
		billQuery.setOrderType("asc");
		bills = billService.getBillListByOrderId(billQuery);
		return "list";
	}
	
	public String auditPage(){
		return "audit";
	}
	
	public String auditResult(){
		JSONObject json = new JSONObject();
		boolean result = billService.auditResult(billQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	
	public String payList(){
		payList = billService.getPayList(billQuery);
		return "paylist";
		
	}
	
	/**
	 * @return the billQuery
	 */
	public BillQuery getBillQuery() {
		return billQuery;
	}

	/**
	 * @param billQuery
	 *            the billQuery to set
	 */
	public void setBillQuery(BillQuery billQuery) {
		this.billQuery = billQuery;
	}

	/**
	 * @return the bills
	 */
	public List<BillQuery> getBills() {
		return bills;
	}

	/**
	 * @param bills
	 *            the bills to set
	 */
	public void setBills(List<BillQuery> bills) {
		this.bills = bills;
	}

	/**
	 * @return the payList
	 */
	public List<PayLog> getPayList() {
		return payList;
	}

	/**
	 * @param payList the payList to set
	 */
	public void setPayList(List<PayLog> payList) {
		this.payList = payList;
	}
	
	
}
