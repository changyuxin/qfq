/**
 * 
 */
package com.qinfenqi.mall.admin.collar;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.collar.service.CollarService;
import com.qinfenqi.mall.common.constant.Encoding;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月25日 上午8:52:52
 * @author Chang Yuxin
 * @version 1.0
 */
public class CollarAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -5083104154589022072L;
	@Resource
	private CollarService collarService;

	private CollarQuery collarQuery = new CollarQuery();
	private List<CollarQuery> collars = new ArrayList<CollarQuery>();
	private String countStr;
	
	/**
	 * 首页
	 * 
	 * @return
	 */
	public String index() {
		countStr = collarService.getCollarCounts();
		return "index";
	}

	/**
	 * 获取白领列表
	 * 
	 * @return
	 */
	public String getCollarsPage() {
		collarQuery.setOrderField("create_time");
		collars = collarService.getCollarList(collarQuery);
		double total = collarService.getCollarCount(collarQuery);
		double pageSize = collarQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		collarQuery.setPageTotal(pageTotal);
		collarQuery.setTotal((int) total);
		return "manage";
	}

	/**
	 * 审核通过
	 * 
	 * @return
	 */
	public String auditPass() {
		JSONObject json = new JSONObject();
		boolean result = collarService.auditPass(collarQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 审核不通过页面
	 * 
	 * @return
	 */
	public String auditPage() {
		return "audit";
	}

	/**
	 * 审核不通过
	 * 
	 * @return
	 */
	public String auditNoPass() {
		JSONObject json = new JSONObject();
		boolean result = collarService.auditNoPass(collarQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 会员详情
	 * 
	 * @return
	 */
	public String showCollarDetail() {
		collarQuery = collarService.getCollarById(collarQuery);
		return "detail";
	}
	
	/**
	 * 上传补充资料页面
	 * 
	 * @return
	 */
	public String uploadSpyPage() {
		return "spyphoto";
	}
	
	/**
	 * 上传补充资料
	 * 
	 * @return
	 * @throws IOException
	 */
	public String uploadSpyPhoto() throws IOException {
		PrintWriter out = response.getWriter();

		String spyPhotos = uploadPhoto(upload, uploadContentType, "collar");
		if (null != spyPhotos && !"".equals(spyPhotos)) {
			collarQuery.setSupplyPhoto(StringUtil.removeLastComma(spyPhotos));
			collarService.updateCollarSpy(collarQuery, getCurrentUser());
		}
		response.setCharacterEncoding(Encoding.UTF_8);
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.close(1)");
		out.println("</script>");
		return null;
	}
	
	/**
	 * 删除补充资料
	 * 
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public String deleteSpy() throws NoSuchAlgorithmException {
		JSONObject json = new JSONObject();
		boolean result = collarService.deleteSpy(collarQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	
	/**
	 * @return the collarQuery
	 */
	public CollarQuery getCollarQuery() {
		return collarQuery;
	}

	/**
	 * @param collarQuery
	 *            the collarQuery to set
	 */
	public void setCollarQuery(CollarQuery collarQuery) {
		this.collarQuery = collarQuery;
	}

	/**
	 * @return the collars
	 */
	public List<CollarQuery> getCollars() {
		return collars;
	}

	/**
	 * @param collars
	 *            the collars to set
	 */
	public void setCollars(List<CollarQuery> collars) {
		this.collars = collars;
	}

	/**
	 * @return the countStr
	 */
	public String getCountStr() {
		return countStr;
	}

	/**
	 * @param countStr the countStr to set
	 */
	public void setCountStr(String countStr) {
		this.countStr = countStr;
	}

}
