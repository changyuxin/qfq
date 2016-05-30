/**
 * 
 */
package com.qinfenqi.mall.admin.embassy;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.bean.IdCard;
import com.qinfenqi.mall.center.bean.School;
import com.qinfenqi.mall.center.bean.SchoolProvince;
import com.qinfenqi.mall.center.service.CenterService;
import com.qinfenqi.mall.common.helper.IDCardValidator;
import com.qinfenqi.mall.embassy.query.EmbassyQuery;
import com.qinfenqi.mall.embassy.service.EmbassyService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月17日 下午3:04:25
 * @author Chang Yuxin
 * @version 1.0
 */
public class EmbassyAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = 3444953178849089488L;
	@Resource
	private EmbassyService embassyService;
	@Resource
	private CenterService centerService;
	private List<EmbassyQuery> embassyList;
	private List<School> schoolList;
	private School school;
	private List<SchoolProvince> schoolProList;
	private EmbassyQuery embassyQuery = new EmbassyQuery();
	private String countStr;

	/**
	 * 大使管理首页
	 * 
	 * @return
	 */
	public String index() {
		countStr = embassyService.getEmbassyCounts();
		return "index";
	}

	/**
	 * 大使列表
	 * 
	 * @return
	 */
	public String getEmbassyPage() {
		embassyQuery.setPageSize(20);
		embassyQuery.setOrderField("create_time");
		embassyList = embassyService.getEmbassyList(embassyQuery);
		double total = embassyService.getEmbassyCount(embassyQuery);
		double pageSize = embassyQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		embassyQuery.setPageTotal(pageTotal);
		embassyQuery.setTotal((int) total);
		return "manage";
	}

	/**
	 * 添加大使页面
	 * 
	 * @return
	 */
	public String saveEmbassyPage() {
		embassyQuery = embassyService.getEmbassyById(embassyQuery.getEmbassyId());
		return "save";
	}

	/**
	 * 转正大使页面
	 * 
	 * @return
	 */
	public String trunFormalPage() {
		embassyQuery = embassyService.getEmbassyById(embassyQuery.getEmbassyId());
		return "save";
	}

	public String saveEmbassy() {
		long userId = embassyQuery.getEmbassyId();
		boolean result = false;
		if (userId == 0) {
			result = embassyService.addEmbassy(embassyQuery);
		} else {
			result = embassyService.editEmbassy(embassyQuery);
		}
		JSONObject json = new JSONObject();
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 注销大使
	 * 
	 * @return
	 */
	public String destroyEmbassy() {
		boolean result = embassyService.destroyEmbassy(embassyQuery);
		JSONObject json = new JSONObject();
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 选择高校界面
	 * 
	 * @return
	 */
	public String schools() {
		schoolProList = centerService.getschoolProList();
		return "schools";
	}

	/**
	 * 选择高校
	 */
	public void getSchools() {
		schoolList = centerService.schoolListByProId(school.getSchoolProId());
		String json = JSONArray.fromObject(schoolList).toString();
		ajaxResponse(json);
	}

	/**
	 * 查询高校
	 */
	public void searchSchool() {
		schoolList = centerService.searchSchool(school);
		String json = JSONArray.fromObject(schoolList).toString();
		ajaxResponse(json);
	}

	public void idCardValid() {
		String rtn = "1";
		try {
			IdCard id = IDCardValidator.validator(embassyQuery.getIdCard());
			rtn = id.getSuccess();
		} catch (Exception e) {
			e.printStackTrace();
			rtn = "-1";
		}
		ajaxResponse(rtn + "");
	}

	/**
	 * @return the embassyList
	 */
	public List<EmbassyQuery> getEmbassyList() {
		return embassyList;
	}

	/**
	 * @param embassyList
	 *            the embassyList to set
	 */
	public void setEmbassyList(List<EmbassyQuery> embassyList) {
		this.embassyList = embassyList;
	}

	/**
	 * @return the embassyQuery
	 */
	public EmbassyQuery getEmbassyQuery() {
		return embassyQuery;
	}

	/**
	 * @param embassyQuery
	 *            the embassyQuery to set
	 */
	public void setEmbassyQuery(EmbassyQuery embassyQuery) {
		this.embassyQuery = embassyQuery;
	}

	/**
	 * @return the schoolProList
	 */
	public List<SchoolProvince> getSchoolProList() {
		return schoolProList;
	}

	/**
	 * @param schoolProList
	 *            the schoolProList to set
	 */
	public void setSchoolProList(List<SchoolProvince> schoolProList) {
		this.schoolProList = schoolProList;
	}

	/**
	 * @return the schoolList
	 */
	public List<School> getSchoolList() {
		return schoolList;
	}

	/**
	 * @param schoolList
	 *            the schoolList to set
	 */
	public void setSchoolList(List<School> schoolList) {
		this.schoolList = schoolList;
	}


	/**
	 * @return the school
	 */
	public School getSchool() {
		return school;
	}

	/**
	 * @param school the school to set
	 */
	public void setSchool(School school) {
		this.school = school;
	}

	/**
	 * @return the countStr
	 */
	public String getCountStr() {
		return countStr;
	}

	/**
	 * @param countStr
	 *            the countStr to set
	 */
	public void setCountStr(String countStr) {
		this.countStr = countStr;
	}

}
