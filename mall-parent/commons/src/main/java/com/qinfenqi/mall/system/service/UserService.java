/**
 * 
 */
package com.qinfenqi.mall.system.service;

import java.util.List;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.query.UserQuery;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 上午11:11:33
 * @author Chang Yuxin
 * @version 1.0 
 */
public interface UserService {

	/**
	 * 
	 * @param userName
	 * @return List<User
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
	boolean checkMobileCode(UserQuery user);

	/**
	 * @param user
	 * @return
	 */
	boolean createUser(UserQuery user);

	/**
	 * @param user
	 * @return
	 */
	int updateUserPassword(User user);

	/**
	 * @param user
	 * @return
	 */
	int updateUserPasswordByPhone(UserQuery user);

	/**
	 * @param phone
	 * @param phoneValidateCode
	 * @param user
	 * @return
	 */
	int setNewPhoneByUserId(String phone, int phoneValidateCode, User user);

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
	boolean addUser(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	UserQuery getUserByUserId(UserQuery userQuery);

	/**
	 * @param userQuery
	 * @return
	 */
	boolean editUser(UserQuery userQuery);

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
	String getAllUserCounts();

	/**
	 * @param userQuery
	 * @param currentUser
	 * @return
	 */
	boolean saveTraceRecord(UserQuery userQuery, User currentUser);

	/**
	 * @param userQuery
	 * @return
	 */
	boolean deleteActualUser(UserQuery userQuery);

}
