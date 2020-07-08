package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.ScenicwayOrscenic;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月7日 下午9:59:32
 * 
 * @描述: 旅游路线景点记录功能mapper接口
 */
public interface ScenicwayOrscenicMapper {

	/**
	 * 通过旅游路线编号查询旅游路线景点记录
	 * @param scenicwayId
	 * @return 返回装载通过旅游路线编号查询旅游路线景点记录的list,无数据时返回空的list
	 */
	List<ScenicwayOrscenic> queryScenicwayOrscenicByScenicwayId(Integer scenicwayId);
	
	/**
	 * 把路线和景点关联起来
	 * @param wayScenic
	 * @return
	 */
	public Integer updScenicwayOrscenic(ScenicwayOrscenic wayScenic);
	
	/**
	 * 根据景点路线id进行删除
	 * @param wayId 景点路线Id
	 * @return
	 */
	public Integer delScenicwayBywayId(Integer wayId);
	
	
}
