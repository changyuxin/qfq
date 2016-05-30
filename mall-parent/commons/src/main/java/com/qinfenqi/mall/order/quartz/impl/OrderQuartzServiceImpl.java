/**
 * 
 */
package com.qinfenqi.mall.order.quartz.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.qinfenqi.mall.bean.DeliverInfo;
import com.qinfenqi.mall.common.constant.OrderStatus;
import com.qinfenqi.mall.common.helper.DeliverInfoHelper;
import com.qinfenqi.mall.order.dao.OrderDao;
import com.qinfenqi.mall.order.quartz.OrderQuartzService;
import com.qinfenqi.mall.order.query.OrderQuery;
/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月11日 下午2:30:46
 * @author Chang Yuxin
 * @version 1.0 
 */
@Service("orderQuartzService")
public class OrderQuartzServiceImpl implements OrderQuartzService{
	private static final Logger logger = Logger.getLogger(OrderQuartzServiceImpl.class);
	@Resource
	private OrderDao orderDao;
	
	public void updateOrderStatus() {
		logger.info("更新订单信息状态START！");
		List<OrderQuery> list = orderDao.getDeliverList();
		for(OrderQuery orderQuery : list){
			String order = orderQuery.getDeliverCode();
			if(null != order && "".equals(order) == false){
				String content = DeliverInfoHelper.getDeliverInfo(orderQuery.getDeliverCode(), orderQuery.getDeliverName());
				Gson gson = new Gson();
				DeliverInfo di = gson.fromJson(content, DeliverInfo.class);
				//status等于多少为已签收状态呢？？待确认
				if(di.getStatus() == OrderStatus.DELIVER_COMPLETE.getId()){
					if(orderQuery.getOrderTypes() == 1){
						orderQuery.setOrderStatus(OrderStatus.PAYMENTING.getId());
					}
					if(orderQuery.getOrderTypes() == 2){
						orderQuery.setOrderStatus(OrderStatus.RECEIVE_COMMPLETE.getId());
					}
					orderQuery.setUpdateTime(new Date());
					orderDao.updateOrderStatus(orderQuery);
				}
			}
		}
		logger.info("更新订单信息状态END！");
	}

}
