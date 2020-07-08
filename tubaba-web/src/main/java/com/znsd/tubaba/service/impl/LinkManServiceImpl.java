package com.znsd.tubaba.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.PlayMan;
import com.znsd.tubaba.mapper.LinkManMapper;
import com.znsd.tubaba.service.LinkManService;

@Service
public class LinkManServiceImpl implements LinkManService{
	
	@Autowired
	LinkManMapper linkManMapper;
	
	@Override
	public LinkMan findByLinkManId(Integer id) {
		return linkManMapper.findByLinkManId(id);
	}

	@Override
	public Set<PlayMan> findPlayManByLinkManId(Integer linkmanid) {
		return linkManMapper.findPlayManByLinkManId(linkmanid);
	}

	@Override
	public Integer addLinkMan(LinkMan linkMan) {
		linkManMapper.addLinkMan(linkMan);
		Integer id = linkMan.getId();
		return id;
	}

	@Override
	public LinkMan findByLinkManName(String realName) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
		return linkManMapper.findByLinkManName(realName);
	}
 
}
