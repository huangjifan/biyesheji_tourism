package com.znsd.tubaba.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.ScenicwayDepart;
import com.znsd.tubaba.entity.ScenicwayOrscenic;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午9:57:59
 * 
 * @描述: 旅游路线出发时间功能service接口
 */
public interface ScenicwayDepartService {
	
	/**
	 * 通过旅游路线编号,年份,月份查询旅游路线出发时间信息
	 * @param scenicwayId 旅游路线编号
	 * @param year 年份
	 * @param month 月份
	 * @return 返回装载通过旅游路线编号查询旅游路线出发时间信息的list,无数据时返回空的list
	 */
	List<ScenicwayDepart> queryScenicwayDepartByScenicwayId(Integer scenicwayId,Integer year,Integer month);
	
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
	
	/**
	 * 通过旅游路线编号查询旅游路线出发时间信息
	 * @param scenicwayId
	 * @return
	 */
	List<ScenicwayDepart> queryScenicwayById(Integer scenicwayId);
	
	/**
	 * 删除旅游路线出发时间信息
	 * @param id
	 * @return
	 */
	public Integer deleteById(@Param("id")Integer id);
	
	/**
	 * 增加旅游路线出发时间信息
	 * @param id
	 * @return
	 */
	public Integer insertScenicwayById(List<ScenicwayDepart> list,Integer id);
	
}
