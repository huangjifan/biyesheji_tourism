package com.znsd.tubaba.mapper;


import java.util.List;

import com.znsd.tubaba.entity.Activity_arithmetic;

public interface Activity_arithmeticMapper {
	/**
	 * 活动算数操作
	 */
	
	public List<Activity_arithmetic> queryArith();
	/**
	 * 通过id查询活动算法信息
	 * @param id 主键编号
	 * @return 返回id对应的活动算法信息,无数据时返回null
	 */
	public Activity_arithmetic queryById(Integer id);
	
	public Integer addArith(Activity_arithmetic actArith);
}
