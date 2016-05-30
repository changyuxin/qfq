/**
 * 
 */
package com.qinfenqi.mall.manage.service;

import java.util.List;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.bean.DefaultRate;
import com.qinfenqi.mall.manage.bean.ProductRecom;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月9日 上午10:20:41
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface ManageService {

	/**
	 * @param authCode
	 * @return
	 */
	String createAuthCode(AuthCode authCode);

	/**
	 * @param authCode
	 * @return
	 */
	boolean checkMobile(AuthCode authCode);

	/**
	 * @param authCode
	 * @return
	 */
	List<AuthCode> getAuthCodeList(AuthCode authCode);

	/**
	 * @param authCode
	 * @return
	 */
	int getAuthCodeCount(AuthCode authCode);

	/**
	 * @return
	 */
	List<DefaultRate> getDefRates();

	/**
	 * @param periodNumStarts
	 * @param periodNumEnds
	 * @param serviceRates
	 * @return
	 */
	boolean saveDefRate(String[] periodNumStarts, String[] periodNumEnds, String[] serviceRates);

	/**
	 * @param authCode
	 * @return
	 */
	boolean deleteCode(AuthCode authCode);

	/**
	 * @param productRecom
	 * @return
	 */
	boolean saveRecom(ProductRecom productRecom);

	/**
	 * @return
	 */
	String getProdRecom();

}
