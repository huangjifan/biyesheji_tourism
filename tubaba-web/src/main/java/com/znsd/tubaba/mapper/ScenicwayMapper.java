package com.znsd.tubaba.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Scenicway;

public interface ScenicwayMapper {

	/**
	 * 查询所有路线，链接图片表
	 */
	public List<Scenicway> queryByScenwayImage();

	/**
	 * @author 杨云鹏 此方法根据景点和出发地和分类查询路线(不包括当地游)
	 */
	public List<Scenicway> findByScenicsAndStartpath(@Param("content") String content, @Param("toPath") String toPath,
			@Param("attractionsId") Integer attractionsId);

	/**
	 * @author 杨云鹏 此方法根据景点和分类查询路线(当地游)
	 */
	public List<Scenicway> findByScenics(String content, Integer attractionsId);

	// 查询路线表中是否存在此id
	public int queryCount(Integer atrid);

	/**
	 * @author 杨云鹏
	 * @param activityName:活动名称
	 *            frompath:目的地
	 * @return 活动中的热卖排行线路(有目的地)
	 */
	public List<Scenicway> findByActivityAndFrompathDesc(@Param("activityName") String activityName,
			@Param("frompath") String frompath);

	/**
	 * @author 杨云鹏
	 * @return 热卖排行线路
	 */
	public List<Scenicway> findByScenicwayDesc();

	/**
	 * @author 杨云鹏
	 * @return 热卖排行的城市
	 */
	public List<Scenicway> findByCity();

	/**
	 * @author 杨云鹏
	 * @return 活动中热卖排行的城市
	 */
	public List<Scenicway> findByActivityAndCity();

	/**
	 * @author 杨云鹏
	 * @param attractions:分类名称
	 * @return 联合订单表查询分类之后的热卖城市
	 */
	public List<Scenicway> findByIndentdetailsGroupByPath(String attractions);

	/**
	 * @author 杨云鹏
	 * @param attractions:分类名称
	 * @return 联合订单表查询分类之后的热卖路线
	 */
	public List<Scenicway> findByIndentdetails(String attractions);

	/**
	 * @author 杨云鹏
	 * @param title:主题名称
	 *            此方法根据主题查热门路线
	 */
	public List<Scenicway> queryTitleByScenicway(String title);

	/**
	 * 查询所有的路线
	 */
	public List<Scenicway> qureyAll();
	/**
	 * 查询所有已删除的路线
	 * @return
	 */
	public List<Scenicway> queryAllDel();
	
	/**
	 * @author 石杰
	 * 
	 */
	public Scenicway queryById(Integer id);

	/**
	 * 通过产品分类id和出发城市查询旅游景点信息并使用好评率排序
	 * 
	 * @author 尹加豪
	 * @param attractionsId
	 *            产品分类id
	 * @param startpath
	 *            出发城市
	 * @return 返回装载产品分类id和出发城市查询旅游景点信息并使用好评率排序的list,无数据返回空的list
	 */
	public List<Scenicway> findScenicwayByAttractionsIdAndStartpathOrderByFeedback(
			@Param("attractionsId") Integer attractionsId, @Param("startpath") String startpath);
	
	/**
	 * 通过各种条件查询路线
	 * @author 杨云鹏
	 */
	public List<Scenicway> queryScenicwayMoreWhere(@Param("content") String content, @Param("toPath") String toPath,
			@Param("attractionsId") Integer attractionsId,@Param("map")Map<String,Object> map);
	
	/**
	 * 景点路线增加
	 * @param way 路线对象
	 * @return 返回新增数据的主键
	 */
	public int addScenicWay(Scenicway way);
	/**
	 * 修改
	 * @param id
	 * @return
	 */
	public int updateScenicwayStatus(Integer id);
	/**
	 * 修改
	 * @param id
	 * @return
	 */
	public int updateScenicwayArr(Integer id);
	
	/**
	 * 根据路线Id查询路线信息
	 * @param id 路线Id
	 * @return
	 */
	public Scenicway queryScenicwayById(Integer id);
	
	/**
	 * 根据路线id进行数据修改
	 * @param wayid 路线Id
	 * @return
	 */
	public Integer updateScenicway(Scenicway way);
}
