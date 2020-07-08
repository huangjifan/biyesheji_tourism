package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.AdvertisingClassify;
import com.znsd.tubaba.mapper.Advertising_classifyMapper;
import com.znsd.tubaba.service.AdvertisingClassifyService;

@Service
public class AdvertisingClassifyServiceImpl implements AdvertisingClassifyService{

	@Autowired
	Advertising_classifyMapper aderMapper;
	
	@Override
	public List<AdvertisingClassify> queryAll() {
		return aderMapper.queryAll();
	}
	
	/**
	 * 按名字查询分类
	 * 
	 * */
	@Override
	public int queryOneader(String name){
		return aderMapper.queryOneader(name);
	}
	
	
	/**
	 * 广告分类增加方法
	 * */
	@Override
	public int addAdver(AdvertisingClassify adverclas) {
		return aderMapper.addAdver(adverclas);
	}

	
	/**
	 * 查询广告分类是否在广告表中有数据
	 * */
	@Override
	public int queryatredId(int adverclasId) {
		return aderMapper.queryatredId(adverclasId);
	}
	
	
	/**-
	 * 删除（修改状态）
	 * */
	@Override
	public int deletAdver(int type,int id) {
		return aderMapper.deletAdver(type, id);
	}
	
	/**
	 * 根据id获取单个对象
	 * */
	@Override
	public AdvertisingClassify queryOneId(Integer id) {
		return aderMapper.queryOneId(id);
	}
	
	/**
	 * 修改广告分类  * 
	 * */
	public int updateAdver(AdvertisingClassify adver) {
		return aderMapper.updateAdver(adver);
	}
}
