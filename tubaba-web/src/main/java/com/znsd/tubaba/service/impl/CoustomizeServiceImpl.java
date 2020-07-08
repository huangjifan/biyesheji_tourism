package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Coustomize;
import com.znsd.tubaba.mapper.CoustomizeMapper;
import com.znsd.tubaba.service.CoustomizeService;

@Service
public class CoustomizeServiceImpl implements CoustomizeService{
	@Autowired
	CoustomizeMapper coustomizeMapper;

	@Override
	public List<Coustomize> queryAll() {
		return coustomizeMapper.queryAll();
	}

	@Override
	public Integer addCoustomize(Coustomize coustomize) {
		return coustomizeMapper.addCoustomize(coustomize);
	}

	@Override
	public void delCustomize(Coustomize coustomize) {
		coustomizeMapper.delCustomize(coustomize);
	}

	@Override
	public Coustomize queryOneId(Integer id) {
		return coustomizeMapper.queryOneId(id);
	}

	@Override
	public List<Coustomize> queryOneName(String username) {
		return coustomizeMapper.queryOneName(username);
	}
}
