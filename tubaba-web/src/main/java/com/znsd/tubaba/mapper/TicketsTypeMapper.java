package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.TicketsType;


/**
 * 
 * @author 黄振伟
 * 
 * @描述 景点门票类型Mapper接口
 *
 * @时间 2018年11月6日16:50:26
 * 
 */
public interface TicketsTypeMapper {
	
	/**
	 * 增加景点图片
	 * @return 返回增加数据的主键
	 */
	public Integer addTicketsType(TicketsType ticketsType);
	
	
	/**
	 * 根据景点id查询门票类型
	 * @param id 景点id
	 * @return
	 */
	public List<TicketsType> queryTicketsById(Integer id);
	
	/**
	 * 根据景点id和门票类型查询
	 * @param id 景点id
	 * @param type 景点门票类型
	 * @return
	 */
	public TicketsType queryTicketsprice(Integer id,String type);
	
	/**
	 * 根据门票类型修改门票价格
	 * @param price 门票价格
	 * @param type 门票的类型
	 * @return
	 */
	public Integer updateTickets(String price,Integer id);
}
