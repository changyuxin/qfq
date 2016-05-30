/**
 * 
 */
package com.qinfenqi.mall.admin.manage;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.bean.DefaultRate;
import com.qinfenqi.mall.manage.bean.ProductRecom;
import com.qinfenqi.mall.manage.service.ManageService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月9日 上午9:07:10
 * @author Chang Yuxin
 * @version 1.0
 */
/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年11月2日 上午11:10:56
 * @author Chang Yuxin
 * @version 1.0
 */
public class ManageAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = 3344062697490179463L;

	@Resource
	private ManageService manageService;

	private AuthCode authCode = new AuthCode();
	private List<AuthCode> authCodes;
	private List<DefaultRate> defRates;
	private ProductRecom productRecom;
	private String recoms;

	/**
	 * 管理首页
	 * 
	 * @return
	 */
	public String index() {

		return "index";
	}

	/**
	 * 授权码管理页面
	 * 
	 * @return
	 */
	public String authCodePage() {
		return "authmng";
	}

	/**
	 * 生成授权码
	 * 
	 * @return
	 */
	public String createAuthCode() {
		JSONObject json = new JSONObject();
		boolean result = manageService.checkMobile(authCode);
		if (result) {
			String code = manageService.createAuthCode(authCode);
			json.put("result", SUCCESS);
			json.put("code", code);
		} else {
			json.put("result", FAILURE);
			json.put("message", "该手机已经获取过授权码，无法再次获取授权码!");
		}
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 获取授权码列表
	 * 
	 * @return
	 */
	public String getAuthCodeList() {
		authCodes = manageService.getAuthCodeList(authCode);
		double total = manageService.getAuthCodeCount(authCode);
		double pageSize = authCode.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		authCode.setPageTotal(pageTotal);
		authCode.setTotal((int) total);
		return "authlist";
	}

	public String deleteCode() {
		JSONObject json = new JSONObject();
		boolean result = manageService.deleteCode(authCode);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	/**
	 * 设置默认费率页
	 * 
	 * @return
	 */
	public String defaultRatePage() {
		defRates = manageService.getDefRates();
		return "defrate";
	}

	/**
	 * 保存默认费率
	 * 
	 * @return
	 */
	public String saveDefRate() {
		String[] periodNumStarts = request.getParameterValues("periodNumStart");
		String[] periodNumEnds = request.getParameterValues("periodNumEnd");
		String[] serviceRates = request.getParameterValues("serviceRate");

		JSONObject json = new JSONObject();
		boolean result = manageService.saveDefRate(periodNumStarts, periodNumEnds, serviceRates);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 设置精品推荐
	 * 
	 * @return
	 */
	public String prodRecom() {
		recoms = manageService.getProdRecom();
		return "recom";
	}

	public String saveRecom() {
		JSONObject json = new JSONObject();
		boolean result = manageService.saveRecom(productRecom);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * @return the authCode
	 */
	public AuthCode getAuthCode() {
		return authCode;
	}

	/**
	 * @param authCode
	 *            the authCode to set
	 */
	public void setAuthCode(AuthCode authCode) {
		this.authCode = authCode;
	}

	/**
	 * @param authCodes
	 *            the authCodes to set
	 */
	public void setAuthCodes(List<AuthCode> authCodes) {
		this.authCodes = authCodes;
	}

	/**
	 * @return the authCodes
	 */
	public List<AuthCode> getAuthCodes() {
		return authCodes;
	}

	/**
	 * @return the defRates
	 */
	public List<DefaultRate> getDefRates() {
		return defRates;
	}

	/**
	 * @param defRates
	 *            the defRates to set
	 */
	public void setDefRates(List<DefaultRate> defRates) {
		this.defRates = defRates;
	}

	/**
	 * @return the productRecom
	 */
	public ProductRecom getProductRecom() {
		return productRecom;
	}

	/**
	 * @param productRecom
	 *            the productRecom to set
	 */
	public void setProductRecom(ProductRecom productRecom) {
		this.productRecom = productRecom;
	}

	/**
	 * @return the recoms
	 */
	public String getRecoms() {
		return recoms;
	}

	/**
	 * @param recoms
	 *            the recoms to set
	 */
	public void setRecoms(String recoms) {
		this.recoms = recoms;
	}
}
