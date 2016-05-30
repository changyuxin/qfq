/**
 * 
 */
package com.qinfenqi.mall.bill.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.joda.time.DateTime;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.Log;
import com.qinfenqi.mall.bean.MallSetting;
import com.qinfenqi.mall.bill.bean.Bill;
import com.qinfenqi.mall.bill.dao.BillDao;
import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.bill.service.BillService;
import com.qinfenqi.mall.common.constant.BizType;
import com.qinfenqi.mall.common.dao.CommonDao;
import com.qinfenqi.mall.contract.bean.Contract;
import com.qinfenqi.mall.log.dao.LogDao;
import com.qinfenqi.mall.order.dao.OrderDao;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.pay.bean.PayLog;
import com.qinfenqi.mall.pay.dao.PayDao;
import com.qinfenqi.mall.system.bean.User;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 下午1:28:04
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("billService")
public class BillServiceImpl implements BillService {

	@Resource
	private BillDao billDao;
	@Resource
	private OrderDao orderDao;
	@Resource
	private LogDao logDao;
	@Resource
	private PayDao payDao;
	@Resource
	private CommonDao commonDao;

	@Override
	public void createBills(User user, Contract contract) {
		Date startDate = contract.getCreateTime();
		int months = contract.getMonths();
		List<Bill> list = new ArrayList<Bill>();
		for (int i = 1; i <= months; i++) {
			Bill bill = new Bill();
			bill.setUserId(user.getUserId());
			bill.setOrderId(contract.getOrderId());
			bill.setCurrentMonth(i);
			bill.setMonths(contract.getMonths());
			double money = contract.getProductPrice() - contract.getFirstPay();
			bill.setPrincipal(money / contract.getMonths());
			bill.setServicePay(money * contract.getServiceRate());

			// 计算白领财务费
			bill.setFinancialPay(money * contract.getFinancialRate());

			bill.setMonthPay(contract.getMonthPay());
			bill.setPaymentDate(new DateTime(startDate).plusMonths(i).toDate());
			bill.setPaymentStatus(1);
			list.add(bill);
		}
		billDao.createBills(list);
	}
	
	@Override
	public boolean createBills(OrderQuery orderQuery) {
		orderQuery = orderDao.getOrderById(orderQuery);
		int months = orderQuery.getMonths();
		List<Bill> list = new ArrayList<Bill>();
		for (int i = 1; i <= months; i++) {
			Bill bill = new Bill();
			bill.setUserId(orderQuery.getUserId());
			bill.setOrderId(orderQuery.getOrderId());
			bill.setCurrentMonth(i);
			bill.setMonths(orderQuery.getMonths());
			double money = orderQuery.getProductPrice() - orderQuery.getFirstPay();
			bill.setPrincipal(money / orderQuery.getMonths());
			bill.setServicePay(money * orderQuery.getServiceRate());

			// 计算白领财务费
			bill.setFinancialPay(money * orderQuery.getFinancialRate());

			bill.setMonthPay(orderQuery.getMonthPay());
			bill.setPaymentDate(DateTime.now().plusMonths(i).toDate());
			bill.setPaymentStatus(1);
			list.add(bill);
		}
		return billDao.createBills(list);
	}
	
	
	@Override
	public BillQuery getBillById(BillQuery billQuery) {
		int theLast = billQuery.getTheLast();
		billQuery = billDao.getBillById(billQuery);
		if (theLast == 1) {
			MallSetting setting = commonDao.getMallSetting("EARLY_PAY_RATE");
			double rate = 1.0;
			if (null != setting) {
				rate = Float.parseFloat(setting.getParamValue());
			}
			if(billQuery.getFinancialPay() > 0){
				billQuery.setMonthPay(billQuery.getPrincipal() + billQuery.getServicePay() * rate + billQuery.getFinancialPay() * rate);
			} else {
				billQuery.setMonthPay(billQuery.getPrincipal() + billQuery.getServicePay() * rate);
			}
		}
		billQuery.setTheLast(theLast);
		return billQuery;
	}

	@Override
	public List<BillQuery> getBillList(BillQuery billQuery) {
		return billDao.getBillList(billQuery);
	}

	@Override
	public int getBillCount(BillQuery billQuery) {
		return billDao.getBillCount(billQuery);
	}

	@Override
	/**
	 * 保存会员的操作记录
	 */
	public boolean auditResult(BillQuery billQuery, User user) {
		boolean result = billDao.updateAuditOpinion(billQuery);
		if (result) {
			Log log = new Log();
			log.setBizType(BizType.BILL.getId());
			log.setBizId(billQuery.getBillId());
			log.setUserId(user.getUserId());
			log.setUserName(user.getUserName());
			log.setCreateTime(new Date());
			log.setDescription(billQuery.getAuditOpinion());
			result = logDao.createLog(log);
		}
		return result;
	}

	@Override
	public List<PayLog> getPayList(BillQuery billQuery) {
		PayLog payLog = new PayLog();
		payLog.setTradeType(billQuery.getTradeType());
		payLog.setTradeNo(billQuery.getBillId());
		return payDao.getPayList(payLog);
	}

	@Override
	public List<BillQuery> getBillListByOrderId(BillQuery billQuery) {
		return billDao.getBillListByOrderId(billQuery);
	}

}
