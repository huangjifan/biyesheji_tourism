package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.HotelScenic;
import com.znsd.tubaba.mapper.HotelScenicMapper;
import com.znsd.tubaba.service.HotelScenicService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月2日 下午3:27:38
 * 
 * @描述: 酒店+景点功能service实现类
 */
@Service
public class HotelScenicServiceImpl implements HotelScenicService{
	/**
	 * 酒店+景点功能mapper
	 */
	@Autowired
	HotelScenicMapper hotelScenicMapper;
	
	@Override
	public List<HotelScenic> queryHotBotHotelScenic() {
		List<HotelScenic> list = hotelScenicMapper.queryHotBotHotelScenic();
		return list;
	}
	
	@Override
	public List<HotelScenic> queryHotelScenicBySearchScenicname(String scenicname) {
		List<HotelScenic> list = hotelScenicMapper.queryHotelScenicBySearchScenicname(scenicname);
		return list;
	}

	@Override
	public List<HotelScenic> queryHotelScenicBySearchScenicnamePinYin(String scenicname_pinyin) {
		List<HotelScenic> list = hotelScenicMapper.queryHotelScenicBySearchScenicnamePinYin(scenicname_pinyin);
		return list;
	}
	
	/**
	 * 查询所有的景点+酒店信息
	 * 返回景点+酒店的list
	 * */
	@Override
	public List<HotelScenic> queryAll(){
		return hotelScenicMapper.queryAll();
	}
}
