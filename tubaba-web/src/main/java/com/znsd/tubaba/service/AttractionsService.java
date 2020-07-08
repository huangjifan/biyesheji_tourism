package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Attractions;

public interface AttractionsService {
	public List<Attractions> queryAttr();
	
	//查询到单个数量
	public int queryCont(String atrtitle);
	
	//增加分类方法
	public int addTitl(Attractions attr);
	
	//根据id查询分类
	public Attractions getById(Integer id);
	//根据id查询
	public Attractions queryOneId(Integer id);
}
