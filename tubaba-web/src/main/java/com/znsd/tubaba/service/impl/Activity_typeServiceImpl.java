package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Activity_type;
import com.znsd.tubaba.mapper.Activity_typeMapper;
import com.znsd.tubaba.service.Activity_typeService;

@Service
public class Activity_typeServiceImpl implements Activity_typeService{
/*
 * 活动分类操作
 * */
	@Autowired
	Activity_typeMapper actMapper;
	
	@Override
	public List<Activity_type> queryType() {
		return actMapper.queryType();
	}

	@Override
	public Integer addType(Activity_type actType) {
		return actMapper.addType(actType);
	}

	@Override
	public Integer delActTyp(Activity_type actType) {
		return actMapper.delActTyp(actType);
	}

	@Override
	public Activity_type queryTypeOne(Integer id) {
		return actMapper.queryTypeOne(id);
	}

	@Override
	public Integer countType() {
		return actMapper.countType();
	}

}
