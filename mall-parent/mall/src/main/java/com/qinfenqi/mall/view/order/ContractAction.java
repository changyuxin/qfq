/**
 * 
 */
package com.qinfenqi.mall.view.order;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.joda.time.DateTime;

import com.qinfenqi.mall.bill.service.BillService;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.collar.service.CollarService;
import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.contract.bean.Contract;
import com.qinfenqi.mall.contract.service.ContractService;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.member.service.MemberService;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.order.service.OrderService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月30日 下午2:36:04
 * @author Chang Yuxin
 * @version 1.0
 */
public class ContractAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = 3050461002920374566L;

	@Resource
	private OrderService orderService;
	@Resource
	private ContractService contractService;
	@Resource
	private BillService billService;
	@Resource
	private MemberService memberService;
	@Resource
	private CollarService collarService;
	private OrderQuery orderQuery;
	private MemberQuery memberQuery;
	private CollarQuery collarQuery;
	private Contract contract;
	private String year;
	private String month;
	private String day1;
	private String day;

	/**
	 * 进入合同界面
	 * 
	 * @return
	 */
	public String contract() {
		orderQuery = orderService.getOrderById(orderQuery);
		if (getUserStyle() == 1) {
			memberQuery = memberService.getMemberByUserId(getUserId());
		}
		if (getUserStyle() == 2) {
			collarQuery = collarService.getCollarByUserId(getUserId());
		}
		contract = contractService.getContractCode();
		DateTime dt = DateTime.now().plusMonths(1);
		year = DateTime.now().getYear() + "";
		day = DateTime.now().getDayOfMonth() + "";
		month = DateTime.now().getMonthOfYear() + "";
		day1 = dt.getDayOfMonth() + "";
		return "detail";
	}

	/**
	 * 签订合同
	 * 
	 * @return
	 */
	public String createContract() {
		JSONObject json = new JSONObject();
		String msg = "";
		if (getUserStyle() == 1) {
			double creditLimit = memberQuery.getCreditLimit();
			if ((contract.getProductPrice() - contract.getFirstPay()) > creditLimit) {
				msg = "您目前的信用额度无法支付该订单所购买商品!";
			} else {
				contract.setUserId(getUserId());
				contractService.createContract(contract, memberQuery);
//				if (result) {
//					if(contract.getProductPrice() > contract.getFirstPay()){
//						billService.createBills(getCurrentUser(), contract);
//					}
//				}
			}
		}
		if (getUserStyle() == 2) {
			double creditLimit = collarQuery.getCreditLimit();
			if ((contract.getProductPrice() - contract.getFirstPay()) > creditLimit) {
				msg = "您目前的信用额度无法支付该订单所购买商品!";
			} else {
				contract.setUserId(getUserId());
				contractService.createContract(contract, collarQuery);
//				if (result) {
//					if(contract.getProductPrice() > contract.getFirstPay()){
//						billService.createBills(getCurrentUser(), contract);
//					}
//				}
			}
		}
		json.put("result", msg.length() == 0 ? SUCCESS : FAILURE);
		json.put("msg", msg);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * @return the orderQuery
	 */
	public OrderQuery getOrderQuery() {
		return orderQuery;
	}

	/**
	 * @param orderQuery
	 *            the orderQuery to set
	 */
	public void setOrderQuery(OrderQuery orderQuery) {
		this.orderQuery = orderQuery;
	}

	/**
	 * @return the memberQuery
	 */
	public MemberQuery getMemberQuery() {
		return memberQuery;
	}

	/**
	 * @param memberQuery
	 *            the memberQuery to set
	 */
	public void setMemberQuery(MemberQuery memberQuery) {
		this.memberQuery = memberQuery;
	}

	/**
	 * @return the contract
	 */
	public Contract getContract() {
		return contract;
	}

	/**
	 * @param contract
	 *            the contract to set
	 */
	public void setContract(Contract contract) {
		this.contract = contract;
	}

	/**
	 * @return the year
	 */
	public String getYear() {
		return year;
	}

	/**
	 * @param year
	 *            the year to set
	 */
	public void setYear(String year) {
		this.year = year;
	}

	/**
	 * @return the month
	 */
	public String getMonth() {
		return month;
	}

	/**
	 * @param month
	 *            the month to set
	 */
	public void setMonth(String month) {
		this.month = month;
	}

	/**
	 * @return the day
	 */
	public String getDay() {
		return day;
	}

	/**
	 * @param day
	 *            the day to set
	 */
	public void setDay(String day) {
		this.day = day;
	}

	/**
	 * @return the day1
	 */
	public String getDay1() {
		return day1;
	}

	/**
	 * @param day1 the day1 to set
	 */
	public void setDay1(String day1) {
		this.day1 = day1;
	}

	/**
	 * @return the collarQuery
	 */
	public CollarQuery getCollarQuery() {
		return collarQuery;
	}

	/**
	 * @param collarQuery
	 *            the collarQuery to set
	 */
	public void setCollarQuery(CollarQuery collarQuery) {
		this.collarQuery = collarQuery;
	}
}
