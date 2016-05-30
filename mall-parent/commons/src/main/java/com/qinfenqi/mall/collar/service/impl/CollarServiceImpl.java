/**
 * 
 */
package com.qinfenqi.mall.collar.service.impl;

import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.bean.Log;
import com.qinfenqi.mall.collar.bean.Collar;
import com.qinfenqi.mall.collar.dao.CollarDao;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.collar.service.CollarService;
import com.qinfenqi.mall.common.base.BaseService;
import com.qinfenqi.mall.common.constant.BizType;
import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.log.dao.LogDao;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.dao.UserDao;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.util.MD5Util;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月15日 上午11:04:22
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("collarService")
public class CollarServiceImpl extends BaseService implements CollarService {
	@Resource
	private CollarDao collarDao;
	@Resource
	private UserDao userDao;
	@Resource
	private LogDao logDao;

	public boolean collarInfoImprove(Collar collar) {
		CollarQuery c = collarDao.getCollarByUserId(collar.getUserId());
		if (c.getAuditCount() > 0) {
			collar.setAuditStatus(2);
		} else {
			collar.setAuditStatus(1);
		}
		return collarDao.updateCollarInfo(collar);
	}

	@Override
	public boolean createCollar(UserQuery user) {
		user.setUserStyle(2);
		userDao.createUser(user);
		Collar collar = new Collar();
		collar.setUserId(user.getUserId());
		collar.setCreateTime(new Date());
		collar.setPhone(user.getUserName());
		boolean flag = collarDao.createCollar(collar);
		// 如果注册成功，将授权码置为已用状态，将记录使用时间
		if(flag){
			AuthCode auth = new AuthCode();
			auth.setMobile(user.getUserName());
			auth.setUsedTime(new Date());
			collarDao.updateAuthCode(auth);
		}
		user.setCollarId(collar.getCollarId());
		return flag;
	}

	@Override
	public CollarQuery getCollarByUserId(long userId) {
		return collarDao.getCollarByUserId(userId);
	}

	@Override
	public List<CollarQuery> getCollarList(CollarQuery collarQuery) {
		List<CollarQuery> list = collarDao.getCollarList(collarQuery);
		String[] spyUrls = null;
		String spyUrl = null;
		for (CollarQuery colllar : list) {
			String otherDetail = colllar.getUploadOtherDetail();
			if (StringUtils.isNotBlank(otherDetail)) {
				String[] arr = otherDetail.split(Symbol.COMMA);
				colllar.setOthersDetail(Arrays.asList(arr));
			}
			spyUrl = colllar.getSupplyPhoto();
			if (null != spyUrl && !"".equals(spyUrl)) {
				spyUrls = spyUrl.split(Symbol.COMMA);
				colllar.setSpyPhotos(Arrays.asList(spyUrls));
			}
		}
		return list;
	}

	@Override
	public int getCollarCount(CollarQuery collarQuery) {
		return collarDao.getCollarCount(collarQuery);
	}

	@Override
	public boolean auditPass(CollarQuery collarQuery, User user) {
		CollarQuery cq = collarDao.getCollarById(collarQuery);
		// 审核次数加1
		collarQuery.setAuditCount(cq.getAuditCount() + 1);
		// 审核状态通过
		collarQuery.setAuditStatus(3);
		// 信用额度
		collarQuery.setCreditLimit(6000);
		boolean result = collarDao.updateAudit(collarQuery);
		if (result) {
			result = saveCollarOpLog(collarQuery, user, "审核通过!");
		}
		return result;
	}

	@Override
	public boolean auditNoPass(CollarQuery collarQuery, User user) {
		CollarQuery c = collarDao.getCollarById(collarQuery);
		// 审核次数加1
		collarQuery.setAuditCount(c.getAuditCount() + 1);
		// 审核状态不通过
		collarQuery.setAuditStatus(4);
		// 信用额度
		collarQuery.setCreditLimit(0);
		boolean result = collarDao.updateAudit(collarQuery);
		if (result) {
			result = saveCollarOpLog(collarQuery, user, "审核不通过!,原因：" + collarQuery.getAuditOpinion());
		}
		return result;
	}
	
	/**
	 * @param collarQuery
	 * @param user
	 * @param string
	 * @return
	 */
	private boolean saveCollarOpLog(CollarQuery collarQuery, User user, String logDesc) {
		Log log = new Log();
		log.setBizType(BizType.COLLAR.getId());
		log.setBizId(collarQuery.getCollarId());
		log.setUserId(user.getUserId());
		log.setUserName(user.getUserName());
		log.setCreateTime(new Date());
		log.setDescription(logDesc);
		return logDao.createLog(log);
	}

