package com.qinfenqi.mall.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.bean.MobileCode;
import com.qinfenqi.mall.member.bean.Member;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.query.UserQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 下午2:40:59
 * @author Chang Yuxin
 * @version 1.0 
 */
@Repository
public interface UserDao {

	/**
	 * @param userName
	 * @return
	 */
	List<User> getUserByUserName(String userName);

	/**
	 * @param user
	 */
	void updateUser(User user);

	/**
	 * @param user
	 * @return
	 */
	boolean createMobileCode(UserQuery user);

	/**
	 * @param user
	 * @return
	 */
	List<MobileCode> queryMobileCode(UserQuery user);

	/**
	 * @param user
	 * @return
	 */
	boolean createUser(UserQuery user);
	

	/**
	 * @param userQuery
	 * @return
	 */
	boolean modifyUser(UserQuery userQuery);
	
	/**
	 * @param user
	 */
	void updateUserPassword(User user);

	/**
	 * @param member
	 * @return
	 */
	boolean createMember(Member member);

	/**
	 * @param user
	 */
	void updateUserPasswordByPhone(UserQuery user);

	/**
	 * @param user
	 */
	void updateMemberPhoneByUserId(User user);

	/**
	 * @param userQuery
	 * @return
	 */
	List<AuthCode> getCodeListByMobile(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	List<UserQuery> getUserList(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	int getUserCount(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	UserQuery getUserByUserId(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	boolean deleteUser(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	boolean enableUser(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	List<UserQuery> getAllUserList(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	int getAllUserCount(UserQuery userQuery);

	/**
	 * @return
	 */
	List<Count> getAllUserCounts();

	/**
	 * @param userQuery
	 * @return
	 */
	boolean deleteActualUser(UserQuery userQuery);

}
