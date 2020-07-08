package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Keyword;

public interface KeywordMapper {
	/**
	 * 查询所有的关键字
	 * 返回关键字信息的list，如果没有，返回空
	 * */
	public List<Keyword> queryAll();
}
