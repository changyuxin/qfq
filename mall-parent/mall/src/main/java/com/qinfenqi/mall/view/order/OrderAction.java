/**
 * 
 */
package com.qinfenqi.mall.view.order;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.bean.DeliverInfo;
import com.qinfenqi.mall.bean.DeliverInfoData;
import com.qinfenqi.mall.bean.ShopAddress;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.collar.service.CollarService;
import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.member.service.MemberService;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.order.service.OrderService;
import com.qinfenqi.mall.product.query.ProductQuery;
import com.qinfenqi.mall.product.service.ProductService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月3日 下午3:12:41
 * @author Chang Yuxin
 * @version 1.0
 */
public class OrderAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = -5421589522775996936L;

	@Resource
	private OrderService orderService;
	@Resource
	private ProductService productService;
	@Resource
	private MemberService memberService;
	@Resource
	private CollarService collarService;

	private OrderQuery orderQuery;
	private ShopAddress address;
	private ProductQuery productQuery;
	private MemberQuery memberQuery;
	private CollarQuery collarQuery;
	private List<DeliverInfoData> deliverInfos;

	/**
	 * 进入订单确认界面
	 * 
	 * @return
	 */
	public String order() {
		address = orderService.getShopAddress(getCurrentUser());
		productQuery = new ProductQuery();
		productQuery.setProductId(orderQuery.getProductId());
		productQuery.setMonths(orderQuery.getMonths());
		productQuery.setFirstPay(orderQuery.getFirstPay());
		productQuery = productService.getProductDetailById(productQuery, getCurrentUser());
		if (getUserStyle() == 2) {
			collarQuery = collarService.getCollarByUserId(getCurrentUser().getUserId());
		} else {
			memberQuery = memberService.getMemberByUserId(getCurrentUser().getUserId());
		}
		//免费送产品跳入另一个界面
		if(orderQuery.getProductId() == 1568 || orderQuery.getProductId() == 1569 || orderQuery.getProductId() == 1570 )
		{
			return "freedetail";
		}
		else
		{
			return "detail";
		}
	}

	/**
	 * 创建订单
	 * 
	 * @return
	 */
	public String createOrder() {
		JSONObject json = new JSONObject();
		boolean result = orderService.createOrder(orderQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		json.put("orderId", orderQuery.getOrderId());
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

	/**
	 * 获取收货地址
	 * 
	 * @return
	 */
	public String getRecvInfo() {
		address = orderService.getShopAddress(getCurrentUser());
		return "recvinfo";
	}
	
	/**
	 * 获取收货地址
	 * 
	 * @return
	 */
	public String getFreeRecvInfo() {
		address = orderService.getShopAddress(getCurrentUser());
		return "freerecvinfo";
	}

	/**
	 * 物流信息
	 * 
	 * @return String
	 */
	public String deliverInfo() {
		DeliverInfo deliverInfo = orderService.getDeliverInfo(orderQuery);
		deliverInfos = deliverInfo.getData();
		return "deliver";
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
	 * @return the address
	 */
	public ShopAddress getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(ShopAddress address) {
		this.address = address;
	}

	/**
	 * @return the productQuery
	 */
	public ProductQuery getProductQuery() {
		return productQuery;
	}

	/**
	 * @param productQuery
	 *            the productQuery to set
	 */
	public void setProductQuery(ProductQuery productQuery) {
		this.productQuery = productQuery;
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
}
