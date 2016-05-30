/**
 * 
 */
package com.qinfenqi.mall.contract.service;

import java.util.List;

import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.contract.bean.Contract;
import com.qinfenqi.mall.contract.query.ContractQuery;
import com.qinfenqi.mall.member.query.MemberQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 上午8:35:11
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface ContractService {

	/**
	 * @return
	 */
	List<Contract> getContractList(ContractQuery contractQuery);
	
	
	/**
	 * @return
	 */
	Contract getContractCode();

	/**
	 * @param contract
	 * @param memberQuery 
	 * @return
	 */
	boolean createContract(Contract contract, MemberQuery memberQuery);


	/**
	 * @param contract
	 * @return
	 */
	ContractQuery getContractById(Contract contract);


	/**
	 * @param contractQuery
	 * @return
	 */
	int getContractCount(ContractQuery contractQuery);


	/**
	 * @param contractQuery
	 */
	void updateVerifyStatus(ContractQuery contractQuery);


	/**
	 * @param contract
	 * @param collarQuery
	 * @return
	 */
	boolean createContract(Contract contract, CollarQuery collarQuery);
}
