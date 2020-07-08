package com.znsd.tubaba.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.znsd.tubaba.entity.Hotel;
import com.znsd.tubaba.mapper.HotelMapper;
import com.znsd.tubaba.service.HotelService;

public class HotelServiceImpl implements HotelService {
	
	@Autowired
	HotelMapper hotelMapper;
	
	/**
	 * 按id单个查询酒店信息，
	 * 返回单个酒店信息对象
	 * */
	@Override
	public Hotel queryOne(Integer id) {
		return hotelMapper.queryOne(id);
	}



	@Override
	public Hotel findById(Integer id) {
		return hotelMapper.findById(id);
	}

}
