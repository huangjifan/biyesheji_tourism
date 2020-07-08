package com.znsd.tubaba.mapper;

import com.znsd.tubaba.entity.Cost;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午11:05:06
 *
 * @描述: 费用功能mapper接口
 */
public interface CostMapper {
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
	 * 通过订单编号查询费用信息
	 * @param id 订单编号
	 * @return 返回装载订单编号的费用信息,无数据时返回null
	 */
	public Cost findByIndentId(Integer indentId);
	
	/**
	 * 修改费用信息
	 * @param cost 新费用信息
	 * @return 返回修改的记录数
	 */
	public Integer update(Cost cost);
}
