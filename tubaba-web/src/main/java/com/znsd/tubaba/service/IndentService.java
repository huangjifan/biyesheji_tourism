package com.znsd.tubaba.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Cost;
import com.znsd.tubaba.entity.CostExplain;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.PlayMan;

public interface IndentService {
	//据订单编号查询订单
	public Indent findByIndentId(Integer id);
	
	//查询所有订单
	public List<Indent> findByAll();
	
	//根据类型查询订单
	public List<Indent> findByType(String type,String indentstatus,Integer userId);
	
	//查询用户最近订单
	public List<Indent> findByRecently(Integer userId);
	
	//修改订单状态
	public Integer updateIndentstatus(Integer indentstatus,Integer id,String cancel);
	
	//根据订单id查询游玩人
	/*public Set<PlayMan> findByPlayManIndentId(Integer indentId);*/
	
	public Integer updatestatus(int status, int indentId);
	
	/**
	 * 增加订单
	 * @param indent 订单信息
	 * @return 返回新增订单的主键编号
	 */
	public Integer addIndent(Indent indent);
	
	/**
	 * 提交订单
	 * @param userId 用户编号
	 * @param indent 订单信息
	 * @param indentdetails 订单详情信息
	 * @param linkMan 联系人信息
	 * @param playMans 游玩人信息list
	 * @param cost 费用信息
	 * @param costExplain 费用详细说明信息
	 * @return 返回提交订单的结果,成功为true,失败为false.
	 */
	public boolean submitIndent(Integer userId,Indent indent,Indentdetails indentdetails
			,LinkMan linkMan,List<PlayMan> playMans,Cost cost,List<CostExplain> costExplains
			,Integer couponId);

	/**
	 * 通过伪订单编号查询订单
	 * @param ordernumber 伪订单编号
	 * @return 返回伪订单编号的订单信息,无数据时返回null
	 */
	public Indent findByOrdernumber(String ordernumber);
	
	/**
	 * 支付订单
	 * @param userId 用户编号
	 * @param indentId 订单编号
	 * @return 支付成功返回true,失败false
	 */
	public Map<String,Object> paymentIndent(Integer userId,Integer pass,Integer indentId);
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
