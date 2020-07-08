package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Activity_address;
import com.znsd.tubaba.mapper.ActivityAddressMapper;
import com.znsd.tubaba.service.ActivityAddressService;

@Service
public class ActivityAddressServiceImpl implements ActivityAddressService {
	/**
	 *活动地址显示所有操作 
	 */
	@Autowired
	ActivityAddressMapper activityAddressService;

	@Override
	public List<Activity_address> queryAddress() {
		// TODO Auto-generated method stub
		return activityAddressService.queryAddress();
	}

	@Override
	public int queryOneAct(String name) {
		// TODO Auto-generated method stub
		return activityAddressService.queryOneAct(name);
	}

	@Override
	public int addAct(Activity_address actclas) {
		// TODO Auto-generated method stub
		return activityAddressService.addAct(actclas);
	}

	@Override
	public Integer queryatredId(Integer id) {
		// TODO Auto-generated method stub
		return activityAddressService.queryatredId(id);
	}

	@Override
	public int deleteAct(int state, int id) {
		// TODO Auto-generated method stub
		return activityAddressService.deleteAct(state, id);
	}

	@Override
	public Activity_address queryOneId(Integer id) {
		// TODO Auto-generated method stub
		return activityAddressService.queryOneId(id);
	}

	@Override
	public int updateact(Activity_address adver) {
		// TODO Auto-generated method stub
		return activityAddressService.updateact(adver);
	}
	
	
	
}
