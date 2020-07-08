package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Activity_type;

public interface Activity_typeMapper {
	/**
	 *活动类型操作 
	 */
	
	/**
	 * 查询活动类型
	 */
	public List<Activity_type> queryType();
	public Activity_type queryTypeOne(Integer id);
	public Integer countType();
	
	/**
	 * 增加活动类型
	 */
	public Integer addType(Activity_type actType);
	
	
	/**
	 * 删除活动类型 
	 */
	
	public Integer delActTyp(Activity_type actType);
}
