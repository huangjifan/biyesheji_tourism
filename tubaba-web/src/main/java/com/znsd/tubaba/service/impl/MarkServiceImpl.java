package com.znsd.tubaba.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Mark;
import com.znsd.tubaba.mapper.MarkMapper;
import com.znsd.tubaba.service.MarkService;

@Service
public class MarkServiceImpl implements MarkService {
	
	@Autowired
	MarkMapper markMapper;
	
	@Override
	public Mark queryOne(int id) {
		return markMapper.queryOne(id);
	}

}
