package com.znsd.tubaba.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.Coupon;

public interface CouponMapper {
	//查询用户优惠卷
	public List<Coupon> findByUserId(@Param("couponStatus") Integer couponStatus,@Param("userId")Integer userId);
	
	/**
	 * 修改状态
	 */
	public Integer updateState(@Param("couponId")Integer couponId,@Param("couponStatus")Integer couponStatus);
}
