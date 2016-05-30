/**
 * 
 */
package com.qinfenqi.mall.system.service.impl;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.bean.AuthCode;
import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.bean.Log;
import com.qinfenqi.mall.bean.MobileCode;
import com.qinfenqi.mall.collar.dao.CollarDao;
import com.qinfenqi.mall.common.base.BaseService;
import com.qinfenqi.mall.common.constant.BizType;
import com.qinfenqi.mall.common.constant.Symbol;
import com.qinfenqi.mall.common.helper.SMSSender;
import com.qinfenqi.mall.common.ip.IPSeeker;
import com.qinfenqi.mall.log.dao.LogDao;
import com.qinfenqi.mall.member.bean.Member;
import com.qinfenqi.mall.member.dao.MemberDao;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.dao.UserDao;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.system.service.UserService;
import com.qinfenqi.mall.util.MD5Util;
import com.qinfenqi.mall.util.PropertyUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 上午11:12:53
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("userService")
public class UserServiceImpl extends BaseService implements UserService {

	@Resource
	private UserDao userDao;
	@Resource
	private LogDao logDao;
	@Resource
	private IPSeeker ipSeeker;
	@Resource
	private MemberDao memberDao;
	@Resource
	private CollarDao collarDao;

	@Override
	public List<User> getUserByUserName(String userName) {
		return userDao.getUserByUserName(userName);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public boolean createMobileCode(UserQuery user) {
		String code = "";
		while (true) {
			int i = new Random().nextInt(9);
			if (i == 0) {
				continue;
			} else {
				code += String.valueOf(i);
			}
			if (code.length() == 6) {
				break;
			}
		}
		user.setCode(Integer.parseInt(code));
		boolean reslt = false;
		
		if(PropertyUtil.getInt("SWITCH_SMS", 1) == 1){
			HashMap<String, Object> result = SMSSender.getInstance().send(user.getUserName(), PropertyUtil.get("MSG.TEMPLATE.ID"), code,
					PropertyUtil.get("MSG.TIME"));
			if ("000000".equals(result.get("statusCode"))) {
				reslt = userDao.createMobileCode(user);
			}
		}
		if(PropertyUtil.getInt("SWITCH_SMS", 2) == 2){
			try {
				SMSSender.getInstance().send(user.getUserName(), "SMS_TEMP_7", new String[] {code, PropertyUtil.get("MSG.TIME") });
				reslt = userDao.createMobileCode(user);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return reslt;
	}

	@Override
	public boolean checkMobileCode(UserQuery user) {
		boolean result = false;
		List<MobileCode> list = userDao.queryMobileCode(user);
		if (list.size() > 0) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean createUser(UserQuery user) {
		user.setUserStyle(1);
		userDao.createUser(user);
		Member member = new Member();
		member.setUserId(user.getUserId());
		member.setPhone(user.getUserName());
		member.setCreateTime(new Date());
		
		// 初始额度
		member.setCreditLimit(6000);
		
		return userDao.createMember(member);
	}

	@Override
	public int updateUserPassword(User user) {
		try {
			userDao.updateUserPassword(user);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	public int updateUserPasswordByPhone(UserQuery user) {
		try {
			userDao.updateUserPasswordByPhone(user);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int setNewPhoneByUserId(String phone, int phoneValidateCode, User user) {

		// -1手机号不能为空
		// -2手机号码位数不正确
		// -3手机号码必须为数字
		// -4手机号码不合法
		// -5手机号码已注册过

		// -6手机验证码验证不通过
		// -7设置新手机号码出错

		int rtn = 0;

		if (null == phone || phone.trim().length() == 0) {
			rtn = -1;
		} else {

			Pattern pattern = Pattern.compile("[0-9]*");
			Matcher isNum = pattern.matcher(phone);

			Pattern p = Pattern.compile("^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))d{8}$"); // 验证手机号
			Matcher m = p.matcher(phone);

			List<User> users = this.getUserByUserName(phone);

			if (phone.trim().length() > 11 || phone.trim().length() < 11) {
				rtn = -2;
			} else if (!isNum.matches()) {
				rtn = -3;
			} else if (m.matches()) {
				rtn = -4;
			} else if (users.size() > 0) {
				rtn = -5;
			}

		}
		if (rtn == 0) {
			UserQuery query = new UserQuery();
			query.setCode(phoneValidateCode);
			query.setUserName(phone);
			boolean result = this.checkMobileCode(query);
			if (!result) {
				rtn = -6;
			}
		}

		if (rtn == 0) {
			try {
				user.setUserName(phone);
				// 更新手机号码
				userDao.updateMemberPhoneByUserId(user);
			} catch (Exception e) {
				e.printStackTrace();
				rtn = -7;
			}
		}

		return rtn;
	}

	/**
	 * 根据手机号和授权码获取数据记录
	 */
	@Override
	public List<AuthCode> getCodeListByMobile(UserQuery userQuery) {
		return userDao.getCodeListByMobile(userQuery);
	}

	@Override
	public List<UserQuery> getUserList(UserQuery userQuery) {
		return userDao.getUserList(userQuery);
	}

	@Override
	public int getUserCount(UserQuery userQuery) {
		return userDao.getUserCount(userQuery);
	}

	@Override
	public boolean addUser(UserQuery userQuery) {
		try {
			userQuery.setPassword(MD5Util.encodeString(userQuery.getPassword()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return userDao.createUser(userQuery);
	}

	@Override
	public UserQuery getUserByUserId(UserQuery userQuery) {
		userQuery = userDao.getUserByUserId(userQuery);
		dealUserIpInfo(userQuery);
		return userQuery;
	}

	@Override
	public boolean editUser(UserQuery userQuery) {
		return userDao.modifyUser(userQuery);
	}

	@Override
	public boolean deleteUser(UserQuery userQuery) {
		return userDao.deleteUser(userQuery);
	}

	@Override
	public boolean deleteActualUser(UserQuery userQuery) {
		boolean result = userDao.deleteActualUser(userQuery);
		// 删除大学生会员
		if (userQuery.getUserStyle() == 1 && result) {
			result = memberDao.deleteMember(userQuery.getUserId());
		}
		// 删除白领会员
		if (userQuery.getUserStyle() == 2 && result) {
			result = collarDao.deleteCollar(userQuery.getUserId());
		}
		return result;
	}

	@Override
	public boolean enableUser(UserQuery userQuery) {
		return userDao.enableUser(userQuery);
	}

	@Override
	public List<UserQuery> getAllUserList(UserQuery userQuery) {
		List<UserQuery> list = userDao.getAllUserList(userQuery);
		for (UserQuery user : list) {
			dealUserIpInfo(user);
		}
		return list;
	}

	/**
	 * 处理用户的IP信息
	 * 
	 * @param user
	 */
	public void dealUserIpInfo(UserQuery user) {
		String currentLoginIp = user.getCurrentLoginIp();
		String lastLoginIp = user.getLastLoginIp();
		String registIp = user.getRegisterIp();
		// 当前IP所在地
		if (null != currentLoginIp && !"".equals(currentLoginIp)) {
			user.setCurrentIpArea(ipSeeker.getCountry(currentLoginIp) + Symbol.COLON + ipSeeker.getArea(currentLoginIp));
		}
		// 上次IP所在地
		if (null != lastLoginIp && !"".equals(lastLoginIp)) {
			user.setLastIpArea(ipSeeker.getCountry(lastLoginIp) + Symbol.COLON + ipSeeker.getArea(lastLoginIp));
		}
		// 注册IP所在地
		if (null != registIp && !"".equals(registIp)) {
			user.setRegistIpArea(ipSeeker.getCountry(registIp) + Symbol.COLON + ipSeeker.getArea(registIp));
		}
	}

	@Override
	public int getAllUserCount(UserQuery userQuery) {
		return userDao.getAllUserCount(userQuery);
	}

	@Override
	public String getAllUserCounts() {
		List<Count> list = userDao.getAllUserCounts();
		String[] status = { "1", "2" };
		return convertCountResult(status, list);
	}

	@Override
	public boolean saveTraceRecord(UserQuery userQuery, User user) {
		return saveUserOpLog(userQuery, user, userQuery.getRecord());
	}

	/**
	 * 保存操作记录
	 * 
	 * @param orderQuery
	 * @param user
	 * @param logDesc
	 */
	private boolean saveUserOpLog(UserQuery userQuery, User user, String logDesc) {
		Log log = new Log();
		log.setBizType(BizType.USER.getId());
		log.setBizId(userQuery.getUserId());
		log.setUserId(user.getUserId());
		log.setUserName(user.getUserName());
		log.setCreateTime(new Date());
		log.setDescription(logDesc);
		return logDao.createLog(log);
	}
}
