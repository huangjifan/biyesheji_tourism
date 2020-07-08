package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Indentdetails;

public interface MySpaceCommonMapper {
	//查询所有评论
	public List<Indentdetails> myCommonAll(int id);
	//查询已点评数据
	public List<Indentdetails> ydpAll(int id);
	//查询待点评数量
	public int ddp(int userid);
	//查询已点评数量
	public int ydp(int userid);
}
