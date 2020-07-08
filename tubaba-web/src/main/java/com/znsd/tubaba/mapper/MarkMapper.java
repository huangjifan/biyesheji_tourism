package com.znsd.tubaba.mapper;

import com.znsd.tubaba.entity.Mark;

public interface MarkMapper {
	/**
	 * 根据id查询打分表信息
	 * id 主键id
	 * */
	public Mark queryOne(int id);
}
