/**
 * 
 */
package com.qinfenqi.mall.common.base;

import java.util.List;

import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年8月4日 下午2:48:07
 * @author Chang Yuxin
 * @version 1.0
 */
public class BaseService {
	/**
	 * @param status
	 * @param list
	 * @return
	 */
	public String convertCountResult(String[] status, List<Count> list) {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < status.length; i++) {
			String value = "";
			for (Count count : list) {
				if (status[i].equals(count.getName())) {
					value = count.getTotal();
				}
			}
			buffer.append(status[i]).append(Symbol.MINUS);
			if ("".equals(value)) {
				buffer.append("0");
			} else {
				buffer.append(value);
			}
			buffer.append(Symbol.COMMA);
		}
		return StringUtil.removeLastComma(buffer.toString());
	}
}
