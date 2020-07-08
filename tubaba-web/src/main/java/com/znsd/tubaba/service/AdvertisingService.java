package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Advertising;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月1日 下午12:01:17
 * 
 * @描述: 广告功能service
 */
public interface AdvertisingService {
	/**
	 * 增加广告
	 * @param advertising 广告信息
	 * @return 增加成功返回主键编号,反之返回0
	 */
	public Integer addAdvertising(Advertising advertising);
	
	/**
	 * 通过广告分类编号查询广告信息
	 * @param adverclasId 分类编号
	 * @return 返回装载分类编号对应的广告信息的list,无数据时返回空的list
	 */
	public List<Advertising> queryAdvertisingByAdverclasId(Integer adverclasId);
	
	/**
	 * 查询广告信息
	 * @return 返回广告的全部信息，无数据返回空
	 */
	public  List<Advertising> queryAll();
	
	/**
	 * 通过广告编号查询广告信息
	 * @param 广告编号
	 * @return 返回对应的广告对象，如果没有，则返回空
	 * */
	public Advertising queryAdvertising(Integer id);
	
	/**
	 * 增加广告记录表
	 * */
	public int addAdverOrAdsing(Integer adver,Integer way,Integer advertisingid,Integer scenId,Integer hotel_scenId);
	
	
	/**
	 * 删除指定的广告记录
	 * 删除成功返回被影响的行数
	 * */
	public int deleteAdsing(Integer type,Integer id);
}
