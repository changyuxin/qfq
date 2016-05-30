/**
 * 
 */
package com.qinfenqi.mall.bill.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bill.bean.Bill;
import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.order.query.OrderQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 下午1:28:45
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface BillDao {

	/**
	 * @param list
	 * @return 
	 */
	boolean createBills(List<Bill> list);

	/**
	 * @param order
	 * @return
	 */
	List<BillQuery> getBills(OrderQuery order);

	/**
	 * @param billQuery
	 * @return
	 */
	BillQuery getBillById(BillQuery billQuery);

	/**
	 * @param billQuery
	 */
	boolean updateBillStatus(BillQuery billQuery);

	/**
	 * @param orderQuery
	 * @return
	 */
	boolean deleteBills(OrderQuery orderQuery);

	/**
	 * @param billQuery
	 * @return
	 */
	List<BillQuery> getOverdueBills(BillQuery billQuery);

	/**
	 * @param billQuery
	 */
	void updateBillLatefines(BillQuery billQuery);

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
	 * @return
	 */
	boolean updateAuditOpinion(BillQuery billQuery);

	/**
	 * @param billQuery
	 * @return
	 */
	List<BillQuery> getBillListByOrderId(BillQuery billQuery);
	

}
