/**
 * 
 */
package com.qinfenqi.mall.member.service;

import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.qinfenqi.mall.member.bean.Black;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.system.bean.User;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月10日 下午2:37:43
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface MemberService {

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
	boolean auditPass(MemberQuery memberQuery, User user);

	/**
	 * @param memberQuery
	 * @return
	 */
	int getMemberCount(MemberQuery memberQuery);

	/**
	 */
	void updateMemberSpy(MemberQuery memberQuery, User user);

	/**
	 * @param memberQuery
	 * @return
	 * @throws NoSuchAlgorithmException 
	 */
	boolean deleteSpy(MemberQuery memberQuery, User user) throws NoSuchAlgorithmException;

	/**
	 * @param memberQuery
	 * @param currentUser
	 * @return
	 */
	boolean auditNoPass(MemberQuery memberQuery, User user);

	/**
	 * @param memberQuery
	 * @return
	 */
	List<Black> searchBlackList(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @return
	 */
	MemberQuery getMemberById(MemberQuery memberQuery);
	/**
	 * @param idCard
	 * @param userId
	 * @return
	 */
	int getMemberByIdCard(String idCard, long userId);

	/**
	 * @return
	 */
	String getMemberCounts();

	/**
	 * @param memberQuery
	 * @return
	 */
	InputStream exportMembers(MemberQuery memberQuery);

	/**
	 * @param memberQuery
	 * @param user
	 * @return
	 */
	boolean auditRecord(MemberQuery memberQuery, User user);

	/**
	 * @param memberQuery
	 * @param user
	 * @return
	 */
	boolean saveEmbassy(MemberQuery memberQuery, User user);

	/**
	 * @param memberQuery
	 * @param user
	 * @return
	 */
	boolean archive(MemberQuery memberQuery, User user);

	/**
	 * @param memberQuery
	 * @param user
	 * @return
	 */
	boolean unarchive(MemberQuery memberQuery, User user);
}
