/**
 * 
 */
package com.qinfenqi.mall.embassy.service;

import java.util.List;

import com.qinfenqi.mall.embassy.query.EmbassyQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月17日 下午3:18:15
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface EmbassyService {

	/**
	 * @param embassyQuery
	 * @return
	 */
	List<EmbassyQuery> getEmbassyList(EmbassyQuery embassyQuery);

	/**
	 * @param embassyQuery
	 * @return
	 */
	int getEmbassyCount(EmbassyQuery embassyQuery);

	/**
	 * @param embassyQuery
	 * @return
	 */
	boolean addEmbassy(EmbassyQuery embassyQuery);

	/**
	 * @param embassyQuery
	 * @return
	 */
	boolean editEmbassy(EmbassyQuery embassyQuery);

	/**
	 * @param embassyQuery
	 * @return
	 */
	boolean destroyEmbassy(EmbassyQuery embassyQuery);

	/**
	 * @param embassyId
	 * @return
	 */
	EmbassyQuery getEmbassyById(long embassyId);

	/**
	 * @param memberQuery
	 * @return
	 */
	List<EmbassyQuery> getEmbassyListBySchool(EmbassyQuery embassyQuery);

	/**
	 * @return
	 */
	String getEmbassyCounts();

}
