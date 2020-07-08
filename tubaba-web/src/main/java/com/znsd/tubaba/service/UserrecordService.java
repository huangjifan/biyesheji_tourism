package com.znsd.tubaba.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Userrecord;

public interface UserrecordService {
	//通过用户id和状态查询用户纪录
	public List<Userrecord> findByUserIdAndOperation(Integer userId,Integer operation,Integer pageNum,Integer pageSize);
	
	//查询用户充值金额
	public Integer findByUserIdMoney(Integer userId,Integer operation);
	
	//增加用户纪录
	public Integer insertUserrecord(Userrecord userrecord);
}
