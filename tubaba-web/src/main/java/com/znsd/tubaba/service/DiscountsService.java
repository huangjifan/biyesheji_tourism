package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Discounts;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午5:34:13
 * 
 * @描述: 活动记录功能service接口
 */
public interface DiscountsService {
	
	/**
	 * 通过旅游路线编号或景点编号查询活动记录信息
	 * @param scenicwayId 旅游路线编号
	 * @param scenicId 景点编号
	 * @return 返回装载通过旅游路线编号或景点编号查询活动记录信息的list，无数据时返回空的list
	 */
	List<Discounts> queryDiscountsByScenicwayIdOrScenicId(Integer scenicwayId,Integer scenicId);
}
