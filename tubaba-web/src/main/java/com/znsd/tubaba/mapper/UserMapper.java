package com.znsd.tubaba.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.entity.UserStatus;

public interface UserMapper {
	//用户登录
	public User userLoginPost(String username,String userpass);
	
	public User findById(Integer id);
	//判断手机号
	public User findByIphone(String phone);
	//修改用户密码
	public Integer updateUserPass(@Param("userId") Integer userId,@Param("userpass") String userpass);
	//判断密码是否正确
	public Integer checkUserPass(@Param("userId") Integer userId,@Param("userpass") String userpass);
	//判断邮箱
	public User findByEmail(String email);
	//修改用户邮箱
	public Integer updateUserEmail(@Param("email") String email,@Param("userId") Integer userId);
	//管理员查询所有用户
	public List<User> queryUserAll();
	//查询用户数量
	public int countUser();
	//增加用户
	public Integer addUser(User user);
	//增加用户详情
	public Integer addUserstatus(UserStatus userStatus);
	//通过用户id查询用户详情表的数据
	public UserStatus findByUserid(@Param("userId")Integer userId);
	//修改用户详情表中的登陆时间
	public Integer updateUserstatusLoginTime(@Param("userId")Integer userId);
	//修改用户头像
	public Integer updateUserstatusHair(@Param("hair") String hair,@Param("userId")Integer userId);
	//查询用户的支付密码
	public Integer findByUserPaymentCode(@Param("id")Integer id);
	//修改用户账户余额
	public Integer updateUserMoney(@Param("id")Integer id,@Param("money")Double money,@Param("status")Integer status);
	//根据手机修改密码
	public Integer inPhoneUpdatePass(String phone,String userpass);
	//根据邮箱修改密码
	public Integer inEmailUpdatePass(String email,String usepass);
	//通过id修改用户支付密码
	public Integer updateUserPaymentCode(@Param("id") Integer id,@Param("paymentCode") Integer paymentCode);
	//管理员通过id修改重置用户密码
	public Integer updateUser(String newPass,Integer id);
	//修改用户手机
	public Integer updateUserIphone(@Param("userId") Integer userId,@Param("iphone") String iphone);
	//判断用户支付密码是否正确
	public Integer checkUserPaymentCode(@Param("id") Integer id,@Param("paymentCode") Integer paymentCode);
	//修改用户邮箱找回密码状态吗
	public Integer updateUserEmailCode(@Param("emailCode") String emailCode,@Param("email") String email);
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
	public int giveCoupon(@Param("list")List<Object> list,Date end);
	//退款（修改用户余额）
	public int updateMoney(Double price,Integer userId);
	
	/**
	 * 增加用户成长值
	 * @param userId 用户编号
	 * @param integral 成长值
	 * @return 返回记录数
	 */
	public int addUserIntegral(@Param("userId") Integer userId,@Param("integral") Integer integral);
}
