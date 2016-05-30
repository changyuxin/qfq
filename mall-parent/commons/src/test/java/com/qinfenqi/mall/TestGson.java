/**
 * 
 */
package com.qinfenqi.mall;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.qinfenqi.mall.bean.DeliverInfo;
import com.qinfenqi.mall.bean.DeliverInfoData;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月8日 下午4:10:03
 * @author Chang Yuxin
 * @version 1.0
 */
public class TestGson {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DeliverInfo di = new DeliverInfo();
		di.setId("yuantong");
		di.setName("圆通快递");
		di.setNum(0);
		di.setUpdateTime("2015-07-08 15:23:09");
		di.setMessage("");
		di.setErrCode(0);
		di.setStatus(4);
		List<DeliverInfoData> list = new ArrayList<DeliverInfoData>();
		DeliverInfoData did1 = new DeliverInfoData();
		did1.setTime("2015-07-02 11:59:45");
		did1.setContent("辽宁省大连市开发区公司已签收");
		DeliverInfoData did2 = new DeliverInfoData();
		did2.setTime("2015-07-02 07:45:50");
		did2.setContent("辽宁省大连市开发区公司派件中");
		
		list.add(did1);
		list.add(did2);
		
		di.setData(list);
		
		Gson gson = new Gson();
		String json = gson.toJson(di);
		String content = "{'id':'yuantong','name':'圆通快递','order':'500163986991','num':0,'updateTime':'2015-07-08 15:23:09','message':'','errCode':0,'status':4,'data':[{'time':'2015-07-02 11:59:45','content':'辽宁省大连市开发区公司已签收'},{'time':'2015-07-02 07:45:50','content':'辽宁省大连市开发区公司派件中'},{'time':'2015-07-01 22:24:49','content':'辽宁省大连市公司已发出'},{'time':'2015-06-30 01:58:40','content':'北京转运中心公司已打包'},{'time':'2015-06-30 01:54:44','content':'北京转运中心公司已收入'},{'time':'2015-06-29 21:38:40','content':'北京市石景山区公司已发出'},{'time':'2015-06-29 19:43:26','content':'北京市石景山区公司已收件'}]}";
		//System.out.println("json = " + json);
		
		DeliverInfo dit = gson.fromJson(content, DeliverInfo.class);
		DeliverInfo dit1 = gson.fromJson(json, DeliverInfo.class);
		
		System.out.println(dit.getData().size());
		System.out.println(dit1);
		
	}
}
