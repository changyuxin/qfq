/**
 * 
 */
package com.qinfenqi.mall.center.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.qinfenqi.mall.bean.Embassy;
import com.qinfenqi.mall.bean.MobileCode;
import com.qinfenqi.mall.bean.ShopAddress;
import com.qinfenqi.mall.center.bean.School;
import com.qinfenqi.mall.center.bean.SchoolProvince;
import com.qinfenqi.mall.member.bean.Member;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.system.bean.User;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月6日 下午3:08:49
 * @author Deng bingna
 * @version 1.0
 */
public interface CenterService {

	/**
	 * @param userId
	 * @return
	 */
	List<ShopAddress> getAddressByUserId(long userId);

	/**
	 * @param addressId
	 */
	void deleteAddress(long addressId);

	/**
	 * @param shopAddress
	 */
	void updateAddress(ShopAddress shopAddress);

	/**
	 * @param user
	 * @return
	 */
	Embassy getEmbassy(User user);

	/**
	 * @param embassy
	 */
	void saveEmbassyApply(Embassy embassy);

	/**
	 * @param result
	 * @param subject
	 * @param member
	 */
	void sendMailMessage(String result, String subject, Member member);

	/**
	 * @param member
	 */
	void updateMemberMail(MemberQuery memberQuery);

	/**
	 * @param member
	 */
	void updateMemberMailVc(MemberQuery memberQuery);

	/**
	 * @param shopAddress
	 */
	void updateDefaultAddress(ShopAddress shopAddress);

	/**
	 * @return
	 */
	List<SchoolProvince> getschoolProList();

	/**
	 * @param schoolProId
	 * @return
	 */
	List<School> schoolListByProId(int schoolProId);

	/**
	 * @param orderQuery
	 * @param currentUser
	 * @return
	 */
	List<OrderQuery> getOrderListByUserId(OrderQuery orderQuery, User user);

	/**
	 * @param memberQuery
	 */
	void oauthIdInfo(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 */
	void oauthContactInfo(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	MobileCode getValidCode(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 */
	void oauthBankInfo(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	boolean createBandMobileCode(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	int oauthEmergencyContactInfo(MemberQuery memberQuery);

	void uploadIdCardsImg(User currentUser, File[] uploadFile, File[] stuPhotoUpload, File[] supplementUpload, String[] uploadContentTypes, String[] stuPhotoUploadContentType, String[] supplementUploadContentType, String baseHost, String webRootDir);

	void updateBkflowOauth(MemberQuery memberQuery, File[] upload, String[] uploadContentType, String baseHost, String webRootDir) throws IOException;

	/**
	 * @param query
	 * @return
	 */
	MemberQuery getMemberByMailVc(MemberQuery query);

	/**
	 * @param school
	 * @return
	 */
	List<School> searchSchool(School school);

}
