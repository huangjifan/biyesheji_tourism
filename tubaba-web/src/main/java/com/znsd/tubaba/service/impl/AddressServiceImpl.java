package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Address;
import com.znsd.tubaba.mapper.AddressMapper;
import com.znsd.tubaba.service.AddressService;

/**
 * @author 尹加豪
 *
 * @时间 2018年10月31日 下午7:49:25
 * 
 * @描述: 地址功能service实现类
 */
@Service
public class AddressServiceImpl implements AddressService {
	/**
	 * 地址功能mapper
	 */
	@Autowired
	protected AddressMapper addressMapper;
	@Override
	public List<Address> findScenicwayHotCityByAttractionsId(Integer attractionsId) {
		List<Address> list = addressMapper.findScenicwayHotCityByAttractionsId(attractionsId);
		return list;
	}
	@Override
	public List<Address> queryProvincesSubCity(Integer... provs) {
		List<Address> list = addressMapper.queryProvincesSubCity(provs);
		return list;
	}

	@Override
	public List<Address> queryAddressAll() {
		return addressMapper.queryAddressAll();
	}

	@Override
	public String queryAddressById(String id) {
		return addressMapper.queryAddressById(id);
	}

	@Override
	public List<Address> queryAddressByAreaOrArea_pinyin(String area, String area_pinyin) {
		List<Address> list = addressMapper.queryAddressByAreaOrArea_pinyin(area,area_pinyin);
		return list;
	}
	
	
	@Override
	public List<Address> queryCityAll() {
		return addressMapper.queryCityAll();
	}
}
