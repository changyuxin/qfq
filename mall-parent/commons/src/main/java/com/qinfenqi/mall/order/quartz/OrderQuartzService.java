/**
 * 
 */
package com.qinfenqi.mall.order.quartz;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月11日 下午2:27:34
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface OrderQuartzService {
	/**
	 * 定时任务
	 * 定时更新订单状态
	 * 
	 */
	public void updateOrderStatus();
}
