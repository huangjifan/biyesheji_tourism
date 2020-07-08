package com.znsd.tubaba.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Userrecord;

public interface UserrecordMapper {
	//通过用户id和状态查询用户纪录
	public List<Userrecord> findByUserIdAndOperation(@Param("userId") Integer userId,@Param("operation") Integer operation);

	//查询用户充值金额
	public Integer findByUserIdMoney(@Param("userId") Integer userId,@Param("operation") Integer operation);

	//增加用户纪录
	public Integer insertUserrecord(Userrecord userrecord);
}
