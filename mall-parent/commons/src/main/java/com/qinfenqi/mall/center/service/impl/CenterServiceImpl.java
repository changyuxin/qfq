/**
 * 
 */
package com.qinfenqi.mall.center.service.impl;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.apache.commons.beanutils.BeanUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.Embassy;
import com.qinfenqi.mall.bean.IdCard;
import com.qinfenqi.mall.bean.MallSetting;
import com.qinfenqi.mall.bean.Mobile;
import com.qinfenqi.mall.bean.MobileCode;
import com.qinfenqi.mall.bean.ShopAddress;
import com.qinfenqi.mall.bill.dao.BillDao;
import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.center.bean.School;
import com.qinfenqi.mall.center.bean.SchoolProvince;
import com.qinfenqi.mall.center.dao.CenterDao;
import com.qinfenqi.mall.center.service.CenterService;
import com.qinfenqi.mall.common.dao.CommonDao;
import com.qinfenqi.mall.common.helper.IDCardValidator;
import com.qinfenqi.mall.common.helper.MobileOwnerShip;
import com.qinfenqi.mall.common.helper.SMSSender;
import com.qinfenqi.mall.member.bean.Member;
import com.qinfenqi.mall.member.dao.MemberDao;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.order.dao.OrderDao;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.util.MailUtil;
import com.qinfenqi.mall.util.PropertyUtil;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月6日 下午3:09:43
 * @author Deng bingna
 * @version 1.0
 */
@SuppressWarnings("restriction")
@Service("centerService")
public class CenterServiceImpl implements CenterService {

	private Logger logger = LoggerFactory.getLogger(CenterServiceImpl.class);
	@Resource
	private CenterDao centerDao;
	@Resource
	private OrderDao orderDao;
	@Resource
	private BillDao billDao;
	@Resource
	private MemberDao memberDao;
	@Resource
	private CommonDao commonDao;

	public List<ShopAddress> getAddressByUserId(long userId) {

		return centerDao.getAddressByUserId(userId);
	}

	public void deleteAddress(long addressId) {
		centerDao.deleteAddress(addressId);
	}

	public void updateAddress(ShopAddress shopAddress) {
		if (shopAddress.getAddressId() > 0) {
			centerDao.updateAddress(shopAddress);
		} else {
			centerDao.updateAddressToNonDefault(shopAddress);
			centerDao.createAddress(shopAddress);
		}
	}

	public Embassy getEmbassy(User user) {

		Embassy embassy = new Embassy();
		Member member = null;
		// 查询member表，获取基本信息
		member = memberDao.getMemberByUserId(user.getUserId());

		if (null != member) {
			embassy.setCity(member.getCity());
			embassy.setDistrict(member.getDistrict());
			embassy.setIdCard(member.getIdCard());
			embassy.setPhone(member.getPhone());
			embassy.setProvince(member.getProvince());
			embassy.setSchool(member.getSchool());
			embassy.setSchoolZone(member.getSchoolZone());
			embassy.setTrueName(member.getTrueName());
			embassy.setUserId(user.getUserId());
		}

		// 查询embassy表，获取推荐码和理由
		Embassy embassy2 = null;
		embassy2 = centerDao.getEmbassyByUserId(user.getUserId());

		if (null != embassy2) {
			embassy.setRecommendedCode(embassy2.getRecommendedCode());
			embassy.setReason(embassy2.getReason());
			embassy.setEmbassyId(embassy2.getEmbassyId());
		}

		return embassy;
	}

	public void saveEmbassyApply(Embassy embassy) {
		embassy.setCreateTime(new Date());
		if (embassy.getEmbassyId() > 0) {
			centerDao.updateEmbassyApply(embassy);
		} else {
			centerDao.saveEmbassyApply(embassy);
		}

	}

	public void sendMailMessage(String result, String subject, Member member) {
		String toEmail = member.getEmail();
		MailUtil.sendMail(result, toEmail, subject);
	}

	public void updateMemberMail(MemberQuery memberQuery) {
		centerDao.updateMemberMail(memberQuery);
	}

	public void updateMemberMailVc(MemberQuery memberQuery) {
		centerDao.updateMemberMailVc(memberQuery);
	}

