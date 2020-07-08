package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Coupon;

public interface CouponService {
	//查询用户优惠卷
	public List<Coupon> findByUserId(Integer couponStatus,Integer userId);
	
	/**
	 * 修改状态
	 */
	public Integer updateState(Integer couponId,Integer couponStatus);
}
