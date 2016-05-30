/**
 * 
 */
package com.qinfenqi.mall.admin.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.common.constant.Encoding;
import com.qinfenqi.mall.embassy.query.EmbassyQuery;
import com.qinfenqi.mall.embassy.service.EmbassyService;
import com.qinfenqi.mall.member.bean.Black;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.member.service.MemberService;
import com.qinfenqi.mall.util.DateUtil;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月11日 下午1:24:28
 * @author Chang Yuxin
 * @version 1.0
 */
/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年8月4日 上午10:56:09
 * @author Chang Yuxin
 * @version 1.0
 */
public class MemberAction extends BaseActionEx {

	/** */
	private static final long serialVersionUID = 721108333906921499L;

	@Resource
	private MemberService memberService;
	@Resource
	private EmbassyService embassyService;
	private MemberQuery memberQuery = new MemberQuery();
	private List<MemberQuery> members;
	private List<Black> blackList;
	private List<EmbassyQuery> embassys;
	private EmbassyQuery embassyQuery;
	private String countStr;

	/**
	 * 首页
	 * 
	 * @return
	 */
	public String index() {
		countStr = memberService.getMemberCounts();
		return "index";
	}

	/**
	 * 会员列表
	 * 
	 * @return
	 */
	public String getMembersPage() {
		int auditStatus = memberQuery.getAuditStatus();
		if (auditStatus > 1) {
			memberQuery.setOrderField("audit_time");
		}
		members = memberService.getMemberList(memberQuery);
		double total = memberService.getMemberCount(memberQuery);
		double pageSize = memberQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		memberQuery.setPageTotal(pageTotal);
		memberQuery.setTotal((int) total);
		return "manage";
	}

	/**
	 * 信息审核
	 * 
	 * @return
	 */
	public String auditPass() {
		JSONObject json = new JSONObject();
		boolean result = memberService.auditPass(memberQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 会员详情
	 * 
	 * @return
	 */
	public String showMemberDetail() {
		memberQuery = memberService.getMemberById(memberQuery);
		return "detail";
	}

	/**
	 * 审核页面
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
		boolean result = memberService.auditNoPass(memberQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 审核过程记录页面
	 * 
	 * @return
	 */
	public String auditRecordPage() {
		return "auditrec";
	}

	/**
	 * 审核过程记录
	 * 
	 * @return
	 */
	public String auditRecord() {
		JSONObject json = new JSONObject();
		boolean result = memberService.auditRecord(memberQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	
	/**
	 * 会员归档
	 * 
	 * @return
	 */
	public String archive(){
		JSONObject json = new JSONObject();
		boolean result = memberService.archive(memberQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	/**
	 * 解除会员归档
	 * 
	 * @return
	 */
	public String unarchive(){
		JSONObject json = new JSONObject();
		boolean result = memberService.unarchive(memberQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	
	
	/**
	 * 查询黑名单
	 * 
	 * @return
	 */
	public String searchBlackList() {
		blackList = memberService.searchBlackList(memberQuery);
		return "blacklist";
	}

	/**
	 * 删除补充资料
	 * 
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public String deleteSpy() throws NoSuchAlgorithmException {
		JSONObject json = new JSONObject();
		boolean result = memberService.deleteSpy(memberQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
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

		String spyPhotos = uploadPhoto(upload, uploadContentType, "member");
		if (null != spyPhotos && !"".equals(spyPhotos)) {
			memberQuery.setSupplyPhoto(StringUtil.removeLastComma(spyPhotos));
			memberService.updateMemberSpy(memberQuery, getCurrentUser());
		}
		response.setCharacterEncoding(Encoding.UTF_8);
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.close(1)");
		out.println("</script>");
		return null;
	}

	/**
	 * 按条件导出会员
	 * 
	 * @return
	 */
	public String exportMembers() {
		String fileName = "member_" + DateUtil.getCurrentDate(DateUtil.DATE_FOMATE_YYYYMMDDHHMMSS) + ".xls";
		excelFileName = encodeDownloadName(fileName);
		response.setCharacterEncoding(Encoding.UTF_8);
		excelStream = memberService.exportMembers(memberQuery);
		return "excel";
	}

	/**
	 * 分配大使页面
	 * 
	 * @return
	 */
	public String distEmbasssyPage() {
		embassys = embassyService.getEmbassyListBySchool(embassyQuery);
		return "embassy";
	}

	/**
	 * 分配大使
	 * 
	 * @return
	 */
	public String distEmbasssy() {
		JSONObject json = new JSONObject();
		boolean result = memberService.saveEmbassy(memberQuery, getCurrentUser());
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * @return the memberQuery
	 */
	public MemberQuery getMemberQuery() {
		return memberQuery;
	}

	/**
	 * @param memberQuery
	 *            the memberQuery to set
	 */
	public void setMemberQuery(MemberQuery memberQuery) {
		this.memberQuery = memberQuery;
	}

	/**
	 * @return the members
	 */
	public List<MemberQuery> getMembers() {
		return members;
	}

	/**
	 * @param members
	 *            the members to set
	 */
	public void setMembers(List<MemberQuery> members) {
		this.members = members;
	}

	/**
	 * @return the blackList
	 */
	public List<Black> getBlackList() {
		return blackList;
	}

	/**
	 * @param blackList
	 *            the blackList to set
	 */
	public void setBlackList(List<Black> blackList) {
		this.blackList = blackList;
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

	/**
	 * @return the embassys
	 */
	public List<EmbassyQuery> getEmbassys() {
		return embassys;
	}

	/**
	 * @param embassys
	 *            the embassys to set
	 */
	public void setEmbassys(List<EmbassyQuery> embassys) {
		this.embassys = embassys;
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
}
