package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.CostExplain;
import com.znsd.tubaba.mapper.CostExplainMapper;
import com.znsd.tubaba.service.CostExplainService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午11:26:03
 *
 * @描述: 费用详细说明功能service实现类
 */
@Service
public class CostExplainServiceImpl implements CostExplainService {
	/**
	 * 费用详细说明功能mapper
	 */
	@Autowired
	CostExplainMapper costExplainMapper;
	
	@Override
	public Integer addCostExplain(CostExplain costExplain) {
		costExplainMapper.addCostExplain(costExplain);
		Integer id = costExplain.getId();
		return id;
	}

	@Override
	public Integer batchAddCostExplain(List<CostExplain> costExplains) {
		Integer rows = costExplainMapper.batchAddCostExplain(costExplains);
		return rows;
	}
}
