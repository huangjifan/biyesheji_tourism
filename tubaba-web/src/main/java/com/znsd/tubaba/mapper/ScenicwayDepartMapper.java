package com.znsd.tubaba.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.ScenicwayDepart;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午9:54:28
 * 
 * @描述: 旅游路线出发时间功能mapper接口
 */
public interface ScenicwayDepartMapper {
	
	/**
	 * 通过旅游路线编号或年份或月份查询旅游路线出发时间信息
	 * @param scenicwayId 旅游路线编号
	 * @param year 年份
	 * @param month 月份
	 * @return 返回装载通过旅游路线编号查询旅游路线出发时间信息的list,无数据时返回空的list
	 */
	List<ScenicwayDepart> queryScenicwayByCondition(@Param("scenicwayId") Integer scenicwayId,@Param("year") Integer year,@Param("month") Integer month);

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
	public Integer insertScenicwayById(@Param("list")List<ScenicwayDepart> list);
}
