/**
 * 下午10:44:02TODO
 */
package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.mapper.TitleMapper;
import com.znsd.tubaba.service.TitleService;

/**
 * 
 * @author 黄振伟
 * 
 * @描述 主题分类功能Service实现类
 *
 * @时间 2018年10月31日10:25:11
 * 
 */
@Service
public class TitleServiceImpl implements TitleService {

	@Autowired
	TitleMapper titleMapper;

	@Override
	public List<Title> queryTitleAll() {
		List<Title> list = titleMapper.queryTitleAll();
		return list;
	}

	@Override
	public Title queryTitleById(Integer id) {
		return titleMapper.queryTitleById(id);
	}
	@Override
	public List<Title> queryHotTitleByAttractionsId(Integer attractionsId) {
		List<Title> list = titleMapper.queryHotTitleByAttractionsId(attractionsId);
		return list;
	}

	@Override
	public List<Title> queryTitleByType(String type) {
		List<Title> list = titleMapper.queryTitleByType(type);
		return list;
	}

	@Override
	public List<Scenicway> findByTitle(String attractions) {
		return titleMapper.findByTitle(attractions);
	}
	@Override
	public List<Title> queryByThemeWithIndentdetails() {
		return titleMapper.queryByThemeWithIndentdetails();
	}

	@Override
	public List<Title> queryByScenicByName(String content, String toPath, Integer attractionsId) {
		return titleMapper.queryByScenicByName(content, toPath, attractionsId);
	}

	@Override
	public List<Title> queryByScenicAndName(Scenic scenic) {
		return titleMapper.queryByScenicAndName(scenic);
	}
}
