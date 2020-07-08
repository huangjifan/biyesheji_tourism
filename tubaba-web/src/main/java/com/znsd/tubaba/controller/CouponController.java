package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Coupon;
import com.znsd.tubaba.service.CouponService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月15日 下午10:21:20
 *
 * @描述: 优惠卷功能controller
 */
@Controller
public class CouponController {
	/**
	 * 优惠卷功能service
	 */
	@Autowired
	protected CouponService couponService;
	
	/**
	 * 通过用户编号查询优惠卷信息
	 */
	@ResponseBody
	@GetMapping("/coupon/queryUserCoupon")
	public Map<String,Object> queryUserCoupon(HttpServletRequest request){
		System.out.println("通过用户编号查询优惠卷信息");
		//查询用户信息
		Integer userId = (Integer) request.getSession().getAttribute("userid");
		
		List<Coupon> list = couponService.findByUserId(0, userId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("data", list);
		System.out.println("通过用户编号查询优惠卷信息 map:"+map);
		return map;
	}
}
