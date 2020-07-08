package com.znsd.tubaba.service;

import com.znsd.tubaba.entity.Cost;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午11:07:05
 *
 * @描述: 费用功能service接口
 */
public interface CostService {
	/**
	 * 增加费用
	 * @param cost 费用信息
	 * @return 返回新增费用的主键编号
	 */
	public Integer addCost(Cost cost);
	
	/**
	 * 通过主键编号查询费用信息
	 * @param id 主键编号
	 * @return 返回装载主键编号的费用信息,无数据时返回null
	 */
	public Cost findById(Integer id);
	
	/**
	 * 修改费用信息
	 * @param cost 新费用信息
	 * @return 返回修改的记录数
	 */
	public Integer update(Cost cost);
}
