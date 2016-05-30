/**
 * 
 */
package com.qinfenqi.mall.pay.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.Wxuser;
import com.qinfenqi.mall.pay.bean.PayLog;
import com.qinfenqi.mall.pay.bean.Payment;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月3日 上午8:45:56
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface PayDao {

	/**
	 * @param payment
	 * @return
	 */
	PayLog getPayLogByPayLogId(Payment payment);

	/**
	 * @param payLog
	 */
	boolean createPayLog(PayLog payLog);

	/**
	 * @param wxuser
	 */
	boolean createWxuser(Wxuser wxuser);

	/**
	 * @param payLog
	 */
	boolean updatePayLog(PayLog payLog);

	/**
	 * @param payLog 
	 * 
	 */
	boolean deletePayLog(PayLog payLog);

	/**
	 * @param payLog
	 * @return
	 */
	List<PayLog> getPayList(PayLog payLog);

}
