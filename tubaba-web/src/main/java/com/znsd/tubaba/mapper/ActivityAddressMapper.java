package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Activity_address;

public interface ActivityAddressMapper {
	/**
	 *活动地址分类所有操作 
	 */
	public List<Activity_address> queryAddress();
	
	/**
	 * 按名字查询分类
	 * */
	public int queryOneAct(String name);

	/**
	 * 活动分类增加方法
	 * */
	public int addAct(Activity_address adverclas);

	
	/**
	 * 查询活动分类是否在活动表中有数据
	 * */
	public Integer queryatredId(Integer addressid);
	
	
	/**-
	 * 删除（修改状态）
	 * */
	public int deleteAct(int type,int id);
	
	
	/**
	 * 根据id获取单个对象
	 * */
	public Activity_address queryOneId(Integer id);
	
	
	/**
	 * 修改活动分类  * 
	 * */
	public int updateact(Activity_address adver);
	
}		
