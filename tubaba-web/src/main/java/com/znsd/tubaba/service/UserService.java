package com.znsd.tubaba.service;

import java.util.Date;
import java.util.List;
import java.util.Map;


import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.entity.UserStatus;

public interface UserService {
	//用户登录
	public User userLoginPost(String username,String userpass);
	//判断手机号
	public User findByIphone(String phone);
	//修改用户密码
	public Integer updateUserPass(Integer userId,String userpass);
	//判断密码是否正确
	public Integer checkUserPass(Integer userId,String userpass);
	//判断邮箱
	public User findByEmail(String email);
	//修改用户邮箱
	public Integer updateUserEmail(String email,Integer userId);
	//查询所有用户
	public User findById(Integer id);
	//查询所有用户
	public List<User> queryUserAll();
	//管理员通过id修改重置用户密码
	public Integer updateUser(String userpass,Integer id);
	//查询用户数量
	public int countUser();
	//增加用户
	public Integer addUser(User user);
	//增加用户详情
	public Integer addUserstatus(UserStatus userStatus);
	//通过用户id查询用户详情表的数据
	public UserStatus findByUserid(Integer userId);
	//修改用户详情表中的登陆时间
	public Integer updateUserstatusLoginTime(Integer userId);
	//修改用户头像
	public Integer updateUserstatusHair(String hair,Integer userId);
	//查询用户的支付密码
	public Integer findByUserPaymentCode(Integer id);
	//根据手机修改密码
	public Integer inPhoneUpdatePass(String phone,String userpass);
	//根据邮箱修改密码
	public Integer inEmailUpdatePass(String email,String usepass);
	//通过id修改用户支付密码
	public Integer updateUserPaymentCode(Integer id,Integer paymentCode);
	//修改用户账户余额
	public Integer updateUserMoney(Integer id,Double money,Integer status);
	//修改用户手机
	public Integer updateUserIphone(Integer userId,String iphone);
	//判断用户支付密码是否正确
	public Integer checkUserPaymentCode(Integer id,Integer paymentCode);
	//修改用户邮箱找回密码状态吗
	public Integer updateUserEmailCode(String emailCode,String email);
	
	/**
	 * qxl
	 * 
	 * 用户删除（修改状态）
	 * */
	public int deleteUser(Integer type,Integer userId,String logoutWhy);
	/**
	 * 用户的模糊查询
	 * */
	public List<User> queryUserCondition(Map<String,Object> map);
	//判断用户是否修改过用户名
	public int editNameExit(int id);
	//修改用户名
	public void editUserName(String username,int id);
	//查询用户名是否存在
	public String userNameExit(String username);
	
	/**
	 * 按照用户名查询单个对象
	 * username 用户名
	 * 返回单个对象
	 */
	public User queryOneByName(String name);
	//修改用户信息
	public int editUser(User user);
	//任务调度器，查询用户id
	public List<User> allUserId();
	//赠送优惠券
	public int giveCoupon(List<Object> list,Date end);
	//修改用户账户金额(充值,提现)
	public boolean updateUserMoney2(Integer userId,Double money,String phone,Integer status);
	//退款（修改用户余额）
	public int updateMoney(Double price,Integer userId);
	
	/**
	 * 增加用户成长值
	 * @param userId 用户编号
	 * @param integral 成长值
	 * @return 返回记录数
	 */
	public int addUserIntegral(Integer userId,Integer integral);
}
