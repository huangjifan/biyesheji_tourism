/**
 * 下午3:57:31TODO
 */
package com.znsd.tubaba.mapper;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.znsd.tubaba.entity.Scenicimage;

/**
 * @author 黄振伟
 * @Describe 景点图片Mapper
 * @Time 2018年11月6日16:13:44
 */
public interface ScenicimageMapper {  
	
	/**
	 * 增加景点图片
	 * @return 返回增加数据的主键
	 */
	public Integer addScenicImage(Scenicimage sceImage);
	/**
	 * 通过景点线路编号查询景点图片
	 * @param scenicwayId
	 * @return 返回装载景点线路编号查询景点图片的list,无数据返回空的list
	 */
	public List<Scenicimage> queryScenicimageByScenicwayId(@Param("scenicwayId")Integer scenicwayId);
	
	/**
	 * 通过景点编号查询景点图片
	 * @param scenicId
	 * @return 返回装载景点线路编号查询景点图片的list,无数据返回空的list
	 */
	public List<Scenicimage> queryScenicimageByScenicId(Integer scenicId);
	

	/**
	 * 通过景点编号删除所有图片
	 * @param scenicId 景点id
	 * @return 返回受影响的行数
	 */
	public Integer deleteScenicimageByScenicId(Integer scenicId);
	/**
	 * 通过景点编号删除所有图片
	 * @param scenicId 景点id
	 * @return 返回受影响的行数
	 */
	public Integer deleteScenicimageByScenicwayId(Integer scenicwayId);
	
	
	/**
	 * 根据id删除图片
	 * */
	public int deleteScenicimageById(Integer id);
}
