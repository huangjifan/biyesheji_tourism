package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Collect;
import com.znsd.tubaba.mapper.CollectMapper;
import com.znsd.tubaba.service.CollectService;

@Service
public class CollectServiceImpl implements CollectService {
	@Autowired
	CollectMapper collectMapper;
	
	//查询用户所有收藏
	@Override
	public List<Collect> findByUserId(Integer userId,Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return collectMapper.findByUserId(userId);
	}

	//查询用户的景点收藏
	@Override
	public List<Collect> findByUserIdAndScenicIdNotNull(Integer userId,Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return collectMapper.findByUserIdAndScenicIdNotNull(userId);
	}

	//查询用户所有路线收藏
	@Override
	public List<Collect> findByUserIdAndScenicwayIdNotNull(Integer userId,Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return collectMapper.findByUserIdAndScenicwayIdNotNull(userId);
	}

	//查询用户所有酒店收藏
	@Override
	public List<Collect> findByUserIdAndHotelIdNotNull(Integer userId,Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return collectMapper.findByUserIdAndHotelIdNotNull(userId);
	}

	//查询用户所有的特卖收藏
	@Override
	public List<Collect> findByUserIdAndActivity(Integer userId,Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return collectMapper.findByUserIdAndActivity(userId);
	}

	//查询用户所有收藏数量
	@Override
	public Integer findByUserIdCount(Integer userId) {
		return collectMapper.findByUserIdCount(userId);
	}

	//查询用户的景点收藏数量
	@Override
	public Integer findByUserIdAndScenicIdNotNullCount(Integer userId) {
		return collectMapper.findByUserIdAndScenicIdNotNullCount(userId);
	}

	//查询用户所有路线收藏数量
	@Override
	public Integer findByUserIdAndScenicwayIdNotNullCount(Integer userId) {
		return collectMapper.findByUserIdAndScenicwayIdNotNullCount(userId);
	}

	//查询用户所有酒店收藏数量
	@Override
	public Integer findByUserIdAndHotelIdNotNullCount(Integer userId) {
		return collectMapper.findByUserIdAndHotelIdNotNullCount(userId);
	}

	//查询用户所有的特卖收藏数量
	@Override
	public Integer findByUserIdAndActivityCount(Integer userId) {
		return collectMapper.findByUserIdAndActivityCount(userId);
	}

	//删除用户收藏
	@Override
	public Integer deleteByUserIdAndScenidId(Integer userId, String scenidId, String scenicwayId, String hotelId) {
		return collectMapper.deleteByUserIdAndScenidId(userId, scenidId, scenicwayId, hotelId);
	}
	
	//删除用户收藏
	@Override
	public Integer deleteByUserIdAndScenidId2(Integer userId, String scenidId, String scenicwayId, String hotelId) {
		return collectMapper.deleteByUserIdAndScenidId2(userId, scenidId, scenicwayId, hotelId);
	}

	@Override
	public Integer insertCollect(Collect collect) {
		collectMapper.insertCollect(collect);
		int id = collect.getId();
		return id;
	}

	@Override
	public Collect queryCollectByUserIdAndScenicIdOrScenicwayId(Integer usreId, Integer scenicId, Integer scenicwayId) {
		Collect collect = collectMapper.queryCollectByUserIdAndScenicIdOrScenicwayId(usreId, scenicId, scenicwayId);
		return collect;
	}

	
}
