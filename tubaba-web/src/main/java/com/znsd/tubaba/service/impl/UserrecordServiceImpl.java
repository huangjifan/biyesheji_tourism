package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Userrecord;
import com.znsd.tubaba.mapper.UserrecordMapper;
import com.znsd.tubaba.service.UserrecordService;

@Service
public class UserrecordServiceImpl implements UserrecordService {
	
	@Autowired
	UserrecordMapper userrecordMapper;

	//通过用户id和状态查询用户纪录
	@Override
	public List<Userrecord> findByUserIdAndOperation(Integer userId, Integer operation,Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return userrecordMapper.findByUserIdAndOperation(userId, operation);
	}

	//查询用户充值金额
	@Override
	public Integer findByUserIdMoney(Integer userId, Integer operation) {
		return userrecordMapper.findByUserIdMoney(userId, operation);
	}

	//增加用户纪录
	@Override
	public Integer insertUserrecord(Userrecord userrecord) {
		return userrecordMapper.insertUserrecord(userrecord);
	}

}
