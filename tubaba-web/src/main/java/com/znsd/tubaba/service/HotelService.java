package com.znsd.tubaba.service;

import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Hotel;
@Service
public interface HotelService {
	/**
	 * 按id单个查询酒店信息，
	 * 返回单个酒店信息对象
	 * */
	public Hotel queryOne(Integer id);


	//通过id查询酒店
	public Hotel findById(Integer id);
}
