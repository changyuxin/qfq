/**
 * 
 */
package com.qinfenqi.mall.view.center;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.joda.time.DateTime;

import com.qinfenqi.mall.bean.Embassy;
import com.qinfenqi.mall.bean.IdCard;
import com.qinfenqi.mall.bean.MobileCode;
import com.qinfenqi.mall.bean.ShopAddress;
import com.qinfenqi.mall.bill.query.BillQuery;
import com.qinfenqi.mall.bill.service.BillService;
import com.qinfenqi.mall.center.bean.School;
import com.qinfenqi.mall.center.bean.SchoolProvince;
import com.qinfenqi.mall.center.service.CenterService;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.collar.service.CollarService;
import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.common.helper.IDCardValidator;
import com.qinfenqi.mall.manage.bean.CouponRecord;
import com.qinfenqi.mall.manage.service.CouponService;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.member.service.MemberService;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.order.service.OrderService;
import com.qinfenqi.mall.product.service.ProductService;
import com.qinfenqi.mall.product.bean.Comment;
import com.qinfenqi.mall.product.service.CommentService;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.system.service.UserService;
import com.qinfenqi.mall.util.CreateImageCode;
import com.qinfenqi.mall.util.MD5Util;

import com.qinfenqi.mall.util.ValidateCode;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月3日 下午3:16:40
 * @author Chang Yuxin
 * @version 1.0
 */

