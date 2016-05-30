/**
 * 
 */
package com.qinfenqi.mall.center.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.Embassy;
import com.qinfenqi.mall.bean.MobileCode;
import com.qinfenqi.mall.bean.ShopAddress;
import com.qinfenqi.mall.center.bean.School;
import com.qinfenqi.mall.center.bean.SchoolProvince;
import com.qinfenqi.mall.member.query.MemberQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月6日 下午3:10:07
 * @author Deng bingna
 * @version 1.0 
 */
@Repository
public interface CenterDao {

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
	 * @param userId
	 * @return
	 */
	Embassy getEmbassyByUserId(long userId);

	/**
	 * @param embassy
	 */
	void saveEmbassyApply(Embassy embassy);

	/**
	 * @param embassy
	 */
	void updateEmbassyApply(Embassy embassy);

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
	 * @param shopAddress
	 */
	void updateAddressToNonDefault(ShopAddress shopAddress);

	/**
	 * @param shopAddress
	 */
	void createAddress(ShopAddress shopAddress);

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
	 * @param memberQuery
	 */
	void insertIdOauthInfo(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 */
	void insertContactOauthInfo(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 */
	void insertBankOauthInfo(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	List<MobileCode> getValidCode(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	boolean createMobileCode(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 */
	void insertEmergencyContactOauthInfo(MemberQuery memberQuery);

		/**
	 * @param query
	 */
	void insertIdCardsOauth(MemberQuery query);

	/**
	 * @param memberQuery
	 */
	void insertBkflowOauth(MemberQuery memberQuery);

	/**
	 * @param school
	 * @return
	 */
	List<School> searchSchool(School school);

}
