package com.znsd.tubaba.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Collect;

public interface CollectService {
	//查询用户所有收藏
	public List<Collect> findByUserId(Integer userId,Integer pageNum,Integer pageSize);
	//查询用户所有收藏数量
	public Integer findByUserIdCount(Integer userId);
	
	//查询用户的景点收藏
	public List<Collect> findByUserIdAndScenicIdNotNull(Integer userId,Integer pageNum,Integer pageSize);
	//查询用户的景点收藏数量
	public Integer findByUserIdAndScenicIdNotNullCount(Integer userId);
	
	//查询用户所有路线收藏
	public List<Collect> findByUserIdAndScenicwayIdNotNull(Integer userId,Integer pageNum,Integer pageSize);
	//查询用户所有路线收藏数量
	public Integer findByUserIdAndScenicwayIdNotNullCount(Integer userId);
	
	//查询用户所有酒店收藏
	public List<Collect> findByUserIdAndHotelIdNotNull(Integer userId,Integer pageNum,Integer pageSize);
	//查询用户所有酒店收藏数量
	public Integer findByUserIdAndHotelIdNotNullCount(Integer userId);
	
	//查询用户所有的特卖收藏
	public List<Collect> findByUserIdAndActivity(Integer userId,Integer pageNum,Integer pageSize);
	//查询用户所有的特卖收藏数量
	public Integer findByUserIdAndActivityCount(Integer userId);
	
	//删除用户收藏
	public Integer deleteByUserIdAndScenidId(Integer userId,String scenidId,String scenicwayId,String hotelId);
	//删除用户收藏
	public Integer deleteByUserIdAndScenidId2(Integer userId,String scenidId,String scenicwayId,@Param("hotelId") String hotelId);
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
	public Collect queryCollectByUserIdAndScenicIdOrScenicwayId(Integer usreId,Integer scenicId,Integer scenicwayId);
}
