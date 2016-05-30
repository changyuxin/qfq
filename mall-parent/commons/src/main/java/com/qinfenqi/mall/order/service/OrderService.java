/**
 * 
 */
package com.qinfenqi.mall.order.service;

import java.io.InputStream;
import java.util.List;

import com.qinfenqi.mall.bean.DeliverInfo;
import com.qinfenqi.mall.bean.ShopAddress;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.system.bean.User;


/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月8日 下午2:35:54
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface OrderService {

	/**
	 * @param currentUser
	 * @return
	 */
	ShopAddress getShopAddress(User currentUser);

	/**
	 * @param order
	 * @param user 
	 * @return boolean
	 */
	boolean createOrder(OrderQuery orderQuery, User user);

	/**
	 * @param order
	 * @return
	 */
	OrderQuery getOrderById(OrderQuery orderQuery);

	/**
	 * @param orderQuery
	 * @return
	 */
	List<OrderQuery> getOrderList(OrderQuery orderQuery);

	/**
	 * @param orderQuery
	 * @param user 
	 * @return
	 */
	boolean saveDeliverInfoByOrderId(OrderQuery orderQuery, User user);

	/**
	 * @param orderQuery
	 * @param user 
	 * @return
	 */
	boolean cancelOrder(OrderQuery orderQuery, User user);

	/**
	 * @param orderQuery
	 * @param user 
	 * @return
	 */
	boolean auditPass(OrderQuery orderQuery, User user);

	/**
	 * @param orderQuery
	 * @param user 
	 * @return
	 */
	boolean auditNoPass(OrderQuery orderQuery, User user);
	
	/**
	 * @param orderQuery
	 * @return
	 */
	boolean cancelOrder(OrderQuery orderQuery);
	
	/**
	 * @param orderQuery
	 * @return
	 */
	int getOrderCount(OrderQuery orderQuery);

	/**
	 * @param orderQuery
	 * @return
	 */
	DeliverInfo getDeliverInfo(OrderQuery orderQuery);

	/**
	 * @return
	 */
	String getOrderCounts();

	/**
	 * @param orderQuery
	 * @return
	 */
	InputStream exportOrders(OrderQuery orderQuery);

	/**
	 * @param orderQuery
	 * @param user
	 * @return
	 */
	boolean saveReceiveInfoByOrderId(OrderQuery orderQuery, User user);

	/**
	 * @param orderQuery
	 * @param user
	 * @return
	 */
	boolean returnFirstPay(OrderQuery orderQuery, User user);


}
