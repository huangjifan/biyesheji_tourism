package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Remarklike;

public interface RemarklikeMapper {
	/**
	 * 查询点赞数
	 * remarkId 评论id
	 * */
	public List<Remarklike> queryByremaid(Integer remarkId);
	
	/**
	 * 查询点赞的用户
	 * remarkId 评论id
	 * userid 用户id
	 * */
	public int queryCount(Integer userid,Integer remarkId);
	
	/**
	 * 增加点赞表的记录
	 * */
	public int addRemarkLike(Integer userId,Integer remarkId);
}