@Action(results = { @Result(name = "success", location = "credit.html", type = "redirect") })
public class CenterAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = -4030242889111058457L;
	
	@Resource
	private ProductService productService;
	@Resource
	private UserService userService;
	@Resource
	private CenterService centerService;
	@Resource
	private OrderService orderService;
	@Resource
	private BillService billService;
	@Resource
	private MemberService memberService;
	@Resource
	private CollarService collarService;
	@Resource
	private CouponService couponService;
	@Resource
	private CommentService commentService;

	private static final String VALIDATE_CODE_KEY = "validateCode";

	/** 用户实体 */
	private User user = new User();
	/** 旧密码 */
	private String oldPassword;
	/** 新密码 */
	private String passWord;
	
	
	private List<User> userList = new ArrayList<User>();
	/** 收货地址列表 */
	private List<ShopAddress> addressList = new ArrayList<ShopAddress>();
	/** 收货地址ID */
	private long addressId;
	/** 收货地址实体 */
	private ShopAddress shopAddress = new ShopAddress();
	/** 申请成为大使实体 */
	private Embassy embassy = new Embassy();
	/** 会员实体 */
	private MemberQuery memberQuery = new MemberQuery();
	/** 验证码图片 */
	private InputStream inputStream;
	/** 验证码 */
	private String validateCode;
	private List<OrderQuery> orderList;
	private OrderQuery orderQuery;
	/** 评论 */
	private Comment comment;

	/**
	 * @return the comment
	 */
	public Comment getComment() {
		return comment;
	}

	/**
	 * @param comment the comment to set
	 */
	public void setComment(Comment comment) {
		this.comment = comment;
	}

	private List<School> schoolList;
	private List<SchoolProvince> schoolProList;
	private School school;
	private BillQuery billQuery;
	private int phoneValidateCode;
	private String phone;
	private int status;
	
	private String oauthType;
	private String validCode;
	private int errorCode;
	
	// 优惠券
	private CouponRecord couponRecord = new CouponRecord();
	private List<CouponRecord> couponRecords = new ArrayList<CouponRecord>();
	
	private CollarQuery collarQuery;

	public File[] stuPhotoUpload; // 学生证件文件
	public String[] stuPhotoUploadContentType; // 学生证件文件类型
	public String[] stuPhotoUploadFileName; // 学生证件文件名

	public File[] supplementUpload; // 补充材料文件
	public String[] supplementUploadContentType; // 补充材料文件类型
	public String[] supplementUploadFileName; // 补充材料文件名
	public List<String> othersPhotoList;

	/**
	 * 个人中心
	 * 
	 * @return
	 */
	public String home() {
		if (getUserStyle() == 1) {
			memberQuery = memberService.getMemberByUserId(getUserId());
		} else {
			collarQuery = collarService.getCollarByUserId(getUserId());
		}
		return "index";
	}

	/**
	 * 帐单
	 * 
	 * @return
	 */
	public String bill() {
		orderQuery = new OrderQuery();
		orderList = centerService.getOrderListByUserId(orderQuery, getCurrentUser());
		return "bill";
	}

	public String billpayPage() {
		billQuery = billService.getBillById(billQuery);
		return "billpay";
	}

	/**
	 * 优惠券
	 * 
	 * @return
	 */
	public String coupon() {
		couponRecords = couponService.getCouponRecordList(couponRecord);
		return "coupon";
	}
 
	/**
	 * 订单
	 * 
	 * @return
	 */
	public String order() {
		orderQuery = new OrderQuery();
		orderQuery.setUserId(getCurrentUser().getUserId());
		orderList = orderService.getOrderList(orderQuery);
		return "order";
	}
	
	/**
	 * 已买到的商品
	 * 
	 * @return
	 */
	public String bought() {
		orderQuery = new OrderQuery();
		orderQuery.setUserId(getCurrentUser().getUserId());
		orderList = orderService.getOrderList(orderQuery);
		return "bought";
	}

	/**
	 * 查看订单详情
	 * 
	 * @return
	 */
	public String orderDetail() {
		orderQuery = orderService.getOrderById(orderQuery);
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "orderDetail";
	}

	/**
	 * 信用
	 * 
	 * @return
	 */
	public String credit() {
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "credit";
	}

	/**
	 * 基础身份认证
	 * 
	 * @return
	 */
	public String baseOauthPage() {
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "baseOauth";
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
	 * 根据省查询高校
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

	/**
	 * 联系方式认证
	 * 
	 * @return
	 */
	public String contactOauthPage() {
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "contactOauth";
	}

	/**
	 * 银行卡认证
	 * 
	 * @return
	 */
	public String bkcardOauthPage() {
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "bkcardOauth";
	}

	/**
	 * 提升信用额度1
	 * 
	 * @return
	 */
	public String ecpOauthPage() {
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "ecpOauth";
	}

	/**
	 * 提升额度认证1页面-紧急联系方式
	 * 
	 * @return
	 */
	public String upgradeOauthPage1() {
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "upgradeOauthPage1";
	}

	/**
	 * 证件照认证
	 * 
	 * @return
	 */
	public String idCardOauth() {
		memberQuery = memberService.getMemberByUserId(getUserId());
		othersPhotoList = new ArrayList<String>();
		if (null != memberQuery) {
			if (null != memberQuery.getOthersPhoto() && memberQuery.getOthersPhoto().length() > 0) {
				String othersPhotos[] = memberQuery.getOthersPhoto().split(";");
				for (String str : othersPhotos) {
					othersPhotoList.add(str);
				}

			}
		}

		return "idCardOauth";
	}

	public String uploadIdCardsImg() {

		if (null == upload || upload.length < 3 || null == stuPhotoUpload || stuPhotoUpload.length < 1) {

		} else {
			try {
				centerService.uploadIdCardsImg(getCurrentUser(), upload, stuPhotoUpload, supplementUpload, uploadContentType,
						stuPhotoUploadContentType, supplementUploadContentType, getBaseHost(), getWebRootDir());
			} catch (Exception e) {
				e.printStackTrace();
				errorCode = -1;
				return "exception";
			}
		}

		return "success";
	}

	/**
	 * 帐号
	 * 
	 * @return
	 */
	public String account() {

		// 获取会员的手机号 和 邮箱
		// 查询member表，获取基本信息
		if (getUserStyle() == 1) {
			memberQuery = memberService.getMemberByUserId(getUserId());
		}
		if (getUserStyle() == 2) {
			collarQuery = collarService.getCollarByUserId(getUserId());
		}
		return "account";
	}

	/**
	 * 获取验证码
	 * 
	 * @return
	 */
	public String getValidateCode() {
		String validateCode = ValidateCode.getValidateCode();
		session.put(VALIDATE_CODE_KEY, validateCode.toLowerCase());
		inputStream = CreateImageCode.getImageAsInputStream(validateCode);
		return "picDisplay";
	}

	/**
	 * 验证页面输入的验证码是否正确
	 * 
	 * @param validateCode
	 * @return
	 */
	public boolean validatecheck(String validateCode) {
		boolean flag = false;
		if (validateCode == null || validateCode.length() == 0)
			return flag;
		if (session.get(VALIDATE_CODE_KEY).equals(validateCode.toLowerCase())) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 跳转到手机账号认证页面
	 * 
	 * @return
	 */
	public String modifyPhone() {

		// 查询member表，获取基本信息
		memberQuery = memberService.getMemberByUserId(getUserId());

		return "modifyPhone";
	}

	/**
	 * 跳转到手机认证-设置新的手机号码页面
	 * 
	 * @return
	 */
	public String getNewPhoneSettingJsp() {

		return "getNewPhoneSettingJsp";
	}

	/**
	 * 验证图片验证码是否输入正确
	 * 
	 * @return
	 */
	public String checkValidateCode() {

		JSONObject json = new JSONObject();
		json.put("codeError", 0);

		if (!this.validatecheck(validateCode)) {
			json.put("codeError", -1);
		}

		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 手机认证-更新新的手机号码
	 */
	public void setNewPhoneByUserId() {
		int rtn = 0;
		user = getCurrentUser();
		rtn = userService.setNewPhoneByUserId(phone, phoneValidateCode, user);
		ajaxResponse(rtn + "");

	}

	/**
	 * 手机认证-跳转到手机认证完成页面
	 * 
	 * @return
	 */
	public String setNewPhonefinishJsp() {
		return "setNewPhonefinishJsp";
	}

	/**
	 * 生成手机验证码
	 * 
	 * @return
	 */
	public String getPhoneValidateCode() {

		JSONObject json = new JSONObject();
		json.put("codeError", 0);

		if (!this.validatecheck(validateCode)) {
			json.put("codeError", -1);
			ajaxReturnValue = json.toString();
		} else {

			// 生成手机验证码并保存
			UserQuery userQuery = new UserQuery();
			userQuery.setUserName(memberQuery.getPhone());

			boolean result = userService.createMobileCode(userQuery);

			json.put("result", result ? SUCCESS : FAILURE);
			ajaxReturnValue = json.toString();
		}

		return AJAX;
	}

	/**
	 * 跳转到绑定邮箱页面
	 * 
	 * @return
	 */
	public String bindMail() {
		return "bindMail";
	}

	/**
	 * 发送邮箱绑定的链接
	 * 
	 * @throws Exception
	 */
	public void sendValidateMail() throws Exception {
		String validateCode1 = validateCode;
		boolean flag = true;
		JSONObject json = new JSONObject();
		if (!this.validatecheck(validateCode1)) {
			json.put("code", "1");
			flag = false;
		}
		userList = userService.getUserByUserName(user.getUserName());
		if (null == userList && userList.size() == 0) {
			json.put("code", "2");
			flag = false;
		}
		if (flag) {
			String validateCode2 = MD5Util.encodeString(ValidateCode.getValidateCode());
			StringBuffer buffer = new StringBuffer();
			String url = this.getBasePath() + "center/center!updateMemberMail.do?memberQuery.email=" + memberQuery.getEmail()
					+ "&memberQuery.emailVc=" + URLEncoder.encode(validateCode2, "UTF-8");
			buffer.append("hi dear!<br/>");
			buffer.append("亲分期绑定邮箱确认邮件，请点击以下链接,可以绑定邮箱:<a href='");
			buffer.append(url);
			buffer.append("' target='_blank'> 点击验证</a><br>如无法点击，请将链接拷贝到浏览器地址栏中直接访问：<br/>");
			buffer.append(url);
			buffer.append("<br/> 如果您电脑上安装了多个浏览器，请您将上面的链接地址复制到您已经登陆的浏览器中访问即可完成绑定!");
			buffer.append("<br/> 如有问题请联系同站中的在线客服!");
			String subject = "亲分期 - 绑定邮箱确认邮件";
			centerService.sendMailMessage(buffer.toString(), subject, memberQuery);
			memberQuery.setUserId(getCurrentUser().getUserId());
			memberQuery.setIsEmailOauth(1);
			memberQuery.setEmailVc(validateCode2);

			centerService.updateMemberMail(memberQuery);

			json.put("code", "0");
			json.put("message", memberQuery.getEmail());
		}

		ajaxResponse(json.toString());
	}

	/**
	 * 点击邮箱绑定链接，更新邮箱绑定状态
	 */
	public String updateMemberMail() {

		status = 0;
		// 更新
		try {
			if (checkIsEmailOauth(memberQuery)) {
				status = 1;
				return "updateMemberMailStatus";
			}
			memberQuery.setEmailVc("");
			memberQuery.setIsEmailOauth(2);
			centerService.updateMemberMailVc(memberQuery);
		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}

		return "updateMemberMailStatus";
	}

	/**
	 * @param memberQuery2
	 * @return
	 */
	private boolean checkIsEmailOauth(MemberQuery query) {
		memberQuery = centerService.getMemberByMailVc(query);
		if (memberQuery.getIsEmailOauth() != 1) {
			return true;
		}
		return false;
	}

	/**
	 * 跳转到密码找回页面
	 * 
	 * @return
	 */
	public String findPwd() {

		// 查询member表，获取基本信息
		memberQuery = memberService.getMemberByUserId(getUserId());

		return "findPwd";
	}

	/**
	 * 密码
	 * 
	 * @return
	 */
	public String password() {

		return "password";
	}

	/**
	 * 保存修改后的密码
	 */
	public void updatePass() {

		int rtn = 0;

		user = getCurrentUser();

		if (null != oldPassword && oldPassword.trim().length() > 0) {

			userList = userService.getUserByUserName(user.getUserName());
			if (null == userList && userList.size() == 0) {
				rtn = -2;// 用户不存在
			}

			if (rtn == 0) {
				User user2 = userList.get(0);
				if (user2.getPassword().equals(oldPassword.trim()) == false) {
					rtn = -1;// 旧密码不正确
				}
			}
		}

		if (rtn == 0) {
			// 更新密码
			user.setPassword(passWord.trim());

			if (user != null) {
				rtn = userService.updateUserPassword(user);
				if (rtn < 0) {
					rtn = -3; // 更新密码出错
				}
			}
		}

		ajaxResponse(rtn + "");

	}

	/**
	 * 地址
	 * 
	 * @return
	 */
	public String address() {

		// 获取地址列表
		addressList = centerService.getAddressByUserId(getCurrentUser().getUserId());

		return "address";
	}

	/**
	 * 删除收货地址
	 * 
	 * @param addressId
	 */
	public void deleteAddress() {

		int rtn = 0;

		try {
			centerService.deleteAddress(addressId);
		} catch (Exception e) {
			e.printStackTrace();
			rtn = -1;
		}

		ajaxResponse(rtn + "");
	}

	/**
	 * 更新收货地址
	 */
	public void updateAddress() {

		int rtn = 0;

		try {
			shopAddress.setUserId(getCurrentUser().getUserId());
			centerService.updateAddress(shopAddress);
		} catch (Exception e) {
			e.printStackTrace();
			rtn = -1;
		}

		ajaxResponse(rtn + "");

	}

	/**
	 * 设置为默认收货地址
	 */
	public void setDefault() {

		int rtn = 0;

		try {
			shopAddress.setUserId(getCurrentUser().getUserId());
			centerService.updateDefaultAddress(shopAddress);
		} catch (Exception e) {
			e.printStackTrace();
			rtn = -1;
		}

		ajaxResponse(rtn + "");
	}

	/**
	 * 大使
	 * 
	 * @return
	 */
	public String embassy() {

		embassy = centerService.getEmbassy(getCurrentUser());
		// 查询member表，获取基本信息
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "embassy";
	}

	/**
	 * 保存申请大使的资料
	 */
	public void saveEmbassyApply() {

		int rtn = 0;

		try {
			centerService.saveEmbassyApply(embassy);
		} catch (Exception e) {
			e.printStackTrace();
			rtn = -1;
		}

		ajaxResponse(rtn + "");
	}

	/**
	 * 验证用户基本信息
	 * 
	 * 
	 */
	public void oauthIdInfo() {
		int rtn = 0;
		try {
			// 学籍身份验证
			if ("1".equals(oauthType)) {
				IdCard id = IDCardValidator.validator(memberQuery.getIdCard());
				// 验证身份证信息
				if ("1".equals(id.getSuccess())) {
					// 验证身份证是否重复
					if (checkIDCardIsExist(memberQuery.getIdCard(), getCurrentUser())) {
						centerService.oauthIdInfo(memberQuery);
					} else {
						// 身份证重复
						rtn = 3;
					}
				} else {
					// 身份证输入信息不正确
					rtn = 1;
				}
				// 联系方式验证
			} else if ("2".equals(oauthType)) {
				centerService.oauthContactInfo(memberQuery);
				// 银行卡号验证
			} else if ("3".equals(oauthType)) {
				MobileCode mobileCode = centerService.getValidCode(memberQuery);
				IdCard id = IDCardValidator.validator(memberQuery.getBankCustomerCard());
				if ("1".equals(id.getSuccess()) && validCode.equals(String.valueOf(mobileCode.getCode()))) {

					MemberQuery query = memberService.getMemberByUserId(getUserId());

					if (query.getIdCard().equals(memberQuery.getBankCustomerCard())) {
						centerService.oauthBankInfo(memberQuery);
					} else {
						// 身份证与id_card不一致
						rtn = 4;
					}

				} else if (!"1".equals(id.getSuccess()) && validCode.equals(String.valueOf(mobileCode.getCode()))) {
					// 身份证输入信息不正确
					rtn = 1;
				} else {
					// 验证码输入信息不正确
					rtn = 2;
				}
				// 提升额度认证1-紧急联系方式
			} else if ("4".equals(oauthType)) {
				rtn = centerService.oauthEmergencyContactInfo(memberQuery);
			}
		} catch (Exception e) {
			e.printStackTrace();
			rtn = -1;
		}

		ajaxResponse(rtn + "");
	}

	/**
	 * 验证身份证信息是否已经被用过
	 * 
	 * @param idCard
	 * @param user2
	 * @return
	 */
	private boolean checkIDCardIsExist(String idCard, User user2) {

		int num = memberService.getMemberByIdCard(idCard, user2.getUserId());

		if (num > 0) {
			return false;
		}

		return true;
	}

	// 身份证验证
	public void idCardValid() {
		String rtn = "1";
		try {
			IdCard id = IDCardValidator.validator(memberQuery.getIdCard());
			rtn = id.getSuccess();
		} catch (Exception e) {
			e.printStackTrace();
			rtn = "-1";
		}
		ajaxResponse(rtn + "");
	}

	/**
	 * 生成短信验证码
	 * 
	 * @return String
	 */
	public String getBandMobileCode() {
		JSONObject json = new JSONObject();
		boolean result = centerService.createBandMobileCode(memberQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	public void validCode() {
		String rtn = "1";
		try {
			MobileCode mobileCode = centerService.getValidCode(memberQuery);
			if (!validCode.equals(String.valueOf(mobileCode.getCode()))) {
				rtn = "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			rtn = "-1";
		}
		ajaxResponse(rtn + "");
	}

	public String bkflowOauthPage() {

		memberQuery = memberService.getMemberByUserId(getUserId());

		return "bkflowOauthPage";
	}

	public String updateBkflowOauth() {
		try {
			if (null == upload || upload.length < 1) {
				errorCode = -1;
				return bkflowOauthPage();
			} else {
				memberQuery.setUserId(getCurrentUser().getUserId());
				centerService.updateBkflowOauth(memberQuery, upload, uploadContentType, getBaseHost(), getWebRootDir());
			}

		} catch (Exception e) {
			e.printStackTrace();
			errorCode = -1;
			return bkflowOauthPage();
		}
		return "success";
	}

	/*
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the oldPassword
	 */
	public String getOldPassword() {
		return oldPassword;
	}

	/**
	 * @param oldPassword
	 *            the oldPassword to set
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	/**
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}

	/**
	 * @param passWord
	 *            the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	/**
	 * @return the userList
	 */
	public List<User> getUserList() {
		return userList;
	}

	/**
	 * @param userList
	 *            the userList to set
	 */
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	/**
	 * @return the addressList
	 */
	public List<ShopAddress> getAddressList() {
		return addressList;
	}

	/**
	 * @param addressList
	 *            the addressList to set
	 */
	public void setAddressList(List<ShopAddress> addressList) {
		this.addressList = addressList;
	}

	/**
	 * @return the addressId
	 */
	public long getAddressId() {
		return addressId;
	}

	/**
	 * @param addressId
	 *            the addressId to set
	 */
	public void setAddressId(long addressId) {
		this.addressId = addressId;
	}

	/**
	 * @return the shopAddress
	 */
	public ShopAddress getShopAddress() {
		return shopAddress;
	}

	/**
	 * @param shopAddress
	 *            the shopAddress to set
	 */
	public void setShopAddress(ShopAddress shopAddress) {
		this.shopAddress = shopAddress;
	}

	/**
	 * @return the embassy
	 */
	public Embassy getEmbassy() {
		return embassy;
	}

	/**
	 * @param embassy
	 *            the embassy to set
	 */
	public void setEmbassy(Embassy embassy) {
		this.embassy = embassy;
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
	 * @return the inputStream
	 */
	public InputStream getInputStream() {
		return inputStream;
	}

	/**
	 * @param inputStream
	 *            the inputStream to set
	 */
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	/**
	 * @param validateCode
	 *            the validateCode to set
	 */
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	/**
	 * @return the orderList
	 */
	public List<OrderQuery> getOrderList() {
		return orderList;
	}

	/**
	 * @param orderList
	 *            the orderList to set
	 */
	public void setOrderList(List<OrderQuery> orderList) {
		this.orderList = orderList;
	}

	/**
	 * @return the orderQuery
	 */
	public OrderQuery getOrderQuery() {
		return orderQuery;
	}

	/**
	 * @param orderQuery
	 *            the orderQuery to set
	 */
	public void setOrderQuery(OrderQuery orderQuery) {
		this.orderQuery = orderQuery;
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
	 * @return the billQuery
	 */
	public BillQuery getBillQuery() {
		return billQuery;
	}

	/**
	 * @param billQuery
	 *            the billQuery to set
	 */
	public void setBillQuery(BillQuery billQuery) {
		this.billQuery = billQuery;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * @return the oauthType
	 */
	public String getOauthType() {
		return oauthType;
	}

	/**
	 * @param oauthType
	 *            the oauthType to set
	 */
	public void setOauthType(String oauthType) {
		this.oauthType = oauthType;
	}

	/**
	 * @param phoneValidateCode
	 *            the phoneValidateCode to set
	 */
	public void setPhoneValidateCode(int phoneValidateCode) {
		this.phoneValidateCode = phoneValidateCode;
	}

	/**
	 * @return the validCode
	 */
	public String getValidCode() {
		return validCode;
	}

	/**
	 * @param validCode
	 *            the validCode to set
	 */
	public void setValidCode(String validCode) {
		this.validCode = validCode;
	}

	/**
	 * @return the errorCode
	 */
	public int getErrorCode() {
		return errorCode;
	}

	/**
	 * @param errorCode
	 *            the errorCode to set
	 */
	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
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
	 * @return the stuPhotoUpload
	 */
	public File[] getStuPhotoUpload() {
		return stuPhotoUpload;
	}

	/**
	 * @param stuPhotoUpload
	 *            the stuPhotoUpload to set
	 */
	public void setStuPhotoUpload(File[] stuPhotoUpload) {
		this.stuPhotoUpload = stuPhotoUpload;
	}

	/**
	 * @return the stuPhotoUploadContentType
	 */
	public String[] getStuPhotoUploadContentType() {
		return stuPhotoUploadContentType;
	}

	/**
	 * @param stuPhotoUploadContentType
	 *            the stuPhotoUploadContentType to set
	 */
	public void setStuPhotoUploadContentType(String[] stuPhotoUploadContentType) {
		this.stuPhotoUploadContentType = stuPhotoUploadContentType;
	}

	/**
	 * @return the stuPhotoUploadFileName
	 */
	public String[] getStuPhotoUploadFileName() {
		return stuPhotoUploadFileName;
	}

	/**
	 * @param stuPhotoUploadFileName
	 *            the stuPhotoUploadFileName to set
	 */
	public void setStuPhotoUploadFileName(String[] stuPhotoUploadFileName) {
		this.stuPhotoUploadFileName = stuPhotoUploadFileName;
	}

	/**
	 * @return the supplementUpload
	 */
	public File[] getSupplementUpload() {
		return supplementUpload;
	}

	/**
	 * @param supplementUpload
	 *            the supplementUpload to set
	 */
	public void setSupplementUpload(File[] supplementUpload) {
		this.supplementUpload = supplementUpload;
	}

	/**
	 * @return the supplementUploadContentType
	 */
	public String[] getSupplementUploadContentType() {
		return supplementUploadContentType;
	}

	/**
	 * @param supplementUploadContentType
	 *            the supplementUploadContentType to set
	 */
	public void setSupplementUploadContentType(String[] supplementUploadContentType) {
		this.supplementUploadContentType = supplementUploadContentType;
	}

	/**
	 * @return the supplementUploadFileName
	 */
	public String[] getSupplementUploadFileName() {
		return supplementUploadFileName;
	}

	/**
	 * @param supplementUploadFileName
	 *            the supplementUploadFileName to set
	 */
	public void setSupplementUploadFileName(String[] supplementUploadFileName) {
		this.supplementUploadFileName = supplementUploadFileName;
	}

	/**
	 * @return the othersPhotoList
	 */
	public List<String> getOthersPhotoList() {
		return othersPhotoList;
	}

	/**
	 * @param othersPhotoList
	 *            the othersPhotoList to set
	 */
	public void setOthersPhotoList(List<String> othersPhotoList) {
		this.othersPhotoList = othersPhotoList;
	}

	/**
	 * @return the couponRecord
	 */
	public CouponRecord getCouponRecord() {
		return couponRecord;
	}

	/**
	 * @param couponRecord the couponRecord to set
	 */
	public void setCouponRecord(CouponRecord couponRecord) {
		this.couponRecord = couponRecord;
	}

	/**
	 * @return the couponRecords
	 */
	public List<CouponRecord> getCouponRecords() {
		return couponRecords;
	}

	/**
	 * @param couponRecords the couponRecords to set
	 */
	public void setCouponRecords(List<CouponRecord> couponRecords) {
		this.couponRecords = couponRecords;
	}
	
	/**
	 * 转入商品评论页
	 * 
	 * @return String
	 */
	public String comment() {
		orderQuery = orderService.getOrderById(orderQuery);
		memberQuery = memberService.getMemberByUserId(getUserId());
		return "comment";
	}
	
	
	/**
	 * 提交商品评论及图片
	 * 
	 * @return String
	 */
	public String uploadCommentImg() throws IOException{
//		commentList = commentService.checkCommentList(comment);
//		if (commentList != null)
//		{
//			return "commentList";
//		}
		if (upload != null)
		{
			if (upload.length>0)
			{
				String coverImgUrl1 = uploadCommentImage(upload[0], uploadContentType[0]);
				comment.setPic1Url(coverImgUrl1);
			}
			if (upload.length>1)
			{
				String coverImgUrl2 = uploadCommentImage(upload[1], uploadContentType[1]);
				comment.setPic2Url(coverImgUrl2);
			}
			if (upload.length>2)
			{
				String coverImgUrl3 = uploadCommentImage(upload[2], uploadContentType[2]);
				comment.setPic3Url(coverImgUrl3);
			}
			if (upload.length>3)
			{
				String coverImgUrl4 = uploadCommentImage(upload[3], uploadContentType[3]);
				comment.setPic4Url(coverImgUrl4);
			}
			if (upload.length>4)
			{
				String coverImgUrl5 = uploadCommentImage(upload[4], uploadContentType[4]);
				comment.setPic5Url(coverImgUrl5);
			}
		}
		String str ="";
		str = comment.getUsername();
		str=str.substring(0,3)+"*"+"*"+"*"+"*"+"*"+str.substring(9,str.length());
		comment.setShowname(str);
		Date date = new Date();
		comment.setCommentDate(date);
		comment.setSatisify(100*(comment.getPriceStar()+comment.getQualityStar()+comment.getServiceStar())/15);
		commentService.addComment(comment);
		return "index";
	}
	/**
	 * @param uploadContentType
	 * @return
	 * @throws IOException
	 */
	private String uploadCommentImage(File uploadFile, String uploadContentType) throws IOException {
		InputStream is = new FileInputStream(uploadFile);
		// 图片上传路径
		DateTime dt = new DateTime();
		String imgFilePath = "/images/comment/" + dt.getYear() + "/" + dt.getMonthOfYear() + "/" + dt.getDayOfMonth()
				+ "/";
		String uploadPath = getWebRootDir() + imgFilePath;
		String fileName = java.util.UUID.randomUUID().toString(); // 采用时间+UUID的方式随即命名
		fileName += this.getExtandName(uploadContentType);
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
		return getBaseHost() + imgFilePath + fileName;
	}

}
