package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.mapper.MySpaceCommonMapper;
import com.znsd.tubaba.service.MySpaceCommonService;

@Service
public class MySpaceCommonServiceImpl implements MySpaceCommonService {
	@Autowired
	MySpaceCommonMapper mySpaceCommonMapper;
	
	@Override
	public List<Indentdetails> myCommonAll(int id,int pageNum,int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return mySpaceCommonMapper.myCommonAll(id);
	}

	@Override
	public int ddp(int userid) {
		// TODO Auto-generated method stub
		return mySpaceCommonMapper.ddp(userid);
	}

	@Override
	public int ydp(int userid) {
		// TODO Auto-generated method stub
		return mySpaceCommonMapper.ydp(userid);
	}

	@Override
	public List<Indentdetails> ydpAll(int id, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		return mySpaceCommonMapper.ydpAll(id);
	}

}
