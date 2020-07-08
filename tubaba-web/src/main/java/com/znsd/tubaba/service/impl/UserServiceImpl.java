package com.znsd.tubaba.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.entity.UserStatus;
import com.znsd.tubaba.entity.Userrecord;
import com.znsd.tubaba.mapper.UserMapper;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.service.UserrecordService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	@Autowired
	UserrecordService userrecordService;
	
	@Override
	public User userLoginPost(String username, String userpass) {
		// 用户登录实现类
		return userMapper.userLoginPost(username, userpass);
	}

	@Override
	public User findByIphone(String phone) {
		return userMapper.findByIphone(phone);
	}

	//增加用户
	@Override
	@Transactional
	public Integer addUser(User user) {
		String hair = "imgupload/default-photo.gif";
		Integer id = userMapper.addUser(user);
		UserStatus userStatus = new UserStatus();
		userStatus.setRegistertime(new Date());
		userStatus.setUser(user);
		userStatus.setStatus(0);
		userStatus.setHair(hair);
		return userMapper.addUserstatus(userStatus);
	}
	
	@Override
	public UserStatus findByUserid(Integer userId) {
		return userMapper.findByUserid(userId);
	}

	//修改用户详情表中的登陆时间
	@Override
	public Integer updateUserstatusLoginTime(Integer userId) {
		return userMapper.updateUserstatusLoginTime(userId);
	}


	//增加用户详情
	@Override
	public Integer addUserstatus(UserStatus userStatus) {
		return userMapper.addUserstatus(userStatus);
	}
		
	//管理员查询所有用户信息
	@Override
	public List<User> queryUserAll() {
		return userMapper.queryUserAll();
	}

	//管理员查询用户数量
	@Override
	public int countUser() {
		return userMapper.countUser();
	}

	//根据手机修改密码
	@Override
	public Integer inPhoneUpdatePass(String phone, String userpass) {
		return userMapper.inPhoneUpdatePass(phone, userpass);
	}

	//根据邮箱查询用户
	@Override
	public User findByEmail(String email) {
		return userMapper.findByEmail(email);
	}

	//根据邮箱修改用户
	@Override
	public Integer inEmailUpdatePass(String email, String usepass) {
		return userMapper.inEmailUpdatePass(email, usepass);
	}
	
	@Override
	public User findById(Integer id) {
		return userMapper.findById(id);
	}
	
	@Override
	public User queryOneByName(String name) {
		return userMapper.queryOneByName(name);
	}
	//通过id修改用户支付密码
	@Override
	public Integer updateUserPaymentCode(Integer id, Integer paymentCode) {
		return userMapper.updateUserPaymentCode(id, paymentCode);
	}
	//查询用户的支付密码
	@Override
	public Integer findByUserPaymentCode(Integer id) {
		return userMapper.findByUserPaymentCode(id);
	}

	//修改用户账户余额
	@Override
	public Integer updateUserMoney(Integer id, Double money, Integer status) {
		return userMapper.updateUserMoney(id, money, status);
	}

	//判断密码是否正确
	@Override
	public Integer checkUserPass(Integer userId, String userpass) {
		return userMapper.checkUserPass(userId, userpass);
	}

	//修改用户密码
	@Override
	public Integer updateUserPass(Integer userId, String userpass) {
		return userMapper.updateUserPass(userId, userpass);
	}

	//修改用户手机
	@Override
	public Integer updateUserIphone(Integer userId, String iphone) {
		return userMapper.updateUserIphone(userId, iphone);
	}
	
	//修改用户邮箱
	@Override
	public Integer updateUserEmail(String email, Integer userId) {
		return userMapper.updateUserEmail(email,userId);
	}
	
	//修改用户头像
	@Override
	public Integer updateUserstatusHair(String hair,Integer userId) {
		return userMapper.updateUserstatusHair(hair, userId);
	}
	
	//修改用户邮箱找回密码状态吗
	@Override
	public Integer updateUserEmailCode(String emailCode, String email) {
		return userMapper.updateUserEmailCode(emailCode, email);
	}
	
	/**
	 * qxl
	 * 
	 * 用户删除（修改状态）
	 * */
	@Override
	public int deleteUser(Integer type,Integer userId,String logoutWhy) {
		return userMapper.deleteUser(type,userId,logoutWhy);
	}
	
	/**
	 * 用户的模糊查询
	 * */
	@Override
	public List<User> queryUserCondition(Map<String,Object> map){
		return userMapper.queryUserCondition(map);
	}

	@Override
	public Integer checkUserPaymentCode(Integer id, Integer paymentCode) {
		return userMapper.checkUserPaymentCode(id, paymentCode);
	}

	

	@Override
	public Integer updateUser(String userpass, Integer id) {
		return userMapper.updateUser(userpass, id);
	}
	public int editNameExit(int id) {
		// TODO Auto-generated method stub
		return userMapper.editNameExit(id);
	}

	@Override
	public void editUserName(String username,int id) {
		// TODO Auto-generated method stub
		userMapper.editUserName(username,id);
	}

	@Override
	public String userNameExit(String username) {
		// TODO Auto-generated method stub
		return userMapper.userNameExit(username);
	}

	@Override
	public int editUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.editUser(user);
	}

	@Override
	public List<User> allUserId() {
		// TODO Auto-generated method stub
		return userMapper.allUserId();
	}

	@Override
	public int giveCoupon(List<Object> list,Date end) {
		// TODO Auto-generated method stub
		return userMapper.giveCoupon(list,end);
	}
	public boolean updateUserMoney2(Integer userId, Double money,String phone,Integer status) {
		// status == 1 充值 status == 3 提现
		boolean flag = false;
		if(this.updateUserMoney(userId, money, status) > 0) {
			/*StringBuffer buffer = new StringBuffer();
			if(status == 0) {
				buffer.append("充值成功,您本次充值金额为"+money);
			}else if (status == 1) {
				buffer.append("提现成功,您本次提现金额为:"+money+"扣除手术费之后为:"+ (money - (money / 100)));
			}
			if(SendMessage.sendCode(phone, buffer.toString())) {
			}else {
				map.put("result", false);
			}*/
			User user = new User();
			user.setId(userId);
			Userrecord userrecord = new Userrecord();
			userrecord.setUser(user);
			userrecord.setOperation(status);
			userrecord.setOperationTime(new Date());
			userrecord.setMoney(money);
			if(status == 3) {
				userrecord.setPaymentAccount(phone);
				userrecord.setPaymentStatus(1);
			}
			userrecordService.insertUserrecord(userrecord);
			flag =  true;
		}
		return flag;
	}



	@Override
	public int updateMoney(Double price, Integer userId) {
		return userMapper.updateMoney(price, userId);
	}

	@Override
	public int addUserIntegral(Integer userId, Integer integral) {
		int rows = userMapper.addUserIntegral(userId, integral);
		return rows;
	}
}
