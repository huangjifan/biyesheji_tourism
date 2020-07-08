package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Advertising;
import com.znsd.tubaba.mapper.AdvertisingMapper;
import com.znsd.tubaba.service.AdvertisingService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月1日 下午12:02:18
 * 
 * @描述: 广告功能service实现类
 */
@Service
public class AdvertisingServiceImpl implements AdvertisingService {
	/**
	 * 广告功能mapper
	 */
	@Autowired
	AdvertisingMapper advertisingMapper;
	
	@Override
	public Integer addAdvertising(Advertising advertising) {
		advertisingMapper.addAdvertising(advertising);
		return advertising.getId();
	}

	@Override
	public List<Advertising> queryAdvertisingByAdverclasId(Integer adverclasId) {
		List<Advertising> list = advertisingMapper.queryAdvertisingByAdverclasId(adverclasId);
		return list;
	}
	/**
	 * 查询广告信息
	 * @return 返回广告的全部信息，无数据返回空
	 */
	@Override
	public List<Advertising> queryAll() {
		return advertisingMapper.queryAll();
	}
	
	
	/**
	 * 通过广告编号查询广告信息
	 * @param 广告编号
	 * @return 返回对应的广告对象，如果没有，则返回空
	 * */
	public Advertising queryAdvertising(Integer id) {
		return advertisingMapper.queryAdvertising(id);
	}
	
	/**
	 * 增加广告记录表
	 * */
	public int addAdverOrAdsing(Integer adver,Integer way,Integer advertisingid,Integer scenId,Integer hotel_scenId) {
		return advertisingMapper.addAdverOrAdsing(adver, way, advertisingid, scenId, hotel_scenId);
	}
	
	/**
	 * 删除指定的广告记录
	 * 删除成功返回被影响的行数
	 * */
	@Override
	public int deleteAdsing(Integer type,Integer id) {
		return advertisingMapper.deleteAdsing(type,id);
	}
}
