package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.CostExplain;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午11:25:20
 *
 * @描述: 费用详细说明功能service接口
 */
public interface CostExplainService {
	/**
	 * 增加费用详细说明
	 * @param costexplain 费用详细说明信息
	 * @return 返回新增费用详细说明的主键编号
	 */
	public Integer addCostExplain(CostExplain costExplain);
	
	/**
	 * 批量增加费用详细说明
	 * @param costExplains 费用详细说明list
	 * @return 返回增加的记录数
	 */
	public Integer batchAddCostExplain(List<CostExplain> costExplains);
}