	@Override
	public CollarQuery getCollarById(CollarQuery collarQuery) {
		return collarDao.getCollarById(collarQuery);
	}

	@Override
	public String getCollarCounts() {
		List<Count> list = collarDao.getCollarCounts();
		String[] status = { "1", "2", "3", "4", "5", "6", "7" };
		return convertCountResult(status, list);
	}

	@Override
	public boolean baseInfoImprove(Collar collar) {
		CollarQuery c = collarDao.getCollarByUserId(collar.getUserId());
		if (c.getAuditCount() > 0) {
			collar.setAuditStatus(3);
		} else {
			collar.setAuditStatus(1);
		}
		return collarDao.updateBaseInfo(collar);
	}
	@Override
	public boolean companyInfoImprove(Collar collar) {
		CollarQuery c = collarDao.getCollarByUserId(collar.getUserId());
		if (c.getAuditCount() > 0) {
			collar.setAuditStatus(3);
		} else {
			collar.setAuditStatus(1);
		}
		return collarDao.updateCompanyInfo(collar);
	}

	@Override
	public boolean mailInfoImprove(Collar collar) {
		CollarQuery c = collarDao.getCollarByUserId(collar.getUserId());
		if (c.getAuditCount() > 0) {
			collar.setAuditStatus(3);
		} else {
			collar.setAuditStatus(1);
		}
		return collarDao.updateMailInfo(collar);
	}

	@Override
	public boolean homeInfoImprove(Collar collar) {
		CollarQuery c = collarDao.getCollarByUserId(collar.getUserId());
		if (c.getAuditCount() > 0) {
			collar.setAuditStatus(3);
		} else {
			collar.setAuditStatus(1);
		}
		return collarDao.updateHomeInfo(collar);
	}

	@Override
	public boolean incomeInfoImprove(Collar collar) {
		CollarQuery c = collarDao.getCollarByUserId(collar.getUserId());
		if (c.getAuditCount() > 0) {
			collar.setAuditStatus(3);
		} else {
			collar.setAuditStatus(1);
		}
		return collarDao.updateIncomeInfo(collar);
	}

	@Override
	public boolean bankcardInfoImprove(Collar collar) {
		CollarQuery c = collarDao.getCollarByUserId(collar.getUserId());
		if (c.getAuditCount() > 0) {
			collar.setAuditStatus(3);
		} else {
			collar.setAuditStatus(1);
		}
		return collarDao.updateBankcardInfo(collar);
	}

	@Override
	public boolean uploadInfoImprove(Collar collar) {
		CollarQuery c = collarDao.getCollarByUserId(collar.getUserId());
		if (c.getAuditCount() > 0) {
			collar.setAuditStatus(3);
		} else {
			collar.setAuditStatus(1);
		}
		return collarDao.updateUploadInfo(collar);
	}

	@Override
	public boolean updateCollarSpy(CollarQuery collarQuery, User user) {
		CollarQuery cq = collarDao.getCollarById(collarQuery);
		String spyPhoto = cq.getSupplyPhoto();
		if ("".equals(spyPhoto) || null == spyPhoto) {
			collarQuery.setSupplyPhoto(collarQuery.getSupplyPhoto());
		} else {
			collarQuery.setSupplyPhoto(spyPhoto + "," + collarQuery.getSupplyPhoto());
		}
		collarDao.updateCollarSpy(collarQuery);
		return saveCollarOpLog(collarQuery, user, "提交补充资料");
	}
	
	@Override
	public boolean deleteSpy(CollarQuery collarQuery, User user) throws NoSuchAlgorithmException {
		CollarQuery collar = collarDao.getCollarById(collarQuery);
		String[] spyUrls = null;
		String spyUrl = null;
		spyUrl = collar.getSupplyPhoto();
		if (null != spyUrl && !"".equals(spyUrl)) {
			spyUrls = spyUrl.split(",");
		}
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < spyUrls.length; i++) {
			if (MD5Util.encodeString(spyUrls[i]).equals(collarQuery.getUrl())) {
				continue;
			} else {
				buffer.append(spyUrls[i]).append(",");
			}
		}
		collar.setSupplyPhoto(StringUtil.removeLastComma(buffer.toString()));
		saveCollarOpLog(collarQuery, user, "删除补充资料");
		return collarDao.updateCollarSpy(collar);
	}
}
