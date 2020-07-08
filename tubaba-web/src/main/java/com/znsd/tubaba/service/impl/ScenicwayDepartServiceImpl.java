package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.znsd.tubaba.entity.ScenicwayDepart;
import com.znsd.tubaba.entity.ScenicwayOrscenic;
import com.znsd.tubaba.mapper.ScenicwayDepartMapper;
import com.znsd.tubaba.mapper.ScenicwayOrscenicMapper;
import com.znsd.tubaba.service.ScenicwayDepartService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午9:58:42
 * 
 * @描述: 旅游路线出发时间功能service实现类
 */
@Service
public class ScenicwayDepartServiceImpl implements ScenicwayDepartService {
	
	/**
	 * 旅游路线出发时间功能mapper
	 */
	@Autowired
	ScenicwayDepartMapper scenicwayDepartMapper;
	/**
	 * 景点路线和景点关联的mapper
	 */
	@Autowired
	ScenicwayOrscenicMapper scenicwayOrscenicMapper;
	
	@Override
	public List<ScenicwayDepart> queryScenicwayDepartByScenicwayId(Integer scenicwayId,Integer year,Integer month) {
		List<ScenicwayDepart> list = scenicwayDepartMapper.queryScenicwayByCondition(scenicwayId,year,month);
		return list;
	}

	 
	@Override
	public Integer updScenicwayOrscenic(ScenicwayOrscenic wayScenic) {
		return scenicwayOrscenicMapper.updScenicwayOrscenic(wayScenic);
	}


	 
	@Override
	public Integer delScenicwayBywayId(Integer wayId) {
		return scenicwayOrscenicMapper.delScenicwayBywayId(wayId);
	}


	@Override
	public List<ScenicwayDepart> queryScenicwayById(Integer scenicwayId) {
		return scenicwayDepartMapper.queryScenicwayById(scenicwayId);
	}
	
	@Override
	public Integer deleteById(Integer id) {
		return scenicwayDepartMapper.deleteById(id);
	}


	@Transactional
	@Override
	public Integer insertScenicwayById(List<ScenicwayDepart> list,Integer id) {
		scenicwayDepartMapper.deleteById(id);
		return scenicwayDepartMapper.insertScenicwayById(list);
	}

}
