package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Admin;

/**
 * 
 * @author 黄振伟
 * 
 * @Time 2018年10月31日10:32:12
 * 
 * @Describe 管理员登录service
 *
 */
public interface AdminService {

	/**
	 * 查询所有的管理员
	 * @param 
	 * @return 返回装载包含所有管理员信息的的list,无数据返回空的list
	 */
	public List<Admin> queryAdmin();
	
	//查询总数
	public Integer countAdmin();
	
	//增加管理员
	public Integer addAdmin(Admin admin);
	
	//查询状态
	public Admin queryState(Integer admId);
	
	//修改状态
	public void updateState(Admin admin);

	/**
	 * qxl
	 * 管理员模糊查询
	 * */
	public List<Admin> queryAdminUsername(Admin admin);
}
