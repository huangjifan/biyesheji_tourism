package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Admin;
import com.znsd.tubaba.mapper.AdminMapper;
import com.znsd.tubaba.service.AdminService;

/**
 * 
 * @author 黄振伟
 * 
 * @Time 2018年10月31日10:42:00
 * 
 * @Description 管理员登录service实现类
 *
 */
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper admmapper;
	
	
	@Override
	public List<Admin> queryAdmin() {
		return admmapper.queryAdmin();
	}

	@Override
	//查询用户总数
	public Integer countAdmin() {
		return admmapper.countAdmin();
	}

	@Override
	public Integer addAdmin(Admin admin) {
		return admmapper.addAdmin(admin);
	}

	@Override
	public Admin queryState(Integer admId) {
		return admmapper.queryState(admId);
	}

	@Override
	public void updateState(Admin admin) {
		admmapper.updateState(admin);
	}
	
	/**
	 * qxl
	 * 管理员模糊查询
	 * */
	@Override
	public List<Admin> queryAdminUsername(Admin admin){
		return admmapper.queryAdminUsername(admin);
	}
	

}
