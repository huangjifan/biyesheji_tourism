package com.znsd.tubaba.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.mapper.ScenicwayMapper;
import com.znsd.tubaba.service.ScenicwayService;
@Service
public class ScenicwayServiceImpl implements ScenicwayService{
	@Autowired
	ScenicwayMapper scenicwayMapper;


	@Override
	public List<Scenicway> findByScenics(String content, Integer attractionsId) {
		return scenicwayMapper.findByScenics(content, attractionsId);
	}


	@Override
	public List<Scenicway> findByActivityAndFrompathDesc(String activityName, String frompath) {
		return scenicwayMapper.findByActivityAndFrompathDesc(activityName, frompath);
	}

	@Override
	public List<Scenicway> findByScenicwayDesc() {
		return scenicwayMapper.findByScenicwayDesc();
	}

	@Override
	public List<Scenicway> findByCity() {
		return scenicwayMapper.findByCity();
	}

	@Override
	public List<Scenicway> findByActivityAndCity() {
		return scenicwayMapper.findByActivityAndCity();
	}

	@Override
	public List<Scenicway> findByIndentdetailsGroupByPath(String attractions) {
		return scenicwayMapper.findByIndentdetailsGroupByPath(attractions);
	}

	@Override
	public List<Scenicway> findByIndentdetails(String attractions) {
		return scenicwayMapper.findByIndentdetails(attractions);
	}

	@Override
	public int queryCount(Integer atrid) {
		return scenicwayMapper.queryCount(atrid);
	}

	@Override
	public List<Scenicway> findByScenicsAndStartpath(String content, String toPath, Integer attractionsId) {
		return scenicwayMapper.findByScenicsAndStartpath(content, toPath, attractionsId);
	}
	
	/**
	 * 查询所有的路线
	 * */
	@Override
	public List<Scenicway> queryAll(){
		return scenicwayMapper.qureyAll();
	}
	

	@Override
	public Scenicway queryById(Integer id) {
		return scenicwayMapper.queryById(id);
	}

	@Override
	public List<Scenicway> findScenicwayByAttractionsIdAndStartpathOrderByFeedback(Integer attractionsId,String startpath) {
		List<Scenicway> list = scenicwayMapper.findScenicwayByAttractionsIdAndStartpathOrderByFeedback(attractionsId,startpath);
		return list;
	}

	/**
	 * 查询所有路线，链接图片表
	 * */
	@Override
	public List<Scenicway> queryByScenwayImage() {
		return scenicwayMapper.queryByScenwayImage();
	}
	
	@Override
	public List<Scenicway> queryTitleByScenicway(String title) {
		return scenicwayMapper.queryTitleByScenicway(title);
	}


	@Override
	public List<Scenicway> queryScenicwayMoreWhere(String content, String toPath, Integer attractionsId,
			Map<String, Object> map) {
		return scenicwayMapper.queryScenicwayMoreWhere(content, toPath, attractionsId, map);
	}
	 
	@Override
	public int addScenicWay(Scenicway way) {
		scenicwayMapper.addScenicWay(way);
		return way.getId();
	}


	 
	@Override
	public int updateScenicwayStatus(Integer id) {
		return scenicwayMapper.updateScenicwayStatus(id);
	}


	
	@Override
	public Scenicway queryScenicwayById(Integer id) {
		return scenicwayMapper.queryScenicwayById(id);
	}


	 
	@Override
	public Integer updateScenicway(Scenicway way) {
		return scenicwayMapper.updateScenicway(way);
	}


	@Override
	public List<Scenicway> queryAllDel() {
		return scenicwayMapper.queryAllDel();
	}


	@Override
	public int updateScenicwayArr(Integer id) {
		return scenicwayMapper.updateScenicwayArr(id);
	}
}
