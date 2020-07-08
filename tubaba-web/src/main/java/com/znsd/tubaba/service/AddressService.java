package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Address;

/**
 * @author 尹加豪
 *
 * @时间 2018年10月31日 下午7:48:08
 * 
 * @描述: 地址功能service接口
 */
public interface AddressService {
	/**
	 * 通过产品分类id查询旅游景点的热门出发城市
	 * @author 尹加豪
	 * @param attractionsId 产品分类id
	 * @return 返回装载产品分类id查询旅游景点的热门出发城市信息的list,无数据返回空的list
	 */
	public List<Address> findScenicwayHotCityByAttractionsId(Integer attractionsId); 
	/**
	 * 查询指定省份下的所有城市
	 * @param provs 指定省份
	 * @return 返回指定省份下的所有城市,无数据时返回空的list
	 */
	public List<Address> queryProvincesSubCity(Integer ... provs);
	
	/**
	 * 查询所有的省份与城市
	 * @return 返回转载所有省份与城市的list，无数据时返回null
	 */
	public List<Address> queryAddressAll();
	/**
	 * 根据id查询
	 * @param id 参数Id
	 * @return 返回省份或者城市的名称
	 */
	public String queryAddressById(String id);
	/**
	 * 通过地区名称或地区名称的拼音搜索地址信息
	 * @param area 地区名称
	 * @param area_pinyin 地区名称的拼音
	 * @return 返回装载通过地区名称或地区名称的拼音搜索地址信息的list,无数据时返回空的list
	 */
	public List<Address> queryAddressByAreaOrArea_pinyin(String area,String area_pinyin);
	/**
	 * 查询所有的城市
	 * @return 返回装载所有城市的list,无数据返回null
	 */
	public List<Address> queryCityAll();
	
}
