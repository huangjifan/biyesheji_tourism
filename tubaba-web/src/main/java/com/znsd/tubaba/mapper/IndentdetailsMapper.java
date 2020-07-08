package com.znsd.tubaba.mapper;


import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Indentdetails;

public interface IndentdetailsMapper {
	//根据id查询订单详情
	public Indentdetails findById(@Param("id") Integer id);
	
	/**
	 * 增加订单详情
	 * @param indentdetails 订单详情信息
	 * @return 返回新增订单的主键编号
	 */
	public Integer addIndentdetails(Indentdetails indentdetails);
}
