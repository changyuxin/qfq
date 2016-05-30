/**
 * 
 */
package com.qinfenqi.mall.embassy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.embassy.query.EmbassyQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月17日 下午3:19:31
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface EmbassyDao {

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
	boolean createEmbassy(EmbassyQuery embassyQuery);

	/**
	 * @param embassyQuery
	 * @return
	 */
	boolean modifyEmbassy(EmbassyQuery embassyQuery);

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
	List<Count> getEmbassyCounts();

}
