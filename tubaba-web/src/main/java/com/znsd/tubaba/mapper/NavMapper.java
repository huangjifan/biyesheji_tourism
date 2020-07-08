package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Nav;

public interface NavMapper {
	public List<Nav> queryNav();
	
	/**
	 * 返回指定管理员对应的菜单栏
	 * @param 管理员权限
	 * @return 
	 */
	public List<Nav> queryAdminNav(Integer identity);
}
