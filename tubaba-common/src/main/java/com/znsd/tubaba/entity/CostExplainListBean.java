package com.znsd.tubaba.entity;

import java.util.List;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 下午10:09:50
 *
 * @描述: 费用详细说明list信息
 */
public class CostExplainListBean {
	
	/**
	 * 费用详细说明list
	 */
	private List<CostExplain> costExplains;

	public List<CostExplain> getCostExplains() {
		return costExplains;
	}

	public void setCostExplains(List<CostExplain> costExplains) {
		this.costExplains = costExplains;
	}
}
