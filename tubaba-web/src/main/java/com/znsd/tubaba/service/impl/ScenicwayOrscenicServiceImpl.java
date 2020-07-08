package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.ScenicwayOrscenic;
import com.znsd.tubaba.mapper.ScenicwayOrscenicMapper;
import com.znsd.tubaba.service.ScenicwayOrscenicService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月15日 下午4:18:26
 *
 * @描述: 旅游路线景点记录功能service接口
 */
@Service
public class ScenicwayOrscenicServiceImpl implements ScenicwayOrscenicService {
	/**
	 * 旅游路线景点记录功能mapper
	 */
	@Autowired
	ScenicwayOrscenicMapper scenicwayOrscenicMapper;
	
	@Override
	public List<ScenicwayOrscenic> queryScenicwayOrscenicByScenicwayId(Integer scenicwayId) {
		List<ScenicwayOrscenic> list = scenicwayOrscenicMapper.queryScenicwayOrscenicByScenicwayId(scenicwayId);
		return list;
	}
}
