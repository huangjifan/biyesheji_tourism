package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Activity;
import com.znsd.tubaba.mapper.ActivityMapper;
import com.znsd.tubaba.service.ActivityService;

/**
 * 活动所有操作
 */
@Service
public class ActivityServiceImpl implements ActivityService{
	@Autowired
	ActivityMapper activityMapper;
	
	//查询所有活动
	@Override
	public List<Activity> queryActivity() {
		return activityMapper.queryActivity();
	}

	//通过id查找
	public Activity queryActivityOne(Integer id) {
		return activityMapper.queryActivityOne(id);
	}
	
	//增加活动
	@Override
	public Integer addActivity(Activity activity) {
		return activityMapper.addActivity(activity);
	}

	//修改活动
	@Override
	public void updateActivity(Activity activity) {
		activityMapper.updateActivity(activity);
	}

	//删除活动
	@Override
	public Integer delActivity(Activity activity) {
		return activityMapper.delActivity(activity);
	}

	@Override
	public List<Activity> queryActivityByActivityAddressId(Integer activityAddressId) {
		List<Activity> list = activityMapper.queryActivityByActivityAddressId(activityAddressId);
		return list;
	}
}
