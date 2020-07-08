package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Attractions;
import com.znsd.tubaba.mapper.AttractionsMapper;
import com.znsd.tubaba.service.AttractionsService;

@Service
public class AttractionsServiceImpl implements AttractionsService{
	@Autowired
	AttractionsMapper attractionsMapper;
	
	public List<Attractions> queryAttr(){
		return attractionsMapper.queryAttr();
	}

	@Override
	public int queryCont(String atrtitle) {
		return attractionsMapper.queryCont(atrtitle);
	}

	@Override
	public int addTitl(Attractions attr) {
		return attractionsMapper.addTitl(attr);
	}

	@Override
	public Attractions getById(Integer id) {
		Attractions a= attractionsMapper.queryOneId(id);
		return a;
	}
	 
	@Override
	public Attractions queryOneId(Integer id) {
		return attractionsMapper.queryOneId(id);
	}
}
