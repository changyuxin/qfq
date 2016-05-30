/**
 * 
 */
package com.qinfenqi.mall.admin.order;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.bean.DeliverInfo;
import com.qinfenqi.mall.bean.DeliverInfoData;
import com.qinfenqi.mall.bill.service.BillService;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.collar.service.CollarService;
import com.qinfenqi.mall.common.constant.Encoding;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.member.service.MemberService;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.order.service.OrderService;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.system.service.UserService;
import com.qinfenqi.mall.util.DateUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月10日 上午8:43:21
 * @author Chang Yuxin
 * @version 1.0
 */
public class OrderAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -2835069664915457337L;
	@Resource
	private OrderService orderService;
	@Resource
	private MemberService memberService;
	@Resource
	private CollarService collarService;
	@Resource
	private UserService userService;
	@Resource
	private BillService billService;
	private List<OrderQuery> orderList;
	private OrderQuery orderQuery = new OrderQuery();
	private List<DeliverInfoData> deliverInfos;
	private String countStr;

	/**
	 * 进入订单管理页面
	 * 
	 * @return
	 */
	public String index() {
		countStr = orderService.getOrderCounts();
		return "index";
	}

	/**
	 * 获取订单列表
	 * 
	 * @return
	 */
	public String getOrdersPage() {
		orderQuery.setPageSize(10);
		orderList = orderService.getOrderList(orderQuery);
		double total = orderService.getOrderCount(orderQuery);
		double pageSize = orderQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		orderQuery.setPageTotal(pageTotal);
		orderQuery.setTotal((int) total);
		return "manage";
	}

	/**
	 * 保存发货信息页面
	 * 
	 * @return
	 */
	public String deliverPage() {
		orderQuery = orderService.getOrderById(orderQuery);
		return "deliver";
	}

	/**
	 * 保存发货信息
	 * 
	 * @return
	 */
	public String saveDeliverInfo() {
		JSONObject json = new JSONObject();
		boolean result = orderService.saveDeliverInfoByOrderId(orderQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 物流信息
	 * 
	 * @return String
	 */
	public String deliverInfo() {
		DeliverInfo deliverInfo = orderService.getDeliverInfo(orderQuery);
		deliverInfos = deliverInfo.getData();
		return "deliverinfo";
	}

	/**
	 * 编辑发货人信息页面
	 * 
	 * @return
	 */
	public String receivePage() {
		orderQuery = orderService.getOrderById(orderQuery);
		return "receive";
	}

	/**
	 * 保存发货信息
	 * 
	 * @return
	 */
	public String saveReceiveInfo() {
		JSONObject json = new JSONObject();
		boolean result = orderService.saveReceiveInfoByOrderId(orderQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	public String auditPass() {
		JSONObject json = new JSONObject();
		String msg = "";
		long userId = orderQuery.getUserId();
		// 获取用户信息
		UserQuery userQuery = new UserQuery();
		userQuery.setUserId(userId);
		userQuery = userService.getUserByUserId(userQuery);
		boolean result = false;
		// 根据用户类型处理订单
		if (userQuery.getUserStyle() == 1) {
			MemberQuery memberQuery = memberService.getMemberByUserId(userId);
			if ((memberQuery.getIsIdOauth() == 3 && memberQuery.getIsContactOauth() == 3 && memberQuery.getIsBkcardOauth() == 3
					&& memberQuery.getIsEcpOauth() == 3 && memberQuery.getIsCardOauth() == 3)
					|| memberQuery.getIsBkflowOauth() == 3) {
				result = true;
			} else {
				msg = "信用审核未通过，订单无法审核不通过!";
			}

		}
		if (userQuery.getUserStyle() == 2) {
			CollarQuery collarQuery = collarService.getCollarByUserId(userId);
			if (collarQuery.getAuditStatus() == 3) {
				result = true;
			} else {
				msg = "信用审核未通过，订单无法审核不通过!";
			}
		}

		if (result) {
			result = billService.createBills(orderQuery);
			if (result) {
				orderService.auditPass(orderQuery, getCurrentUser());
			}
		}

		json.put("result", msg.length() > 0 ? FAILURE : SUCCESS);
		json.put("msg", msg);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 审核页面
	 * 
	 * @return
	 */
	public String auditPage() {
		return "audit";
	}

	public String auditNoPass() {
		JSONObject json = new JSONObject();
		boolean result = orderService.auditNoPass(orderQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 取消订单
	 * 
	 * @return
	 */
	public String cancelOrder() {
		JSONObject json = new JSONObject();
		boolean result = orderService.cancelOrder(orderQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	public String exportOrders() {
		String fileName = "order_" + DateUtil.getCurrentDate(DateUtil.DATE_FOMATE_YYYYMMDDHHMMSS) + ".xls";
		excelFileName = encodeDownloadName(fileName);
		response.setCharacterEncoding(Encoding.UTF_8);
		excelStream = orderService.exportOrders(orderQuery);
		return "excel";
	}

	/**
	 * 退首付
	 * 
	 * @return
	 */
	public String returnFirstPay() {
		JSONObject json = new JSONObject();
		boolean result = orderService.returnFirstPay(orderQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * @return the orderList
	 */
	public List<OrderQuery> getOrderList() {
		return orderList;
	}

	/**
	 * @param orderList
	 *            the orderList to set
	 */
	public void setOrderList(List<OrderQuery> orderList) {
		this.orderList = orderList;
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
	 * @return the deliverInfos
	 */
	public List<DeliverInfoData> getDeliverInfos() {
		return deliverInfos;
	}

	/**
	 * @param deliverInfos
	 *            the deliverInfos to set
	 */
	public void setDeliverInfos(List<DeliverInfoData> deliverInfos) {
		this.deliverInfos = deliverInfos;
	}

	/**
	 * @return the countStr
	 */
	public String getCountStr() {
		return countStr;
	}

	/**
	 * @param countStr
	 *            the countStr to set
	 */
	public void setCountStr(String countStr) {
		this.countStr = countStr;
	}

}
