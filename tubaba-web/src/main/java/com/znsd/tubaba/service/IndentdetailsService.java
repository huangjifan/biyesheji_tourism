package com.znsd.tubaba.service;

import com.znsd.tubaba.entity.Cost;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.User;

public interface IndentdetailsService {
	//根据id查询订单详情
	public Indentdetails findById(Integer id);
	
	/**
	 * 增加订单详情
	 * @param indentdetails 订单详情信息
	 * @return 返回新增订单的主键编号
	 */
	public Integer addIndentdetails(Indentdetails indentdetails);

	public boolean submitIndenttails(User users, Indent indent, Indentdetails indentdetails, LinkMan linkman);



}
