/**
 * 
 */
package com.qinfenqi.mall.manage.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.bean.DefaultRate;
import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.manage.bean.ProductRecom;
import com.qinfenqi.mall.manage.dao.ManageDao;
import com.qinfenqi.mall.manage.service.ManageService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月9日 上午10:21:36
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("manageService")
public class ManageServiceImpl implements ManageService {

	@Resource
	private ManageDao manageDao;

	@Override
	public String createAuthCode(AuthCode authCode) {
		UUID uuid = UUID.randomUUID();
		// uuid.replace("-", "");
		String code = uuid.toString().substring(0, 8);
		authCode.setCode(code);
		authCode.setCreateTime(new Date());
		// 保存授权码
		manageDao.createAuthCode(authCode);
		return code;
	}

	@Override
	public boolean checkMobile(AuthCode authCode) {
		authCode = manageDao.queryAuthCodeByMobile(authCode);
		return null != authCode ? false : true;
	}

	@Override
	public List<AuthCode> getAuthCodeList(AuthCode authCode) {
		return manageDao.getAuthCodeList(authCode);
	}

	@Override
	public int getAuthCodeCount(AuthCode authCode) {
		return manageDao.getAuthCodeCount(authCode);
	}

	@Override
	public List<DefaultRate> getDefRates() {
		return manageDao.queryDefRates();
	}

	@Override
	public boolean saveDefRate(String[] periodNumStarts, String[] periodNumEnds, String[] serviceRates) {
		boolean result = false;
		if (periodNumStarts.length == periodNumEnds.length) {
			List<DefaultRate> list = new ArrayList<DefaultRate>();
			manageDao.removeDefRates();
			if (periodNumStarts.length > 0 && periodNumEnds.length > 0) {
				for (int i = 0; i < periodNumStarts.length; i++) {
					DefaultRate dr = new DefaultRate();
					dr.setPeriodNumStart(Integer.parseInt(periodNumStarts[i]));
					dr.setPeriodNumEnd(Integer.parseInt(periodNumEnds[i]));
					dr.setServiceRate(Float.parseFloat(serviceRates[i]));
					list.add(dr);
				}
				result = manageDao.createDefRates(list);
			}
		}
		return result;
	}

	@Override
	public boolean deleteCode(AuthCode authCode) {
		return manageDao.removeCode(authCode);
	}

	@Override
	public boolean saveRecom(ProductRecom productRecom) {
		productRecom.setCreateTime(new Date());
		return manageDao.saveRecom(productRecom);
	}

	@Override
	public String getProdRecom() {
		List<ProductRecom> list = manageDao.getProductRecoms();
		StringBuffer buffer = new StringBuffer();
		for (ProductRecom productRecom : list) {
			buffer.append(productRecom.getPositionId());
			buffer.append(Symbol.MINUS);
			buffer.append(productRecom.getProductId());
			buffer.append(Symbol.NUMBERSIGN);
		}
		return buffer.toString().substring(0, buffer.length() - 1);
	}

}
