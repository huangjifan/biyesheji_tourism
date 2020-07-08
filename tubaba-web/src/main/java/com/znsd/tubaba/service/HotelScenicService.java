package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.HotelScenic;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月2日 下午3:26:35
 * 
 * @描述: 酒店+景点功能service接口
 */
public interface HotelScenicService {
	/**
	 * 查询热搜酒店+景点信息
	 * @param 无
	 * @return 返回包含热搜酒店+景点信息的list，无数据返回空的list
	 */
	public List<HotelScenic> queryHotBotHotelScenic();
	/**
	 * 按景点名称模糊查询酒店+景点信息
	 * @param scenicname 指定景点名称
	 * @return 返回装载包含指定景点名称的酒店+景点信息的list,无数据返回空的list
	 */
	public List<HotelScenic> queryHotelScenicBySearchScenicname(String scenicname);
	/**
	 * 按酒景点名称的拼音模糊查询酒店+景点信息
	 * @param scenicname_pinyin 指定景点名称的拼音
	 * @return 返回装载包含指定景点名称的拼音的酒店+景点信息的list,无数据返回空的list
	 */
	public List<HotelScenic> queryHotelScenicBySearchScenicnamePinYin(String scenicname_pinyin);
	
	
	/**
	 * 查询所有的景点+酒店信息
	 * 返回景点+酒店的list
	 * */
	public List<HotelScenic> queryAll();
}
