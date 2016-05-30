/**
 * 
 */
package com.qinfenqi.mall.contract.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.contract.bean.Contract;
import com.qinfenqi.mall.contract.query.ContractQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 上午8:37:28
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface ContractDao {

	/**
	 * @return
	 */
	List<Contract> getContractList(ContractQuery contractQuery);
	
	/**
	 * @param contract
	 * @return
	 */
	boolean createContract(Contract contract);


	/**
	 * @param contract
	 * @return
	 */
	ContractQuery getContractById(Contract contract);


	/**
	 * @param contractQuery
	 * @return
	 */
	boolean updateContract(ContractQuery contractQuery);


	/**
	 * @return
	 */
	String getContractCode();

	/**
	 * @param contract
	 * @return
	 */
	ContractQuery getContractByOrderId(Contract contract);
	
	/**
	 * @param contract
	 * @return
	 */
	int getContractCount(ContractQuery contractQuery);

	/**
	 * @param contractQuery
	 */
	void updateVerifyStatus(ContractQuery contractQuery);

}
