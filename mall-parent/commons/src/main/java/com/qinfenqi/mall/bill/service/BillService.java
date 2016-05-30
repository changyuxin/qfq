/**
 * 
 */
package com.qinfenqi.mall.bill.service;

import java.util.List;

import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.contract.bean.Contract;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.pay.bean.PayLog;
import com.qinfenqi.mall.system.bean.User;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 下午1:27:12
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface BillService {

	/**
	 * @param memberQuery 
	 * @param currentUser
	 * @param contract
	 */
	void createBills(User user, Contract contract);

	/**
	 * @param billQuery
	 * @return
	 */
	BillQuery getBillById(BillQuery billQuery);

	/**
	 * @param billQuery
	 * @return
	 */
	List<BillQuery> getBillList(BillQuery billQuery);

	/**
	 * @param billQuery
	 * @return
	 */
	int getBillCount(BillQuery billQuery);

	/**
	 * @param billQuery
	 * @param user
	 * @return
	 */
	boolean auditResult(BillQuery billQuery, User user);

	/**
	 * @param billQuery
	 * @return
	 */
	List<PayLog> getPayList(BillQuery billQuery);

	/**
	 * @param billQuery
	 * @return
	 */
	List<BillQuery> getBillListByOrderId(BillQuery billQuery);

	/**
	 * @param orderQuery
	 * @return
	 */
	boolean createBills(OrderQuery orderQuery);

}
