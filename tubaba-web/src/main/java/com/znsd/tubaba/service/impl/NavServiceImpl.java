                             package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Nav;
import com.znsd.tubaba.mapper.NavMapper;
import com.znsd.tubaba.service.NavService;

/**
 * 导航栏的servci
 * @author Administrator
 *
 */
@Service
public class NavServiceImpl implements NavService{
	@Autowired
	NavMapper navMapper;
	
	public List<Nav> queryNav(){
		return navMapper.queryNav();
	}

	public List<Nav> queryAdminNav(Integer identity) {
		return navMapper.queryAdminNav(identity);
	}
}
