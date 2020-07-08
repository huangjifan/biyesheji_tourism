/**
 * 下午4:15:44TODO
 */
package com.znsd.tubaba.service.impl.admin;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Scenicstatus;
import com.znsd.tubaba.mapper.ScenicstatusMapper;
import com.znsd.tubaba.service.admin.ScenicstatusService;

/**
 * @author 黄振伟
 *
 */
@Service
public class ScenicstatusServiceImpl implements ScenicstatusService {

	@Autowired
	ScenicstatusMapper scenicstatusMapper;

	@Override
	public Integer addScenicImage(Scenicstatus status) {
		return scenicstatusMapper.addScenicstatus(status);
	}
	@Override
	public Scenicstatus queryStatusById(Integer id) {
		return scenicstatusMapper.queryStatusById(id);
	}
	@Override
	public Integer updateScenicServicingtime(Date servicingtime, Integer scenicId) {
		return scenicstatusMapper.updateScenicServicingtime(servicingtime, scenicId);
	}


}
