/**
 * 
 */
package com.qinfenqi.mall.member.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.member.bean.Black;
import com.qinfenqi.mall.member.bean.MemberCredit;
import com.qinfenqi.mall.member.query.MemberQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月10日 下午2:42:25
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface MemberDao {

	/**
	 * @param userId
	 * @return
	 */
	MemberQuery getMemberByUserId(long userId);

	/**
	 * @param memberQuery
	 * @return
	 */
	List<MemberQuery> getMemberList(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	boolean update(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	MemberQuery getMemberById(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	boolean updateCreditLimit(MemberQuery memberQuery);

	/**
	 * @param query
	 * @return
	 */
	MemberQuery getMemberByMailVc(MemberQuery query);

	/**
	 * @param memberQuery
	 * @return
	 */
	int getMemberCount(MemberQuery memberQuery);

	/**
	 * @param setSupplyPhoto
	 */
	boolean updateMemberSpy(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	boolean updateMemberOauth(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	List<Black> queryBlackList(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	int getMemberByIdCard(MemberQuery memberQuery);

	/**
	 * @param memberQuery 
	 * @return
	 */
	List<Count> getMemberCounts(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	boolean saveMemberEmbassy(MemberQuery memberQuery);

	/**
	 * @param userId
	 * @return
	 */
	boolean deleteMember(long userId);

	/**
	 * @param memberQuery
	 * @return
	 */
	boolean archive(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	boolean unarchive(MemberQuery memberQuery);
	
	/**
	 * @param memberQuery
	 * @return
	 */
	List<MemberCredit> getCreditListMember();
	/**
	 * @param memberQuery
	 * @return
	 */
	List<MemberCredit> getCreditListCollar();
	/**
	 * @param memberCredit
	 * @return
	 */
	boolean updateMemberCredit(MemberCredit memberCredit);
	/**
	 * @param memberCredit
	 * @return
	 */
	boolean updateCollarCredit(MemberCredit memberCredit);
	

}
