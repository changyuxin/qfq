/**
 * 
 */
package com.qinfenqi.mall.manage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.bean.DefaultRate;
import com.qinfenqi.mall.manage.bean.ProductRecom;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月9日 上午10:32:58
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface ManageDao {

	/**
	 * @param authCode
	 * @return
	 */
	boolean createAuthCode(AuthCode authCode);

	/**
	 * @param authCode
	 * @return
	 */
	AuthCode queryAuthCodeByMobile(AuthCode authCode);

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
	List<DefaultRate> queryDefRates();

	/**
	 * 
	 */
	boolean removeDefRates();

	/**
	 * @param list
	 */
	boolean createDefRates(List<DefaultRate> list);

	/**
	 * @param authCode
	 * @return
	 */
	boolean removeCode(AuthCode authCode);

	/**
	 * @param productRecom
	 * @return
	 */
	boolean saveRecom(ProductRecom productRecom);

	/**
	 * @return
	 */
	List<ProductRecom> getProductRecoms();

}
