/**
 * 
 */
package com.qinfenqi.mall.contract.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.joda.time.DateTime;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.collar.dao.CollarDao;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.common.constant.OrderStatus;
import com.qinfenqi.mall.contract.bean.Contract;
import com.qinfenqi.mall.contract.dao.ContractDao;
import com.qinfenqi.mall.contract.query.ContractQuery;
import com.qinfenqi.mall.contract.service.ContractService;
import com.qinfenqi.mall.member.dao.MemberDao;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.order.dao.OrderDao;
import com.qinfenqi.mall.order.query.OrderQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 上午8:35:11
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("contractService")
public class ContractServiceImpl implements ContractService {

	@Resource
	private ContractDao contractDao;
	@Resource
	private MemberDao memberDao;
	@Resource
	private CollarDao collarDao;
	@Resource
	private OrderDao orderDao;
	
	/**
	 * @return
	 */
	public List<Contract> getContractList(ContractQuery contractQuery) {
		return contractDao.getContractList(contractQuery);
	}
	
	@Override
	public synchronized Contract getContractCode() {
		Contract contract = new Contract();
		contract.setCode("QC-" + contractDao.getContractCode());
		return contract;
	}

	@Override
	public boolean createContract(Contract contract, MemberQuery memberQuery) {
		contract.setDeadLine(new DateTime().plusMonths(contract.getMonths()).toDate());
		contract.setCreateTime(new Date());
		boolean result = contractDao.createContract(contract);
		memberQuery = memberDao.getMemberById(memberQuery);
		if(result){
			memberQuery.setCreditLimit(memberQuery.getCreditLimit() - (contract.getProductPrice() - contract.getFirstPay()));
			memberQuery.setUsedCreditLimit(memberQuery.getUsedCreditLimit() + (contract.getProductPrice() - contract.getFirstPay()));
			result = memberDao.updateCreditLimit(memberQuery);
			OrderQuery order = new OrderQuery();
			order.setOrderId(contract.getOrderId());
			order.setOrderStatus(OrderStatus.AUDIT_READY.getId());
			result = orderDao.updateOrderStatus(order);
		}
		return result;
	}
	
	@Override
	public boolean createContract(Contract contract, CollarQuery collarQuery) {
		contract.setDeadLine(new DateTime().plusMonths(contract.getMonths()).toDate());
		contract.setCreateTime(new Date());
		boolean result = contractDao.createContract(contract);
		collarQuery = collarDao.getCollarById(collarQuery);
		if(result){
			collarQuery.setCreditLimit(collarQuery.getCreditLimit() - (contract.getProductPrice() - contract.getFirstPay()));
			collarQuery.setUsedCreditLimit(collarQuery.getUsedCreditLimit() + (contract.getProductPrice() - contract.getFirstPay()));
			result = collarDao.updateCreditLimit(collarQuery);
			OrderQuery order = new OrderQuery();
			order.setOrderId(contract.getOrderId());
			order.setOrderStatus(OrderStatus.AUDIT_READY.getId());
			result = orderDao.updateOrderStatus(order);
		}
		return result;
	}
	

	@Override
	public ContractQuery getContractById(Contract contract) {
		return contractDao.getContractById(contract);
	}

	@Override
	public int getContractCount(ContractQuery contractQuery) {
		return contractDao.getContractCount(contractQuery);
	}

	@Override
	public void updateVerifyStatus(ContractQuery contractQuery) {
		contractDao.updateVerifyStatus(contractQuery);
	}

}
