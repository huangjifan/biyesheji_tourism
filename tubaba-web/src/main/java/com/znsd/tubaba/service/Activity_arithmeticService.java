package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Activity_arithmetic;

public interface Activity_arithmeticService {
	/**
	 * 活动算数操作
	 */
	
	public List<Activity_arithmetic> queryArith();
	
	public Integer addArith(Activity_arithmetic actArith);
}
