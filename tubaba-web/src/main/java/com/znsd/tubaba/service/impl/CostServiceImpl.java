package com.znsd.tubaba.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Cost;
import com.znsd.tubaba.mapper.CostMapper;
import com.znsd.tubaba.service.CostService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午11:07:54
 *
 * @描述: 费用功能service实现类
 */
@Service
public class CostServiceImpl implements CostService {
	/**
	 * 费用功能mapper
	 */
	@Autowired
	CostMapper costMapper;
	
	@Override
	public Integer addCost(Cost cost) {
		costMapper.addCost(cost);
		Integer id = cost.getId();
		return id;
	}

	@Override
	public Cost findById(Integer id) {
		Cost cost = costMapper.findById(id);
		return cost;
	}

	@Override
	public Integer update(Cost cost) {
		Integer rows = costMapper.update(cost);
		return rows;
	}
}
