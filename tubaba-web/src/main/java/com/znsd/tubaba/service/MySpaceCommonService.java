package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Indentdetails;

public interface MySpaceCommonService {
	public List<Indentdetails> myCommonAll(int id,int pageNum,int pageSize);
	//查询待点评数量
	public int ddp(int userid);
	//查询已点评数量
	public int ydp(int userid);
	//查询已点评数据
	public List<Indentdetails> ydpAll(int id,int pageNum,int pageSize);
}
