/**
 * 
 */
package com.qinfenqi.mall.bill.quartz.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bill.dao.BillDao;
import com.qinfenqi.mall.bill.quartz.BillQuartzService;
import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.common.helper.SMSSender;
import com.qinfenqi.mall.util.DateUtil;
import com.qinfenqi.mall.util.PropertyUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月11日 下午3:23:55
 * @author
 * @version 1.0
 */
@Service("billQuartzService")
public class BillQuartzServiceImpl implements BillQuartzService {
	private static final Logger logger = Logger.getLogger(BillQuartzServiceImpl.class);
	/*
	 * 更新延期滞纳金
	 */
	@Resource
	private BillDao billDao;

	public void updateBillFines() throws ParseException {
		logger.info("更新延期滞纳金 Start!");
		// 获得超期订单
		DateTime dateTime = new DateTime(Calendar.getInstance());
		// 格式化结束时间样式
		String currentDay = dateTime.toString(DateUtil.START_FORMAT);

		BillQuery billQuery = new BillQuery();
		billQuery.setCurrentDay(currentDay);

		// 获取超期并且未还款或者已经延期的订单
		List<BillQuery> list = billDao.getOverdueBills(billQuery);

		SimpleDateFormat format = new SimpleDateFormat(DateUtil.DATE_FORMAT);

		Date d2 = format.parse(currentDay);

		for (BillQuery bill : list) {
			Date d1 = format.parse(format.format(bill.getPaymentDate()));
			long diff = d2.getTime() - d1.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			bill.setLateDays((int) diffDays);
			if (diffDays > 31) { // 如果超过31天，按照（0.03 * 过期天数）计算滞纳金
				bill.setLateFines(bill.getMonthPay() * 0.01 * 31 + bill.getMonthPay() * 0.03 * (diffDays - 31));
			} else { // 如果小于（包括）30天，按照（0.01 * 过期天数）计算滞纳金
				bill.setLateFines(bill.getMonthPay() * 0.01 * diffDays);
			}
			billDao.updateBillLatefines(bill);
		}
		logger.info("更新延期滞纳金 End!");
	}

	@Override
	public void billSMSNotify() {
		List<BillQuery> list = new ArrayList<BillQuery>();
		BillQuery billQuery = new BillQuery();
		billQuery.setOrderField("payment_date");
		Date currentDay = new Date();
		// 1.提前两天提醒一次
		billQuery.setIndexstatus("2");
		String nextDay = DateUtil.getDateAfter(currentDay, 2, DateUtil.DATE_FORMAT);
		String thirdDay = DateUtil.getDateAfter(currentDay, 3, DateUtil.DATE_FORMAT);
		billQuery.setNextDay(nextDay);
		billQuery.setThirdDay(thirdDay);
		list.addAll(billDao.getBillList(billQuery));

		// 2.当天提醒一次
		billQuery.setIndexstatus("0");
		String currentDayTime = DateUtil.format(currentDay, DateUtil.DEFAULT_FORMAT);
		billQuery.setCurrentDay(currentDayTime);
		list.addAll(billDao.getBillList(billQuery));

		// 3.延期3天
		billQuery.setIndexstatus("1");
		List<BillQuery> bills = billDao.getBillList(billQuery);

		try {
			for (BillQuery bill : list) {
				if (bill.getPaymentStatus() != 2) {
					DateTime dt = new DateTime(bill.getPaymentDate());
					SMSSender.getInstance().send(bill.getUsername(), "SMS_TEMP_4",
							new String[] { bill.getTrueName(), dt.getDayOfMonth() + "" });
				}
			}
			
			for (BillQuery bill : bills) {
				if (bill.getPaymentStatus() != 2 && bill.getLateDays() == PropertyUtil.getInt("LATE_DAYS", 3)) {
					SMSSender.getInstance().send(bill.getUsername(), "SMS_TEMP_6", new String[] { bill.getTrueName() });
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
