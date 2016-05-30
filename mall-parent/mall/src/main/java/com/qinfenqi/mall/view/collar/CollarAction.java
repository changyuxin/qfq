/**
 * 
 */
package com.qinfenqi.mall.view.collar;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.collar.service.CollarService;
import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.system.service.UserService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月13日 上午9:40:13
 * @author Chang Yuxin
 * @version 1.0
 */
@Action(results = { 
		@Result(name = "index", location = "/center/home.html", type = "redirect"),
		@Result(name = "upload", location = "/collar/infoPage.html", type = "redirect") 
	})
public class CollarAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = 5199374209089920932L;
	@Resource
	private CollarService collarService;
	@Resource
	private UserService userService;

	private UserQuery userQuery;
	CollarQuery collarQuery = new CollarQuery();

	/**
	 * @return String
	 */
	public String regist() {
		return "regist";
	}

	public String infoPage() {
		return "info";
	}
	//获得基本信息
	public String getBaseInfo(){
		collarQuery = collarService.getCollarByUserId(getUserId());
		return "baseinfo";
	}
	//获得公司信息
	public String getCompanyInfo(){
		collarQuery = collarService.getCollarByUserId(getUserId());
		return "companyinfo";
	}
	//获得邮寄信息
	public String getMailInfo(){
		collarQuery = collarService.getCollarByUserId(getUserId());
		return "mailinfo";
	}
	//获得家庭信息
	public String getHomeInfo(){
		collarQuery = collarService.getCollarByUserId(getUserId());
		return "homeinfo";
	}
	//获得收入信息
	public String getIncomeInfo(){
		collarQuery = collarService.getCollarByUserId(getUserId());
		return "incomeinfo";
	}
	//获得银行卡信息
	public String getBankcardInfo(){
		collarQuery = collarService.getCollarByUserId(getUserId());
		return "bankcardinfo";
	}
	//获得上传信息
	public String getUploadInfo(){
		collarQuery = collarService.getCollarByUserId(getUserId());
		return "uploadinfo";
	}
	/**
	 * 白领注册
	 * 
	 * @return
	 */

	public String collarRegist() {
		JSONObject json = new JSONObject();
		userQuery.setRegisterIp(request.getRemoteAddr());
		boolean result = collarService.createCollar(userQuery);
		getUserLoginInfo(userQuery);
		// 更新当前登录用户的登录信息
		userService.updateUser(userQuery);
		// 保存用户到session
		setCurrentUser(userQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 验证授权码是否存在
	 * 
	 * @return
	 */
	public String checkAuthCode() {
		JSONObject json = new JSONObject();
		json.put("result", 0);
		List<AuthCode> codeList = userService.getCodeListByMobile(userQuery);
		if (codeList.size() == 0) {
			// 没有满足当前手机号的授权码
			json.put("result", 1);
		} else if (!userQuery.getAuthCode().equals(codeList.get(0).getCode())) {
			// 当前手机号的授权码输入有误
			json.put("result", 2);
		}
		ajaxReturnValue = json.toString();

		return AJAX;
	}

	/**
	 * @return
	 * @throws IOException
	 */
//	public String collarInfoImprove() throws IOException {
//		String spyPhotos = uploadPhoto(upload, uploadContentType, "collar");
//		List<String> list = new ArrayList<String>();
//		if (null != spyPhotos && !"".equals(spyPhotos)) {
//			String[] str = spyPhotos.split(",");
//			for(int i = 0; i < str.length; i ++){
//				list.add(str[i]);
//			}
//			String uploadCardString = list.subList(0, 2).toString();
//			String uploadFlowString = list.subList(2, 3).toString();
//			String uploadOtherString = list.subList(3, list.size()).toString();
//			collarQuery.setUploadCardDetail(uploadCardString.substring(1, uploadCardString.length()-1));
//			collarQuery.setUploadFlowDetail(uploadFlowString.substring(1, uploadFlowString.length()-1));
//			collarQuery.setUploadOtherDetail(uploadOtherString.substring(1, uploadOtherString.length()-1));
//		}
//		collarService.collarInfoImprove(collarQuery);
//
//		return "index";
//	}
	//基本信息更新
	public String baseInfoImprove() throws IOException {
		collarService.baseInfoImprove(collarQuery);
		return "baseinfo";
	}
	//公司信息更新
	public String companyInfoImprove() throws IOException {
		collarService.companyInfoImprove(collarQuery);
		return "companyinfo";
	}
	//邮寄信息更新
	public String mailInfoImprove() throws IOException {
		collarService.mailInfoImprove(collarQuery);
		return "mailinfo";
	}
	//家庭信息更新
	public String homeInfoImprove() throws IOException {
		collarService.homeInfoImprove(collarQuery);
		return "homeinfo";
	}
	//收入信息更新
	public String incomeInfoImprove() throws IOException {
		collarService.incomeInfoImprove(collarQuery);
		return "incomeinfo";
	}
	//银行信息更新
	public String bankInfoImprove() throws IOException {
		collarService.bankcardInfoImprove(collarQuery);
		return "bankcardinfo";
	}
	//上传信息更新
	public String uploadInfoImprove() throws IOException {

		String spyPhotos = uploadPhoto(upload, uploadContentType, "collar");
		List<String> list = new ArrayList<String>();
		if (null != spyPhotos && !"".equals(spyPhotos)) {
			String[] str = spyPhotos.split(",");
			for(int i = 0; i < str.length; i ++){
				list.add(str[i]);
			}
			String uploadCardString = list.subList(0, 2).toString();
			String uploadFlowString = list.subList(2, 3).toString();
			String uploadOtherString = list.subList(3, list.size()).toString();
			collarQuery.setUploadCardDetail(uploadCardString.substring(1, uploadCardString.length()-1));
			collarQuery.setUploadFlowDetail(uploadFlowString.substring(1, uploadFlowString.length()-1));
			collarQuery.setUploadOtherDetail(uploadOtherString.substring(1, uploadOtherString.length()-1));
		}
		collarService.uploadInfoImprove(collarQuery);
		
		return "info";
	}
	/**
	 * @return the collarQuery
	 */
	public CollarQuery getCollarQuery() {
		return collarQuery;
	}

	/**
	 * @param collarQuery the collarQuery to set
	 */
	public void setCollarQuery(CollarQuery collarQuery) {
		this.collarQuery = collarQuery;
	}

	/**
	 * @return the userQuery
	 */
	public UserQuery getUserQuery() {
		return userQuery;
	}

	/**
	 * @param userQuery the userQuery to set
	 */
	public void setUserQuery(UserQuery userQuery) {
		this.userQuery = userQuery;
	}
	
}
