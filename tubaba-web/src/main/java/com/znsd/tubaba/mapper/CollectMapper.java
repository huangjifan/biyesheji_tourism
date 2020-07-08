package com.znsd.tubaba.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Collect;

public interface CollectMapper {
	//查询用户所有收藏
	public List<Collect> findByUserId(Integer userId);
	//查询用户所有数量
	public Integer findByUserIdCount(Integer userId);
	
	//查询用户的景点收藏
	public List<Collect> findByUserIdAndScenicIdNotNull(Integer userId);
	//查询用户的景点收藏数量
	public Integer findByUserIdAndScenicIdNotNullCount(Integer userId);
	
	//查询用户所有路线收藏
	public List<Collect> findByUserIdAndScenicwayIdNotNull(Integer userId);
	//查询用户所有路线收藏数量
	public Integer findByUserIdAndScenicwayIdNotNullCount(Integer userId);
	
	//查询用户所有酒店收藏
	public List<Collect> findByUserIdAndHotelIdNotNull(Integer userId);
	//查询用户所有酒店收藏数量
	public Integer findByUserIdAndHotelIdNotNullCount(Integer userId);
	
	//查询用户所有的特卖收藏
	public List<Collect> findByUserIdAndActivity(Integer userId);
	//查询用户所有的特卖收藏数量
	public Integer findByUserIdAndActivityCount(Integer userId);
	
	//删除用户收藏
	public Integer deleteByUserIdAndScenidId(@Param("userId") Integer userId,@Param("scenidId") String scenidId,@Param("scenicwayId") String scenicwayId,@Param("hotelId") String hotelId);
	//删除用户收藏
	public Integer deleteByUserIdAndScenidId2(@Param("userId") Integer userId,@Param("scenidId") String scenidId,@Param("scenicwayId") String scenicwayId,@Param("hotelId") String hotelId);
	/**
	 * 增加收藏
	 * @author 尹
	 * @param collect 收藏信息
	 * @return 返回新增收藏信息的主键编号
	 */
	public Integer insertCollect(Collect collect);
	
	/**
	 * 通过用户编号和景点编号或旅游路线编号查询收藏信息
	 * @author 尹
	 * @param usreId 用户编号
	 * @param scenicId 景点编号
	 * @param scenicwayId 旅游路线编号
	 * @return 返回装载通过用户编号和旅游路线编号或景点编号查询收藏信息的list，无数据时空的list
	 */
	public Collect queryCollectByUserIdAndScenicIdOrScenicwayId(@Param("userId") Integer userId,@Param("scenicId") Integer scenicId,@Param("scenicwayId") Integer scenicwayId);
}
