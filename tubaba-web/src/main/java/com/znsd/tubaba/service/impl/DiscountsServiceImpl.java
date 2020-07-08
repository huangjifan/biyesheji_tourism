package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Discounts;
import com.znsd.tubaba.mapper.DiscountsMapper;
import com.znsd.tubaba.service.DiscountsService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午5:35:17
 * 
 * @描述: 活动记录功能service实现类
 */
@Service
public class DiscountsServiceImpl implements DiscountsService {
	/**
	 * 活动记录功能mapper
	 */
	@Autowired
	DiscountsMapper discountsMapper;
	
	@Override
	public List<Discounts> queryDiscountsByScenicwayIdOrScenicId(Integer scenicwayId, Integer scenicId) {
		List<Discounts> list = discountsMapper.queryDiscountsByScenicwayIdOrScenicId(scenicwayId, scenicId);
		return list;
	}

}
