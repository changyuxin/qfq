/**
 * 
 */
package com.qinfenqi.mall.member.service.impl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.bean.Log;
import com.qinfenqi.mall.common.base.BaseService;
import com.qinfenqi.mall.common.constant.BizType;
import com.qinfenqi.mall.common.constant.MemberStatus;
import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.common.helper.SMSSender;
import com.qinfenqi.mall.embassy.dao.EmbassyDao;
import com.qinfenqi.mall.embassy.query.EmbassyQuery;
import com.qinfenqi.mall.log.dao.LogDao;
import com.qinfenqi.mall.member.bean.Black;
import com.qinfenqi.mall.member.dao.MemberDao;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.member.service.MemberService;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.util.DateUtil;
import com.qinfenqi.mall.util.MD5Util;
import com.qinfenqi.mall.util.PropertyUtil;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月10日 下午2:38:18
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("memberService")
public class MemberServiceImpl extends BaseService implements MemberService {

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Resource
	private MemberDao memberDao;
	@Resource
	private LogDao logDao;
	@Resource
	private EmbassyDao embassyDao;

	@Override
	public MemberQuery getMemberByUserId(long userId) {
		return memberDao.getMemberByUserId(userId);
	}

	@Override
	public List<MemberQuery> getMemberList(MemberQuery memberQuery) {

		List<MemberQuery> list = memberDao.getMemberList(memberQuery);

		String[] spyUrls = null;
		String spyUrl = null;
		String othersPhoto = null;
		String[] othersUrls = null;
		for (MemberQuery member : list) {
			spyUrl = member.getSupplyPhoto();
			if (null != spyUrl && !"".equals(spyUrl)) {
				spyUrls = spyUrl.split(Symbol.COMMA);
				member.setSpyPhotos(Arrays.asList(spyUrls));
			}
			othersPhoto = member.getOthersPhoto();
			if (null != othersPhoto && !"".equals(othersPhoto)) {
				othersUrls = othersPhoto.split(Symbol.SEMICOLON);
				member.setOtherPhotos(Arrays.asList(othersUrls));
			}
		}
		return list;
	}

