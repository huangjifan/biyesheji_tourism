package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Coupon;
import com.znsd.tubaba.mapper.CouponMapper;
import com.znsd.tubaba.service.CouponService;

@Service
public class CouponServiceImpl implements CouponService {
	
	@Autowired
	CouponMapper couponMapper;

	//查询用户优惠卷
	@Override
	public List<Coupon> findByUserId(Integer couponStatus,Integer userId) {
		return couponMapper.findByUserId(couponStatus,userId);
	}

	@Override
	public Integer updateState(Integer couponId, Integer couponStatus) {
		return couponMapper.updateState(couponId, couponStatus);
	}

}
