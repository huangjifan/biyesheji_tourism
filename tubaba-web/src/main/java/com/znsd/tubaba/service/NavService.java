package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Nav;

public interface NavService {
	
	/**
	 * 返回所有菜单栏
	 * @return
	 */
	public List<Nav> queryNav();
	
	/**
	 * 返回指定管理员对应的菜单栏
	 * @param 管理员权限
	 * @return 
	 */
	public List<Nav> queryAdminNav(Integer identity);
}