	@Override
	public boolean auditPass(MemberQuery memberQuery, User user) {

		String oauthType = memberQuery.getOauthType();
		String msg = "";
		MemberQuery mq = memberDao.getMemberById(memberQuery);
		if ("isIdOauth".equals(oauthType)) {
			if (memberQuery.getIsIdOauth() == 3) {
				// if (mq.getIsBkcardOauth() == 3 && mq.getIsContactOauth() == 3) {
				// memberQuery.setCreditLimit(mq.getCreditLimit() + PropertyUtil.getInt("credit_1"));
				memberQuery.setAuditStatus(3);
				// msg = "基础信息-身份学藉，审核通过，信用额度变为：" + PropertyUtil.getInt("credit_1");
				// }
				msg = "基础信息-身份学藉，审核通过!";
			}
		} else if ("isContactOauth".equals(oauthType)) {
			if (memberQuery.getIsContactOauth() == 3) {
				// if (mq.getIsBkcardOauth() == 3 && mq.getIsIdOauth() == 3) {
				// memberQuery.setCreditLimit(mq.getCreditLimit() + PropertyUtil.getInt("credit_1"));
				// msg = "基础信息-联系方式，审核通过，信用额度变为：" + PropertyUtil.getInt("credit_1");
				memberQuery.setAuditStatus(3);
				// } else {
				msg = "基础信息-联系方式，审核通过!";
				// }
			}
		} else if ("isBkcardOauth".equals(oauthType)) {// 如果认证通过，则提升信用额度500
			if (memberQuery.getIsBkcardOauth() == 3) {
				// if (mq.getIsIdOauth() == 3 && mq.getIsContactOauth() == 3) {
				// memberQuery.setCreditLimit(mq.getCreditLimit() + PropertyUtil.getInt("credit_1"));
				// msg = "基础信息-银行卡绑定通过，信用额度变为：" + PropertyUtil.getInt("credit_1");
				memberQuery.setAuditStatus(3);
				// } else {
				msg = "基础信息-银行卡绑定通过";
				// }
			}
		} else if ("isEcpOauth".equals(oauthType)) {
			if (memberQuery.getIsEcpOauth() == 3) {
				if (mq.getIsCardOauth() == 3) {
					// memberQuery.setCreditLimit(mq.getCreditLimit() + PropertyUtil.getInt("credit_2"));
					// msg = "提升额度1-紧急联系方式，信用额度变为：" + PropertyUtil.getInt("credit_2");
					memberQuery.setAuditStatus(3);
					// } else {
					msg = "提升额度1-紧急联系方式，审核通过!";
				}
			}
		} else if ("isCardOauth".equals(oauthType)) { // 如果认证通过，则提升信用额度5500
			if (memberQuery.getIsCardOauth() == 3) {
				if (mq.getIsEcpOauth() == 3) {
					// memberQuery.setCreditLimit(mq.getCreditLimit() + PropertyUtil.getInt("credit_2"));
					// msg = "提升额度1-证件照片，审核通过，信用额度变为：" + PropertyUtil.getInt("credit_2");
					memberQuery.setAuditStatus(3);
					// } else {
					msg = "提升额度1-证件照片，审核通过!";
				}
			}
		} else if ("isBkflowOauth".equals(oauthType)) {// 如果认证通过，则提升信用额度4000
			if (memberQuery.getIsBkflowOauth() == 3) {
				if (mq.getIsCardOauth() == 3 && mq.getIsBkcardOauth() == 3) {
					memberQuery.setCreditLimit(mq.getCreditLimit() + PropertyUtil.getInt("credit_3"));
					memberQuery.setAuditStatus(3);
					msg = "提升额度2-银行流水，审核通过，信用额度变为：" + PropertyUtil.getInt("credit_3");
				}
			}
		}

		memberQuery.setAuditCount(mq.getAuditCount() + 1);
		memberQuery.setAuditTime(new Date());
		boolean result = memberDao.update(memberQuery);
		if (result) {
			result = saveMemberOpLog(memberQuery, user, msg);
		}
		return result;
	}

	/**
	 * 保存会员的操作记录
	 * 
	 * @param orderQuery
	 * @param user
	 * @param logDesc
	 */
	private boolean saveMemberOpLog(MemberQuery memberQuery, User user, String logDesc) {
		Log log = new Log();
		log.setBizType(BizType.MEMBER.getId());
		log.setBizId(memberQuery.getMemberId());
		log.setUserId(user.getUserId());
		log.setUserName(user.getUserName());
		log.setCreateTime(new Date());
		log.setDescription(logDesc);
		return logDao.createLog(log);
	}

	@Override
	public int getMemberCount(MemberQuery memberQuery) {
		return memberDao.getMemberCount(memberQuery);
	}

	@Override
	public void updateMemberSpy(MemberQuery memberQuery, User user) {
		MemberQuery mq = memberDao.getMemberById(memberQuery);
		String spyPhoto = mq.getSupplyPhoto();
		if ("".equals(spyPhoto) || null == spyPhoto) {
			memberQuery.setSupplyPhoto(memberQuery.getSupplyPhoto());
		} else {
			memberQuery.setSupplyPhoto(spyPhoto + "," + memberQuery.getSupplyPhoto());
		}
		memberDao.updateMemberSpy(memberQuery);
		saveMemberOpLog(memberQuery, user, "提交补充资料");
	}

