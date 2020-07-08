package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.AdvertisingClassify;

public interface Advertising_classifyMapper {
	/**
	 * 查询所有的广告分类
	 * */
	public List<AdvertisingClassify> queryAll();
	
	/**
	 * 按名字查询分类
	 * 
	 * */
	public int queryOneader(String name);
	
	/**
	 * 广告分类增加方法
	 * */
	public int addAdver(AdvertisingClassify adverclas);
	
	/**
	 * 查询广告分类是否在广告表中有数据
	 * */
	public int queryatredId(int adverclasId);
	
	/**-
	 * 删除（修改状态）
	 * */
	public int deletAdver(int type,int id);
	
	
	/**
	 * 根据id获取单个对象
	 * */
	public AdvertisingClassify queryOneId(Integer id);
	
	/**
	 * 修改广告分类  * 
	 * */
	public int updateAdver(AdvertisingClassify adver);
}
