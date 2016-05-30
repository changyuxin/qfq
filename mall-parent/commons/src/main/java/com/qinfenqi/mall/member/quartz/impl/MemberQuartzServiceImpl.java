/**
 * 
 */
package com.qinfenqi.mall.member.quartz.impl;

import java.text.ParseException;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.member.bean.MemberCredit;
import com.qinfenqi.mall.member.dao.MemberDao;
import com.qinfenqi.mall.member.quartz.MemberQuartzService;


/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月11日 下午3:23:55
 * @author
 * @version 1.0
 */
@Service("memberQuartzService")
public class MemberQuartzServiceImpl implements MemberQuartzService {
	private static final Logger logger = Logger.getLogger(MemberQuartzServiceImpl.class);
	/*
	 * 更新会员信用额度
	 */
	@Resource
	private MemberDao memberDao;
	
	public void updateMemberCredit() throws ParseException {
		logger.info("更新会员信用额度 Start!");
		// 获得有分期付款的用户信息
		List<MemberCredit> listMember = memberDao.getCreditListMember();
		
		for(MemberCredit memberCredit : listMember)
		{
		    double totalCredit;
		    totalCredit = memberCredit.getCreditLimit()+memberCredit.getUsedCreditLimit();
		    memberCredit.setUsedCreditLimit(memberCredit.getSumMonthPay());
		    memberCredit.setCreditLimit(totalCredit - memberCredit.getUsedCreditLimit());
		    memberDao.updateMemberCredit(memberCredit);
		}
		List<MemberCredit> listCollar = memberDao.getCreditListCollar();
		
		for(MemberCredit memberCredit : listCollar)
		{
		    double totalCredit;
		    totalCredit = memberCredit.getCreditLimit()+memberCredit.getUsedCreditLimit();
		    memberCredit.setUsedCreditLimit(memberCredit.getSumMonthPay());
		    memberCredit.setCreditLimit(totalCredit - memberCredit.getUsedCreditLimit());
		    memberDao.updateCollarCredit(memberCredit);
		}

		logger.info("更新会员信用额度 End!");
	}	

}