	@Override
	public boolean deleteSpy(MemberQuery memberQuery, User user) throws NoSuchAlgorithmException {
		MemberQuery member = memberDao.getMemberById(memberQuery);
		String[] spyUrls = null;
		String spyUrl = null;
		spyUrl = member.getSupplyPhoto();
		if (null != spyUrl && !"".equals(spyUrl)) {
			spyUrls = spyUrl.split(",");
		}
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < spyUrls.length; i++) {
			if (MD5Util.encodeString(spyUrls[i]).equals(memberQuery.getUrl())) {
				continue;
			} else {
				buffer.append(spyUrls[i]).append(",");
			}
		}
		member.setSupplyPhoto(StringUtil.removeLastComma(buffer.toString()));
		saveMemberOpLog(memberQuery, user, "删除补充资料");
		return memberDao.updateMemberSpy(member);
	}

	@Override
	public boolean auditNoPass(MemberQuery memberQuery, User user) {
		String oauthType = memberQuery.getOauthType();
		String msg = "";
		String reason = memberQuery.getOpinion();
		memberQuery = memberDao.getMemberById(memberQuery);
		// 身份学藉认证
		if ("isIdOauth".equals(oauthType)) {
			// if (memberQuery.getIsBkcardOauth() == 3 && memberQuery.getIsIdOauth() == 3 && memberQuery.getIsContactOauth() == 3) {
			// memberQuery.setCreditLimit(memberQuery.getCreditLimit() - PropertyUtil.getInt("credit_1"));
			// }
			memberQuery.setIsIdOauth(4);
			msg = "基础认证-身份学藉，审批不通过，原因：" + reason;
			memberQuery.setIdOauthOpinion(reason);
		} else if ("isContactOauth".equals(oauthType)) {
			// if (memberQuery.getIsBkcardOauth() == 3 && memberQuery.getIsIdOauth() == 3 && memberQuery.getIsContactOauth() == 3) {
			// memberQuery.setCreditLimit(memberQuery.getCreditLimit() - PropertyUtil.getInt("credit_1"));
			// }
			memberQuery.setIsContactOauth(4);
			msg = "基础认证-联系方式，审批不通过，原因：" + reason;
			memberQuery.setContactOauthOpinion(reason);
		} else if ("isBkcardOauth".equals(oauthType)) {
			// if (memberQuery.getIsBkcardOauth() == 3 && memberQuery.getIsIdOauth() == 3 && memberQuery.getIsContactOauth() == 3) {
			// memberQuery.setCreditLimit(memberQuery.getCreditLimit() - PropertyUtil.getInt("credit_1"));
			// }
			memberQuery.setIsBkcardOauth(4);
			msg = "基础认证-银行卡绑定，审批不通过，原因：" + reason;
			memberQuery.setBkcardOauthOpinion(reason);
		} else if ("isEcpOauth".equals(oauthType)) {
			// if (memberQuery.getIsCardOauth() == 3 && memberQuery.getIsEcpOauth() == 3) {
			// memberQuery.setCreditLimit(memberQuery.getCreditLimit() - PropertyUtil.getInt("credit_2"));
			// }
			memberQuery.setIsEcpOauth(4);
			msg = "提升额度1-紧急联系方式，审批不通过，原因：" + reason;
			memberQuery.setEcpOauthOpinion(reason);
		} else if ("isCardOauth".equals(oauthType)) {
			// if (memberQuery.getIsCardOauth() == 3 && memberQuery.getIsEcpOauth() == 3) {
			// memberQuery.setCreditLimit(memberQuery.getCreditLimit() - PropertyUtil.getInt("credit_2"));
			// }
			memberQuery.setIsCardOauth(4);
			msg = "提升额度1-证件照片，审批不通过，原因：" + reason;
			memberQuery.setCardOauthOpinion(reason);
		} else if ("isBkflowOauth".equals(oauthType)) {
			if (memberQuery.getIsBkflowOauth() == 3 && memberQuery.getCreditLimit() > 0) {
				memberQuery.setCreditLimit(memberQuery.getCreditLimit() - PropertyUtil.getInt("credit_3"));
			}
			memberQuery.setIsBkflowOauth(4);
			msg = "提升额度2-银行流水，审批不通过，原因：" + reason;
			memberQuery.setBkflowOauthOpinion(reason);
		}

		memberQuery.setAuditCount(memberQuery.getAuditCount() + 1);
		memberQuery.setAuditStatus(4);
		memberQuery.setAuditTime(new Date());
		boolean result = memberDao.updateMemberOauth(memberQuery);
		if (result) {
			result = saveMemberOpLog(memberQuery, user, msg);
			try {
				SMSSender.getInstance().send(memberQuery.getPhone(), "SMS_TEMP_3", new String[] { memberQuery.getTrueName() });
			} catch (IOException e) {
				String errMsg = "Send sms failure! trueName: " + memberQuery.getTrueName() + ", mobile: " + memberQuery.getPhone()
						+ "tempId: SMS_TEMP_3";
				logger.error(errMsg, e);
			}
		}
		return result;
	}

	@Override
	public List<Black> searchBlackList(MemberQuery memberQuery) {
		List<Black> list = memberDao.queryBlackList(memberQuery);
		for (Black black : list) {
			black.setTotalArrears(black.getTotalArrears().replace("&yen;", "¥"));
			black.setTotalPenalty(black.getTotalPenalty().replace("&yen;", "¥"));
		}
		return list;
	}

	@Override
	public MemberQuery getMemberById(MemberQuery memberQuery) {
		return memberDao.getMemberById(memberQuery);
	}

	public int getMemberByIdCard(String idCard, long userId) {
		MemberQuery memberQuery = new MemberQuery();
		memberQuery.setIdCard(idCard);
		memberQuery.setUserId(userId);
		return memberDao.getMemberByIdCard(memberQuery);
	}

	@Override
	public String getMemberCounts() {
		MemberQuery memberQuery = new MemberQuery();
		memberQuery.setPage(false);
		List<Count> list = memberDao.getMemberCounts(memberQuery);

		memberQuery.setAuditStatus(5);
		List<MemberQuery> mqlist = memberDao.getMemberList(memberQuery);
		Count count5 = new Count("5", mqlist.size() + "");
		list.add(count5);

		memberQuery.setAuditStatus(6);
		mqlist = memberDao.getMemberList(memberQuery);
		Count count6 = new Count("6", mqlist.size() + "");
		list.add(count6);

		memberQuery.setAuditStatus(7);
		mqlist = memberDao.getMemberList(memberQuery);
		Count count7 = new Count("7", mqlist.size() + "");
		list.add(count7);

		String[] status = { "1", "2", "3", "4", "5", "6", "7", "99" };
		return convertCountResult(status, list);
	}

	@Override
	public InputStream exportMembers(MemberQuery memberQuery) {
		// 将OutputStream转化为InputStream
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		putDataOnOutputStream(out, memberQuery);
		return new ByteArrayInputStream(out.toByteArray());

	}

	/**
	 * 导出会员到excel
	 * 
	 * @param os
	 * @param memberQuery
	 */
	private void putDataOnOutputStream(ByteArrayOutputStream os, MemberQuery memberQuery) {
		memberQuery.setPage(false);
		List<MemberQuery> members = memberDao.getMemberList(memberQuery);

		WritableWorkbook workbook;
		try {
			workbook = Workbook.createWorkbook(os);

			WritableSheet sheet = workbook.createSheet("Sheet1", 0);
			// 设置单元格的Title文字格式
			WritableFont wf_t = new WritableFont(WritableFont.ARIAL, 11, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE,
					Colour.BLACK);
			WritableCellFormat wcf = new WritableCellFormat(wf_t);
			wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
			wcf.setAlignment(Alignment.CENTRE);

			// 设置单元格的Content文字格式
			WritableFont wf_c = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE,
					Colour.BLACK);
			WritableCellFormat wcf_c = new WritableCellFormat(wf_c);
			wcf_c.setVerticalAlignment(VerticalAlignment.CENTRE);
			wcf_c.setAlignment(Alignment.CENTRE);

			sheet.addCell(new Label(0, 0, "用户名", wcf));
			sheet.addCell(new Label(1, 0, "真实姓名", wcf));
			sheet.addCell(new Label(2, 0, "身份证号", wcf));
			sheet.addCell(new Label(3, 0, "所在学校", wcf));
			sheet.addCell(new Label(4, 0, "毕业年份", wcf));
			sheet.addCell(new Label(5, 0, "毕业月份", wcf));
			sheet.addCell(new Label(6, 0, "创建时间", wcf));
			sheet.addCell(new Label(7, 0, "状态", wcf));

			sheet.setColumnView(0, 15);
			sheet.setColumnView(1, 10);
			sheet.setColumnView(2, 30);
			sheet.setColumnView(3, 35);
			sheet.setColumnView(4, 10);
			sheet.setColumnView(5, 10);
			sheet.setColumnView(6, 30);
			sheet.setColumnView(7, 15);

			for (int i = 0; i < members.size(); i++) {
				MemberQuery mq = members.get(i);
				sheet.addCell(new Label(0, i + 1, mq.getUsername(), wcf_c));
				sheet.addCell(new Label(1, i + 1, mq.getTrueName(), wcf_c));
				sheet.addCell(new Label(2, i + 1, mq.getIdCard(), wcf_c));
				sheet.addCell(new Label(3, i + 1, mq.getSchool(), wcf_c));
				sheet.addCell(new Label(4, i + 1, mq.getGraduateYear(), wcf_c));
				sheet.addCell(new Label(5, i + 1, mq.getGraduateMonth(), wcf_c));
				sheet.addCell(new Label(6, i + 1, DateUtil.format(mq.getCreateTime(), DateUtil.DEFAULT_FORMAT), wcf_c));
				// 1：待审核，2：重新审核，3：审核通过，4：审核不通过
				sheet.addCell(new Label(7, i + 1, MemberStatus.getName(String.valueOf(mq.getAuditStatus())), wcf_c));
			}
			workbook.write();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean auditRecord(MemberQuery memberQuery, User user) {
		return saveMemberOpLog(memberQuery, user, memberQuery.getOpinion());
	}

	@Override
	public boolean saveEmbassy(MemberQuery memberQuery, User user) {
		// 1、保存大使信息
		memberQuery.setDistEmbaTime(new Date());
		boolean result = memberDao.saveMemberEmbassy(memberQuery);
		// 2、保存操作记录
		if (result) {
			result = saveMemberOpLog(memberQuery, user, "分配校园大使，姓名：" + memberQuery.getEmbassyName());
		}
		// 3、给大使发短信
		memberQuery = memberDao.getMemberById(memberQuery);
		EmbassyQuery embassy = embassyDao.getEmbassyById(memberQuery.getEmbassyId());
		StringBuffer buffer = new StringBuffer("【亲分期】");
		buffer.append(embassy.getTrueName()).append("，现有一位同学需要面签，");
		buffer.append("姓名：").append(memberQuery.getTrueName()).append("，"); // 姓名
		buffer.append("电话：").append(memberQuery.getPhone()).append("，"); // 电话
		buffer.append("寝室：").append(memberQuery.getSchoolBedroom()).append("，"); // 寝室
		buffer.append("请您及时联系!");
		try {
			SMSSender.getInstance().send(embassy.getPhone(), null, new String[] { buffer.toString() });
		} catch (IOException e) {
			logger.error("Send msg to embassy failure!", e);
		}

		return result;
	}

	@Override
	public boolean archive(MemberQuery memberQuery, User user) {
		saveMemberOpLog(memberQuery, user, "归档会员!");
		return memberDao.archive(memberQuery);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qinfenqi.mall.member.service.MemberService#unarchive(com.qinfenqi.mall.member.query.MemberQuery,
	 * com.qinfenqi.mall.system.bean.User)
	 */
	@Override
	public boolean unarchive(MemberQuery memberQuery, User user) {
		saveMemberOpLog(memberQuery, user, "归档解除!");
		return memberDao.unarchive(memberQuery);
	}
}
