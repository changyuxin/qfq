/**
 * 
 */
package com.qinfenqi.mall.order.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.order.query.OrderQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月8日 下午2:37:19
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface OrderDao {

	/**
	 * @param order
	 * @return
	 */
	boolean createOrder(OrderQuery orderQuery);

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
	 * @return
	 */
	boolean saveDeliverInfoByOrderId(OrderQuery orderQuery);

	/**
	 * @param order
	 * @return
	 */
	boolean updateOrderStatus(OrderQuery orderQuery);

	/**
	 * @return
	 */
	String queryOrderCode();

	/**
	 * @param orderQuery
	 */
	boolean updateFirstPayStatus(OrderQuery orderQuery);
	/**
	 * @param orderQuery
	 * @return
	 */
	int getOrderCount(OrderQuery orderQuery);

	/**
	 * @return
	 */
	List<OrderQuery> getDeliverList();

	/**
	 * @return
	 */
	List<Count> getOrderCounts();

	/**
	 * @param orderQuery
	 * @return
	 */
	boolean saveReceiveInfoByOrderId(OrderQuery orderQuery);

	/**
	 * @param orderQuery
	 * @return
	 */
	boolean returnFirstPay(OrderQuery orderQuery);

}
