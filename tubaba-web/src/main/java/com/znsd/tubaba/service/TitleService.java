package com.znsd.tubaba.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.Title;

/**
 * 
 * @author 黄振伟
 * 
 * @描述 主题分类功能Service接口
 *
 * @时间 2018年10月31日10:25:11
 * 
 */
public interface TitleService {
	
	/**
	 * 查询所有主题分类
	 * @param queryScenicAll 查询所有景点信息
	 * @return 返回包含所有主题信息的list,无数据返回空的list
	 */
	public List<Title> queryTitleAll();
	
	/**
	 * 根据id查询主题
	 * @param id
	 * @return 返回对应id的主题对象，无数据返回空对象
	 */
	public Title queryTitleById(Integer id);
	/**
	 * 查询产品分类的热门主题
	 * @author 尹加豪
	 * @param attractionsId 产品分类
	 * @return 返回产品分类的热门主题信息的list,无数据返回空的list
	 */
	public List<Title> queryHotTitleByAttractionsId(Integer attractionsId);
	/**
	 * 通过主题分类搜索主题信息
	 * @param type 主题分类
	 * @return 返回装载通过主题分类搜索主题信息的list,无数据时返回空的list
	 */
	public List<Title> queryTitleByType(String type);
	
	/**
	 * @author 杨云鹏
	 * @param id:分类id
	 * @return 返回热门主题
	 * */
	public List<Scenicway> findByTitle(String attractions);
	/**
	 *  按景点订单数量查询主题
	 * @author 杨云鹏
	 * */
	public List<Title> queryByThemeWithIndentdetails();
	
	/**
	 * 按景点名称或拼音或城市查询包含该景点的路线主题
	 * @author 杨云鹏
	 * @param content 搜索内容
	 * 	topath:出发城市
	 * attractionsId:分类id
	 */
	public List<Title> queryByScenicByName(@Param("content") String content, @Param("toPath") String toPath,
			@Param("attractionsId") Integer attractionsId);
	
	/**
	 * 按景点名称或拼音或城市查询同城市的景点的主题
	 * @author 杨云鹏
	 * @param Scenic 景点对象
	 */
	public List<Title> queryByScenicAndName(Scenic scenic);
	
}
