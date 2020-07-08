package com.znsd.tubaba.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Indent;

public interface IndentMapper {
	//据订单编号查询订单
	public Indent findByIndentId(@Param("id") Integer id);
	
	//查询所有订单
	public List<Indent> findByAll();
	
	//根据类型查询订单
	public List<Indent> findByType(@Param("type") String type,@Param("indentstatus") String indentstatus,@Param("userId") Integer userId);
	
	//查询用户最近订单
	public List<Indent> findByRecently(@Param("userId")Integer userId);
	
	//修改订单状态
	public Integer updateIndentstatus(@Param("indentstatus")Integer indentstatus,@Param("id") Integer id,@Param("cancel") String cancel);

	//根据订单id查询游玩人
	/*public Set<PlayMan> findByPlayManIndentId(@Param("indentId")Integer indentId);*/
	
	//修改订单状态
	public Integer updatestatus(int indentstatus,int id);
	/**
	 * 增加订单
	 * @param indent 订单信息
	 * @return 返回新增订单的主键编号
	 */
	public Integer addIndent(Indent indent);
	/**
	 * 通过伪订单编号查询订单
	 * @param ordernumber 伪订单编号
	 * @return 返回伪订单编号的订单信息,无数据时返回null
	 */
	public Indent findByOrdernumber(String ordernumber);
	/**
	 * 通过用户编号和旅游路线编号查询待评论订单
	 * @param userId 用户编号
	 * @param scenicwayId 旅游路线编号
	 * @return 返回用户编号和旅游路线编号查询待评论订单,无数据时返回null
	 */
	public Indent findByUserIdAndScenicwayId(@Param("userId")Integer userId,@Param("scenicwayId")Integer scenicwayId);
	//定时修改订单状态
	public void editStatus(int status,int id);
}
