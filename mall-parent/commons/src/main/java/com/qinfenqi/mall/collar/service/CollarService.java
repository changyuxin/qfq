/**
 * 
 */
package com.qinfenqi.mall.collar.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.qinfenqi.mall.collar.bean.Collar;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.query.UserQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月15日 上午11:00:38
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface CollarService {

	/**
	 * @param collar
	 * @return
	 */
	boolean collarInfoImprove(Collar collar);

	/**
	 * @param userQuery
	 * @return
	 */
	boolean createCollar(UserQuery userQuery);

	/**
	 * @param userId
	 * @return
	 */
	CollarQuery getCollarByUserId(long userId);

	/**
	 * @param collarQuery
	 * @return
	 */
	List<CollarQuery> getCollarList(CollarQuery collarQuery);

	/**
	 * @param collarQuery
	 * @return
	 */
	int getCollarCount(CollarQuery collarQuery);

	/**
	 * @param collarQuery
	 * @param user
	 * @return
	 */
	boolean auditPass(CollarQuery collarQuery, User user);

	/**
	 * @param collarQuery
	 * @param currentUser
	 * @return
	 */
	boolean auditNoPass(CollarQuery collarQuery, User user);

	/**
	 * @param collarQuery
	 * @return
	 */
	CollarQuery getCollarById(CollarQuery collarQuery);

	/**
	 * @return
	 */
	String getCollarCounts();
	
	/**
	 * @param collarQuery
	 */
	boolean baseInfoImprove(Collar collar);

	/**
	 * @param collarQuery
	 */
	boolean companyInfoImprove(Collar collar);

	/**
	 * @param collarQuery
	 */
	boolean mailInfoImprove(Collar collar);

	/**
	 * @param collarQuery
	 */
	boolean homeInfoImprove(Collar collar);

	/**
	 * @param collarQuery
	 */
	boolean incomeInfoImprove(Collar collar);

	/**
	 * @param collarQuery
	 */
	boolean bankcardInfoImprove(Collar collar);

	/**
	 * @param collarQuery
	 */
	boolean uploadInfoImprove(Collar collar);

	/**
	 * @param collarQuery
	 * @param user
	 */
	boolean updateCollarSpy(CollarQuery collarQuery, User user);

	/**
	 * @param collarQuery
	 * @param user
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	boolean deleteSpy(CollarQuery collarQuery, User user) throws NoSuchAlgorithmException;
}
