package com.qinfenqi.mall.ip;

import com.qinfenqi.mall.common.ip.IPSeeker;

import junit.framework.TestCase;

public class IPtest extends TestCase {

	public void testIp() {
		// 指定纯真数据库的文件名，所在文件夹
		IPSeeker ip = new IPSeeker("qqwry.dat", "G:/workplace-qfq/mall-parent/admin/src/main/resources");
		// 测试IP 58.20.43.13
		System.out.println(ip.getIPLocation("58.20.43.13").getCountry() + ":" + ip.getIPLocation("58.20.43.13").getArea() + ":" + ip.getIPLocation("58.20.43.13").getArea() );
	}
}