	public void updateDefaultAddress(ShopAddress shopAddress) {
		// 将该用户的收货地址变为都不是默认的
		centerDao.updateAddressToNonDefault(shopAddress);
		// 设置默认地址
		centerDao.updateDefaultAddress(shopAddress);
	}

	@Override
	public List<SchoolProvince> getschoolProList() {
		return centerDao.getschoolProList();
	}

	@Override
	public List<School> schoolListByProId(int schoolProId) {
		return centerDao.schoolListByProId(schoolProId);
	}
	
	@Override
	public List<School> searchSchool(School school) {
		return centerDao.searchSchool(school);
	}
	
	
	@Override
	public List<OrderQuery> getOrderListByUserId(OrderQuery orderQuery, User user) {
		orderQuery.setUserId(user.getUserId());
		List<OrderQuery> orderList = orderDao.getOrderList(orderQuery);

		for (OrderQuery order : orderList) {
			List<BillQuery> billQuerys = billDao.getBills(order);
			if(billQuerys.size() > 0){
				order.setBillQuerys(billQuerys);
				int overMonths = 0;
				int remainMonths = 0;
				
//				for (BillQuery bill : billQuerys) {
//					if (bill.getPaymentStatus() == 2) {
//						overMonths++;
//					} else {
//						remainMonths++;
//					}
//				}
//				for (BillQuery bill : billQuerys) {
//					if (bill.getCurrentMonth() == (overMonths + 1)) {
//						bill.setIsCurrPayDate(1);
//					}
//				}
				// 计算最前一期帐单
				cacuFirstBill(billQuerys);
				
				// 计算最后一期帐单
				cacuLastBill(billQuerys);
				
				order.setOverMonths(overMonths);
				order.setRemainMonths(remainMonths);
			}
		}
		return orderList;
	}

	
	
	/**
	 * @param billQuerys
	 */
	private void cacuFirstBill(List<BillQuery> billQuerys) {
		if(billQuerys.size() > 1){
			for (int i = 0; i < billQuerys.size(); i++) {
				BillQuery bill = billQuerys.get(i);
				if(bill.getPaymentStatus() == 2){
					continue;
				} else {
					bill.setIsCurrPayDate(1);
					break;
				}
			}
		} 
	}

	/**
	 * @param billQuerys
	 */
	public void cacuLastBill(List<BillQuery> billQuerys) {
		if(billQuerys.size() > 1){
			for (int i = billQuerys.size() - 1; i >= 0; i--) {
				BillQuery bill = billQuerys.get(i);
				if(bill.getPaymentStatus() == 2){
					continue;
				} else {
					if(isLastBill(bill)){
						bill.setTheLast(1);
					}
					break;
				}
			}
		} 
		if(billQuerys.size() == 1){
			BillQuery bill = billQuerys.get(0);
			if(isLastBill(bill)){
				bill.setTheLast(1);
			}
		}
	}
	
	
	/**
	 * @param bill
	 * @return
	 */
	public boolean isLastBill(BillQuery bill){
		DateTime payDate = new DateTime(bill.getPaymentDate());
		DateTime currDate = DateTime.now();
		long payTime = payDate.getMillis() / 1000;
		long currTime = currDate.getMillis() / 1000;
		return (payTime - currTime) / 86400 >= 30 ? true : false;
	}
	
	
	
