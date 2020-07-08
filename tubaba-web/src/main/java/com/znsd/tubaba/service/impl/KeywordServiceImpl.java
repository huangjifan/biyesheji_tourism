package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Keyword;
import com.znsd.tubaba.mapper.KeywordMapper;
import com.znsd.tubaba.service.KeywordService;

@Service
public class KeywordServiceImpl implements KeywordService{
	
	@Autowired
	KeywordMapper keyMapper;
	
	/**
	 * 查询所有的关键字
	 * 返回关键字信息的list，如果没有，返回空
	 * */
	@Override
	public List<Keyword> queryAll() {
		return keyMapper.queryAll();
	}

}
