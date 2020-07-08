package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Admin;
import com.znsd.tubaba.entity.User;

/**
 * 
 * @author 黄振伟
 * 
 * @描述 后台权限登录功能的Mapper接口
 *
 * @时间 2018年10月31日10:25:11
 */
public interface AdminMapper {

	/**
	 * 查询所有的管理员
	 * @param 
	 * @return 返回装载包含所有管理员信息的的list,无数据返回空的list
	 */
	public List<Admin> queryAdmin();
	
	public List<Admin> queryPermissions(Integer adminId);
	
	public Integer countAdmin();
	
	public User findById(Integer id);
	
	public Integer addAdmin(Admin admin);
	
	public Admin queryState(Integer admId);
	
	public void updateState(Admin admin);
	
	/**
	 * qxl
	 * 管理员模糊查询
	 * */
	public List<Admin> queryAdminUsername(Admin admin);
}