	/**
	 * 处理审核状态
	 * 
	 * @param memberQuery
	 */
	private void handleAuditStatus(MemberQuery memberQuery, String filed) {
		MemberQuery mq = memberDao.getMemberById(memberQuery);
		String status;
		try {
			status = BeanUtils.getProperty(mq, filed);
			if ("1".equals(status) || "4".equals(status)) {
				BeanUtils.setProperty(memberQuery, filed, 2);
			}
			if ("3".equals(status)) {
				BeanUtils.setProperty(memberQuery, filed, 3);
			}
			if ("2".equals(status)) {
				BeanUtils.setProperty(memberQuery, filed, 2);
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}

		// 归档数据被编辑后为待审
		if (mq.getAuditStatus() == 99) {
			memberQuery.setAuditStatus(1);
		}
		// 审核不过的数据被编辑后为重审
		if (mq.getAuditStatus() == 4) {
			memberQuery.setAuditStatus(2);
		}
		// 审核通过的数据被编辑后为待审
		if (mq.getAuditStatus() == 3) {
			memberQuery.setAuditStatus(1);
		}
		// 重审状态不改变
		if (mq.getAuditStatus() == 2) {
			memberQuery.setAuditStatus(2);
		}
		// 待审状态不改变
		if (mq.getAuditStatus() == 1) {
			memberQuery.setAuditStatus(1);
		}

	}

	/*
	 * 身份认证
	 */
	@Override
	public void oauthIdInfo(MemberQuery memberQuery) {
		handleAuditStatus(memberQuery, "isIdOauth");
		// 记录申请会员的身份证所在地
		IdCard id = IDCardValidator.validator(memberQuery.getIdCard());
		if (null != id) {
			memberQuery.setIdCardAddress(id.getResult().get("att"));
		}
		centerDao.insertIdOauthInfo(memberQuery);
	}

	/*
	 * 联系方式认证
	 */
	@Override
	public void oauthContactInfo(MemberQuery memberQuery) {
		handleAuditStatus(memberQuery, "isContactOauth");
		if (PropertyUtil.getInt("CHECK_MOBILE", 1) == 1) {
			memberQuery.setFriendPhoneAddress(getPhoneAddress(memberQuery.getFriendPhone()));
		}
		centerDao.insertContactOauthInfo(memberQuery);
	}

	/*
	 * 银行卡认证
	 */
	@Override
	public void oauthBankInfo(MemberQuery memberQuery) {
		handleAuditStatus(memberQuery, "isBkcardOauth");
		if (PropertyUtil.getInt("CHECK_MOBILE", 1) == 1) {
			memberQuery.setBankPhoneAddress(getPhoneAddress(memberQuery.getBankPhone()));
		}
		centerDao.insertBankOauthInfo(memberQuery);
	}

	/**
	 * 
	 * 
	 * @param phone
	 * @return
	 */
	public String getPhoneAddress(String phone) {
		Mobile mobile = null;
		try {
			mobile = MobileOwnerShip.getMobileOwnerShip(phone);
		} catch (Exception e) {
			logger.error("Query mobile address is error! ");
			return "";
		}

		if (null != mobile) {
			Map<String, String> data = mobile.getData();
			return data.get("province") + " " + data.get("city") + " " + data.get("operator");
		} else {
			return "";
		}
	}

	/*
	 * 获取短信验证码
	 */
	@Override
	public boolean createBandMobileCode(MemberQuery memberQuery) {
		String code = "";
		for (int i = 0; i < 4; i++) {
			code += new Random().nextInt(9);
		}
		memberQuery.setCode(Integer.parseInt(code));
		boolean reslt = false;
		
		
		if(PropertyUtil.getInt("SWITCH_SMS", 1) == 1){
			HashMap<String, Object> result = SMSSender.getInstance().send(memberQuery.getBankPhone(), PropertyUtil.get("MSG.TEMPLATE.ID1"),
					code, PropertyUtil.get("MSG.TIME"));
			if ("000000".equals(result.get("statusCode"))) {
				reslt = centerDao.createMobileCode(memberQuery);
			}
		}
		if(PropertyUtil.getInt("SWITCH_SMS", 2) == 2){
			try {
				SMSSender.getInstance().send(memberQuery.getBankPhone(), "SMS_TEMP_8", new String[] {code, PropertyUtil.get("MSG.TIME") });
				reslt = centerDao.createMobileCode(memberQuery);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		return reslt;
	}

	/*
	 * 获取数据库验证码
	 */
	@Override
	public MobileCode getValidCode(MemberQuery memberQuery) {
		List<MobileCode> result = centerDao.getValidCode(memberQuery);
		if (result.size() > 0) {
			return result.get(0);
		}
		return new MobileCode();
	}

	/**
	 * 紧急联系人认证
	 */
	@Override
	public int oauthEmergencyContactInfo(MemberQuery memberQuery) {

		int rtn = 0;

		String parentPhone = memberQuery.getParentPhone();
		String motherPhone = memberQuery.getMotherPhone();

		String parentName = memberQuery.getParentName();
		String motherName = memberQuery.getMotherName();

		Pattern pattern = Pattern.compile("[0-9]*");
		Pattern p = Pattern.compile("^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))d{8}$"); // 验证手机号

		if (null == parentPhone || parentPhone.trim().length() == 0) {
			rtn = 1;
		} else {

			Matcher isNum = pattern.matcher(parentPhone);
			Matcher m = p.matcher(parentPhone);

			if (parentPhone.trim().length() > 11 || parentPhone.trim().length() < 11) {
				rtn = 2;
			} else if (!isNum.matches()) {
				rtn = 3;
			} else if (m.matches()) {
				rtn = 4;
			}
		}
		if (null == motherPhone || motherPhone.trim().length() == 0) {
			rtn = 5;
		} else {

			Matcher isNum = pattern.matcher(motherPhone);
			Matcher m = p.matcher(motherPhone);

			if (motherPhone.trim().length() > 11 || motherPhone.trim().length() < 11) {
				rtn = 6;
			} else if (!isNum.matches()) {
				rtn = 7;
			} else if (m.matches()) {
				rtn = 8;
			}
		}

		if (null == parentName || parentName.trim().length() == 0) {
			rtn = 9;
		}

		if (null == motherName || motherName.trim().length() == 0) {
			rtn = 10;
		}

		if (rtn == 0 && null != parentName && null != motherName) {
			if (motherName.trim().equals(parentName.trim())) {
				rtn = 11;
			}
		}
		if (rtn == 0 && null != motherPhone && null != parentPhone) {
			if (motherPhone.trim().equals(parentPhone.trim())) {
				rtn = 12;
			}
		}

		if (rtn == 0) {
			handleAuditStatus(memberQuery, "isEcpOauth");
			if (PropertyUtil.getInt("CHECK_MOBILE", 1) == 1) {
				memberQuery.setParentPhoneAddress(this.getPhoneAddress(memberQuery.getParentPhone()));
				memberQuery.setMotherPhoneAddress(this.getPhoneAddress(memberQuery.getMotherPhone()));
			}
			centerDao.insertEmergencyContactOauthInfo(memberQuery);
		}

		return rtn;
	}

	@Override
	public void uploadIdCardsImg(User user, File[] upload, File[] stuPhotoUpload, File[] supplementUpload, String[] uploadContentType,
			String[] stuPhotoUploadContentType, String[] supplementUploadContentType, String baseHost, String webRootDir) {

		MemberQuery query = new MemberQuery();

		query = memberDao.getMemberByUserId(user.getUserId());

		try {

			// 获取图片等比例压缩的比例数值
			MallSetting setting= commonDao.getMallSetting("IMAGE_RESIZE");
			float resize = 0.5f;
			if (setting != null) {
				resize = Float.parseFloat(setting.getParamValue());
			}
			uploadImgs(upload, uploadContentType, user.getUserId(), query, baseHost, webRootDir, resize, 1);
			uploadImgs(stuPhotoUpload, stuPhotoUploadContentType, user.getUserId(), query, baseHost, webRootDir, resize, 2);
			uploadImgs(supplementUpload, supplementUploadContentType, user.getUserId(), query, baseHost, webRootDir, resize, 3);
		} catch (IOException e) {
			e.printStackTrace();
		}
		handleAuditStatus(query, "isCardOauth");
		centerDao.insertIdCardsOauth(query);

	}

	/**
	 * @param uploadFile
	 * @param uploadContentTypes
	 * @param userId
	 * @param query
	 * @param resize
	 * @throws IOException
	 */
	private void uploadImgs(File[] upload, String[] uploadContentType, long userId, MemberQuery query, String baseHost, String webRootDir,
			float resize, int flag) throws IOException {

		query.setOthersPhoto("");
		if (null != upload) {
			for (int i = 0; i < upload.length; i++) {
				File uploadFile = upload[i];
				// 图片上传路径
				String imgFilePath = "images/center/oauth/idCards/" + userId + "/";
				String uploadPath = webRootDir + imgFilePath;
				String urlPath = baseHost + imgFilePath;
				String fileName = java.util.UUID.randomUUID().toString(); // 采用时间+UUID的方式随即命名
				fileName += this.getExtandName(uploadContentType[i]);
				File file = new File(uploadPath);
				if (!file.exists()) { // 如果路径不存在，创建
					file.mkdirs();
				}
				File toFile = new File(uploadPath, fileName);

				// 等比例压缩图片
				Image src = ImageIO.read(uploadFile);
				int srcHeight = src.getHeight(null);
				int srcWidth = src.getWidth(null);
				int deskHeight = 0;// 缩略图高
				int deskWidth = 0;// 缩略图宽

				deskHeight = (int) (srcHeight * resize);
				deskWidth = (int) (srcWidth * resize);

				BufferedImage tag = new BufferedImage(deskWidth, deskHeight, BufferedImage.TYPE_3BYTE_BGR);
				tag.getGraphics().drawImage(src, 0, 0, deskWidth, deskHeight, null); // 绘制缩小后的图
				FileOutputStream deskImage = new FileOutputStream(toFile); // 输出到文件流
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(deskImage);
				encoder.encode(tag); // 近JPEG编码
				deskImage.close();

				switch (flag) {
				case 1:
					switch (i) {
					case 0:
						query.setIdCardPhoto(urlPath + fileName);
						break;
					case 1:
						query.setIdCardPhoto(query.getIdCardPhoto() + ";" + urlPath + fileName);
						break;
					case 2:
						query.setStatementPhoto(urlPath + fileName);
						break;
					default:
						break;
					}
					break;
				case 2:
					switch (i) {
					case 0:
						query.setStudentPhoto(urlPath + fileName);
						break;
					case 1:
						query.setStudentPhoto(query.getStudentPhoto() + ";" + urlPath + fileName);
						break;
					default:
						break;
					}
					break;
				case 3:
					query.setOthersPhoto((query.getOthersPhoto() == null || query.getOthersPhoto().length() == 0) ? (urlPath + fileName)
							: (query.getOthersPhoto() + ";" + urlPath + fileName));
					break;
				default:
					break;
				}
			}
		}
	}

	public String getExtandName(String upldContxtType) {
		String expandedName = "";
		if (upldContxtType.equals("image/pjpeg") || upldContxtType.equals("image/jpeg")) {
			// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
			expandedName = ".jpg";
		} else if (upldContxtType.equals("image/png") || upldContxtType.equals("image/x-png")) {
			// IE6上传的png图片的headimageContentType是"image/x-png"
			expandedName = ".png";
		} else if (upldContxtType.equals("image/gif")) {
			expandedName = ".gif";
		} else if (upldContxtType.equals("image/bmp")) {
			expandedName = ".bmp";
		}
		return expandedName;
	}

	public void updateBkflowOauth(MemberQuery memberQuery, File[] uploadFiles, String[] uploadContentType, String baseHost,
			String webRootDir) throws IOException {
		File uploadFile = uploadFiles[0];
		InputStream is = new FileInputStream(uploadFile);
		// 图片上传路径
		String imgFilePath = "images/center/oauth/bkflow/" + memberQuery.getUserId() + "/";
		String uploadPath = webRootDir + imgFilePath;
		String urlPath = baseHost + imgFilePath;
		String fileName = java.util.UUID.randomUUID().toString(); // 采用时间+UUID的方式随即命名
		fileName += this.getExtandName(uploadContentType[0]);
		File file = new File(uploadPath);
		if (!file.exists()) { // 如果路径不存在，创建
			file.mkdirs();
		}
		File toFile = new File(uploadPath, fileName);
		OutputStream os = new FileOutputStream(toFile);
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = is.read(buffer)) > 0) {
			os.write(buffer, 0, length);
		}
		is.close();
		os.close();

		memberQuery.setBkflowPhoto(urlPath + fileName);
		handleAuditStatus(memberQuery, "isBkflowOauth");
		centerDao.insertBkflowOauth(memberQuery);
	}

	public MemberQuery getMemberByMailVc(MemberQuery query) {
		return memberDao.getMemberByMailVc(query);
	}

}
