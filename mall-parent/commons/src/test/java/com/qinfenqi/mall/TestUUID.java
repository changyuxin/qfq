/**
 * 
 */
package com.qinfenqi.mall;

import java.util.Random;
import java.util.UUID;

import com.qinfenqi.mall.pay.util.wxpay.WxpayUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月9日 上午9:42:42
 * @author Chang Yuxin
 * @version 1.0
 */
public class TestUUID {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		UUID uuid = UUID.randomUUID();
		String s = WxpayUtil.CreateNoncestr(32);
		System.out.println("s = " + s);
		System.out.println(uuid.toString());// .replace("-", "").substring(0,16));

		String code = "";
		while (true) {
			int i = new Random().nextInt(9);
			if (i == 0) {
				continue;
			} else {
				code += String.valueOf(i);
			}
			if (code.length() == 4) {
				break;
			}
		}
		System.out.println("code = " + code);
		
	}
}
