package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Activity;

public interface ActivityMapper {
	/**
	 * 活动管理的所有操作
	 * */
	//查询所有活动
	public List<Activity> queryActivity();
	
	//通过id查找
	public Activity queryActivityOne(Integer id);
	
	//增加活动
	public Integer addActivity(Activity activity);
	
	
	//修改活动
	public void updateActivity(Activity activity);
	
	
	//删除活动
	public Integer delActivity(Activity activity);
	
	/**
	 * 通过活动展示地址编号查询活动信息
	 * @param activityAddressId 活动展示地址编号
	 * @return 返回装载活动展示地址编号对应的活动信息的list,无数据返回空的list
	 */
	public List<Activity> queryActivityByActivityAddressId(Integer activityAddressId);
}
