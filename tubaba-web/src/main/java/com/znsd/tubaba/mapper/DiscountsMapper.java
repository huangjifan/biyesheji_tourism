package com.znsd.tubaba.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Discounts;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午5:14:20
 * 
 * @描述: 活动记录功能mapper接口
 */
public interface DiscountsMapper {
	
	/**
	 * 通过旅游路线编号或景点编号查询活动记录信息
	 * @param scenicwayId 旅游路线编号
	 * @param scenicId 景点编号
	 * @return 返回装载通过旅游路线编号或景点编号查询活动记录信息的list，无数据时返回空的list
	 */
	List<Discounts> queryDiscountsByScenicwayIdOrScenicId(@Param("scenicwayId") Integer scenicwayId,@Param("scenicId") Integer scenicId);
}
