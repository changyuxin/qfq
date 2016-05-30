/**
 * 
 */
package com.qinfenqi.mall.collar.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.collar.bean.Collar;
import com.qinfenqi.mall.collar.query.CollarQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月16日 下午12:16:40
 * @author Chang Yuxin
 * @version 1.0 
 */
@Repository
public interface CollarDao {

	/**
	 * @param collar
	 * @return
	 */
	boolean updateCollarInfo(Collar collar);

	/**
	 * @param collar
	 * @return
	 */
	boolean createCollar(Collar collar);

	/**
	 * @param userId
	 * @return
	 */
	CollarQuery getCollarByUserId(long userId);
	
	/**
	 * @param user
	 * @return
	 */
	CollarQuery getCollarById(CollarQuery collarQuery);

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
	 * @return
	 */
	boolean updateAudit(CollarQuery collarQuery);

	/**
	 * @param auth
	 */
	boolean updateAuthCode(AuthCode auth);

	/**
	 * @param collarQuery
	 * @return
	 */
	boolean updateCreditLimit(CollarQuery collarQuery);

	/**
	 * @return
	 */
	List<Count> getCollarCounts();

	/**
	 * @param collar
	 * @return
	 */
	boolean updateBaseInfo(Collar collar);

	/**
	 * @param collar
	 * @return
	 */
	boolean updateCompanyInfo(Collar collar);

	/**
	 * @param collar
	 * @return
	 */
	boolean updateMailInfo(Collar collar);

	/**
	 * @param collar
	 * @return
	 */
	boolean updateHomeInfo(Collar collar);

	/**
	 * @param collar
	 * @return
	 */
	boolean updateIncomeInfo(Collar collar);

	/**
	 * @param collar
	 * @return
	 */
	boolean updateBankcardInfo(Collar collar);

	/**
	 * @param collar
	 * @return
	 */
	boolean updateUploadInfo(Collar collar);

	/**
	 * @param collarQuery
	 * @return 
	 */
	boolean updateCollarSpy(CollarQuery collarQuery);

	/**
	 * @param userId
	 * @return
	 */
	boolean deleteCollar(long userId);
}
