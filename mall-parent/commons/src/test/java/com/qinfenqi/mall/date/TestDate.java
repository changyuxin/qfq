/**
 * 
 */
package com.qinfenqi.mall.date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.joda.time.DateTime;

import com.qinfenqi.mall.util.DateUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年8月21日 下午3:44:10
 * @author Chang Yuxin
 * @version 1.0
 */
public class TestDate {

	/**
	 * @param args
	 * @throws ParseException
	 */
	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = sdf.parse("2015-11-15 00:00:00");
		DateTime dt = new DateTime(d);
		Date d1 = sdf.parse("2015-12-10 00:00:00");
		DateTime dt1 = new DateTime(d1);
		
		long i = dt.getMillis() / 1000;
		long j = dt1.getMillis() / 1000;
		
		System.out.println((j - i) / 86400);
		
		System.out.println((j - i) / 86400 >= 30 ? true : false);
		
		Date currentDay = new Date();
		String nextDay = DateUtil.getDateAfter(currentDay, 0, DateUtil.DATE_FORMAT);
		System.out.println("nextDay = " + nextDay);
		
	}
}
