/**
 * 下午4:15:44TODO
 */
package com.znsd.tubaba.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Scenicimage;
import com.znsd.tubaba.mapper.ScenicimageMapper;
import com.znsd.tubaba.service.admin.ScenicimageService;

/**
 * @author 黄振伟
 * 
 */
@Service
public class ScenicimageServiceImpl implements ScenicimageService {

	@Autowired
	ScenicimageMapper scenicimageMapper;
	
	@Override
	public Integer addScenicImage(Scenicimage scenimage) {
		return scenicimageMapper.addScenicImage(scenimage);
	}

	@Override
	public List<Scenicimage> queryScenicimageByScenicwayId(Integer scenicwayId) {
		return scenicimageMapper.queryScenicimageByScenicwayId(scenicwayId);
	}

	@Override
	public List<Scenicimage> queryScenicimageByScenicId(Integer scenicId) {
		return scenicimageMapper.queryScenicimageByScenicId(scenicId);
	}

	 
	@Override
	public Integer deleteScenicimageByScenicId(Integer scenicId) {
		return scenicimageMapper.deleteScenicimageByScenicId(scenicId);
	}

	 
	@Override
	public Integer deleteScenicimageByScenicwayId(Integer scenicwayId) {
		return scenicimageMapper.deleteScenicimageByScenicwayId(scenicwayId);
	}

	@Override
	public int deleteScenicimageById(Integer id) {
		return scenicimageMapper.deleteScenicimageById(id);
	}
	
	
}
