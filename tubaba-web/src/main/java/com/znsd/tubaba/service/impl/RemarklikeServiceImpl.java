package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Remarklike;
import com.znsd.tubaba.mapper.RemarklikeMapper;
import com.znsd.tubaba.service.RemarklikeService;

@Service
public class RemarklikeServiceImpl implements RemarklikeService {

	@Autowired
	RemarklikeMapper relikeMapper;
	
	@Override
	public List<Remarklike> queryByremaid(Integer remarkId) {
		return relikeMapper.queryByremaid(remarkId);
	}

	@Override
	public int queryCount(Integer userid, Integer remarkId) {
		return relikeMapper.queryCount(userid, remarkId);
	}

	@Override
	public int addRemarkLike(Integer userId, Integer remarkId) {
		return relikeMapper.addRemarkLike(userId, remarkId);
	}
	
	
}
