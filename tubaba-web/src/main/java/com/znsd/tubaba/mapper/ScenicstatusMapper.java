package com.znsd.tubaba.mapper;

import java.util.Date;

import com.znsd.tubaba.entity.Scenicstatus;

/**
 * @author 黄振伟
 * @Describe 景点状态Mapper
 * @Time 2018年11月6日16:13:44
 */
public interface ScenicstatusMapper {
	
	/**
	 * 增加景点状态
	 * @return 返回增加数据的主键
	 */
	public Integer addScenicstatus(Scenicstatus status);
	
	/**
	 * 更加景点id查询景点状态
	 * @param id景点id
	 * @return 返回对应景点的状态
	 */
	public Scenicstatus queryStatusById(Integer id);
	
	/**
	 * 根据景点id修改维护时间
	 * @param servicingtime 维护时间
	 * @param scenicId	景点id
	 * @return
	 */
	public Integer updateScenicServicingtime(Date servicingtime,Integer scenicId);
}
