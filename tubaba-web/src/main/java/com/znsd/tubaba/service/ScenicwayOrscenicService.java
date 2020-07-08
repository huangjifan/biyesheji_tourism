package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.ScenicwayOrscenic;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月15日 下午4:16:25
 *
 * @描述: 旅游路线景点记录功能service接口
 */
public interface ScenicwayOrscenicService {
	
	/**
	 * 通过旅游路线编号查询旅游路线景点记录
	 * @param scenicwayId
	 * @return 返回装载通过旅游路线编号查询旅游路线景点记录的list,无数据时返回空的list
	 */
	List<ScenicwayOrscenic> queryScenicwayOrscenicByScenicwayId(Integer scenicwayId);
}
