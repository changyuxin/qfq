/**
 * 
 */
package com.qinfenqi.mall.embassy.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.common.base.BaseService;
import com.qinfenqi.mall.embassy.dao.EmbassyDao;
import com.qinfenqi.mall.embassy.query.EmbassyQuery;
import com.qinfenqi.mall.embassy.service.EmbassyService;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月17日 下午3:18:39
 * @author Chang Yuxin
 * @version 1.0 
 */
@Service("embassyService")
public class EmbassyServiceImpl extends BaseService implements EmbassyService {
	@Resource
	private EmbassyDao embassyDao;

	@Override
	public List<EmbassyQuery> getEmbassyList(EmbassyQuery embassyQuery) {
		return embassyDao.getEmbassyList(embassyQuery);
	}
	
	@Override
	public int getEmbassyCount(EmbassyQuery embassyQuery) {
		return embassyDao.getEmbassyCount(embassyQuery);
	}
	
	@Override
	public boolean addEmbassy(EmbassyQuery embassyQuery) {
		embassyQuery.setCreateTime(new Date());
		return embassyDao.createEmbassy(embassyQuery);
	}
	@Override
	public boolean editEmbassy(EmbassyQuery embassyQuery) {
		return embassyDao.modifyEmbassy(embassyQuery);
	}
	
	@Override
	public boolean destroyEmbassy(EmbassyQuery embassyQuery) {
		embassyQuery.setStatus(3);
		return embassyDao.modifyEmbassy(embassyQuery);
	}

	@Override
	public EmbassyQuery getEmbassyById(long embassyId) {
		return embassyDao.getEmbassyById(embassyId);
	}

	@Override
	public List<EmbassyQuery> getEmbassyListBySchool(EmbassyQuery embassyQuery) {
		return embassyDao.getEmbassyListBySchool(embassyQuery);
	}

	/* (non-Javadoc)
	 * @see com.qinfenqi.mall.embassy.service.EmbassyService#getEmbassyCounts()
	 */
	@Override
	public String getEmbassyCounts() {
		List<Count> list = embassyDao.getEmbassyCounts();
		String[] status = { "1", "2", "3"};
		return convertCountResult(status, list);
	}
}
