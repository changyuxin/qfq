/**
 * 
 */
package com.qinfenqi.mall.admin.contract;

import java.util.List;

import javax.annotation.Resource;

import org.joda.time.DateTime;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.contract.bean.Contract;
import com.qinfenqi.mall.contract.query.ContractQuery;
import com.qinfenqi.mall.contract.service.ContractService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 上午8:28:59
 * @author Chang Yuxin
 * @version 1.0
 */
public class ContractAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -6700788978331838239L;

	@Resource
	private ContractService contractService;

	private List<Contract> contractList;

	private ContractQuery contractQuery = new ContractQuery();
	
	private int year;
	private int month;
	private int day;
	private int day1;

	/**
	 * 进入合同管理
	 * 
	 * @return
	 */
	public String index() {
		return "index";
	}

	/**
	 * 合同列表
	 * 
	 * @return
	 */
	public String getContractsPage() {
		
		contractQuery.setPageSize(20);
		contractQuery.setOrderField("create_time");
		contractList = contractService.getContractList(contractQuery);
		double total = contractService.getContractCount(contractQuery);
		double pageSize = contractQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		contractQuery.setPageTotal(pageTotal);
		contractQuery.setTotal((int) total);
		return "manage";
	}

	/**
	 * 查看合同
	 * 
	 * @return
	 */
	public String showContractDetail() {
		contractQuery = contractService.getContractById(contractQuery);
		DateTime dt = new DateTime(contractQuery.getCreateTime());
		year = dt.getYear();
		month = dt.getMonthOfYear();
		day = dt.getDayOfMonth();
		dt = dt.plusMonths(1);
		day1 = dt.getDayOfMonth();
		return "detail";
	}

	public void verifyContract() {
		int rtn = 0;
		try {
			contractService.updateVerifyStatus(contractQuery);
		} catch (Exception e) {
			e.printStackTrace();
			rtn = -1;
		}
		ajaxResponse(rtn + "");

	}
	
	/**
	 * @return the contractList
	 */
	public List<Contract> getContractList() {
		return contractList;
	}

	/**
	 * @param contractList
	 *            the contractList to set
	 */
	public void setContractList(List<Contract> contractList) {
		this.contractList = contractList;
	}


	/**
	 * @return the contractQuery
	 */
	public ContractQuery getContractQuery() {
		return contractQuery;
	}

	/**
	 * @param contractQuery the contractQuery to set
	 */
	public void setContractQuery(ContractQuery contractQuery) {
		this.contractQuery = contractQuery;
	}

	/**
	 * @return the year
	 */
	public int getYear() {
		return year;
	}

	/**
	 * @param year the year to set
	 */
	public void setYear(int year) {
		this.year = year;
	}

	/**
	 * @return the month
	 */
	public int getMonth() {
		return month;
	}

	/**
	 * @param month the month to set
	 */
	public void setMonth(int month) {
		this.month = month;
	}

	/**
	 * @return the day
	 */
	public int getDay() {
		return day;
	}

	/**
	 * @param day the day to set
	 */
	public void setDay(int day) {
		this.day = day;
	}

	/**
	 * @return the day1
	 */
	public int getDay1() {
		return day1;
	}

	/**
	 * @param day1 the day1 to set
	 */
	public void setDay1(int day1) {
		this.day1 = day1;
	}
}
