package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Activity_arithmetic;
import com.znsd.tubaba.mapper.Activity_arithmeticMapper;
import com.znsd.tubaba.service.Activity_arithmeticService;

@Service
public class Activity_arithmeticServiceImpl implements Activity_arithmeticService{
	
	
	/**
	 * 活动算法操作
	 */
	
	@Autowired
	Activity_arithmeticMapper actMapper;
	
	@Override
	public List<Activity_arithmetic> queryArith() {
		return actMapper.queryArith();
	}

	@Override
	public Integer addArith(Activity_arithmetic actArith) {
		// TODO Auto-generated method stub
		return actMapper.addArith(actArith);
	}

}
