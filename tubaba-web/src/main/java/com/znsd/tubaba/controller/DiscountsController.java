package com.znsd.tubaba.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.activity.BaseActivityArithmeticType;
import com.znsd.tubaba.entity.Activity_arithmetic;
import com.znsd.tubaba.entity.Discounts;
import com.znsd.tubaba.service.DiscountsService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月14日 下午11:56:36
 *
 * @描述: 活动记录功能controller
 */
@Controller
public class DiscountsController {
	/**
	 * 活动记录功能service
	 */
	@Autowired
	DiscountsService discountsService;
	
	/**
	 * 通过旅游路线编号或景点编号查询活动记录信息
	 * @param scenicwayId 旅游路线编号
	 * @param scenicId 景点编号
	 * @return 返回装载通过旅游路线编号或景点编号查询活动记录信息的list的map，无数据时返回空的list的map
	 */
	@ResponseBody
	@GetMapping("/discounts/queryDiscountsByScenicwayIdOrScenicId")
	public Map<String,Object> queryDiscountsByScenicwayIdOrScenicId(@RequestParam(value = "scenicId",required = false) Integer scenicId,@RequestParam(value = "scenicwayId",required = false) Integer scenicwayId){
		List<Discounts> list = discountsService.queryDiscountsByScenicwayIdOrScenicId(scenicwayId, scenicId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("data", list);
		return map;
	}
	
	/**
	 * 通过旅游路线编号或景点编号查询活动记录信息并
	 * @param scenicwayId 旅游路线编号
	 * @param scenicId 景点编号
	 * @return 返回装载通过旅游路线编号或景点编号查询活动记录信息的list的map，无数据时返回空的list的map
	 */
	@ResponseBody
	@GetMapping("/discounts/queryDiscountsByScenicwayIdOrScenicIdAndMoney")
	public Map<String,Object> queryDiscountsByScenicwayIdOrScenicIdAndMoney(@RequestParam(value = "scenicId",required = false) Integer scenicId,@RequestParam(value = "scenicwayId",required = false) Integer scenicwayId,@RequestParam Double totalPrice){
		List<Discounts> list = discountsService.queryDiscountsByScenicwayIdOrScenicId(scenicwayId, scenicId);
		List<Double> moneys = new ArrayList<>();
		for (Discounts discounts : list) {
			Activity_arithmetic activity_arithmetic = discounts.getActivity().getTypeid().getArithmeticid();
			BaseActivityArithmeticType baseActivityArithmeticType = null;
			try {
				baseActivityArithmeticType = (BaseActivityArithmeticType)Class.forName(activity_arithmetic.getArithmeticType()).newInstance();
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
			baseActivityArithmeticType.setDiscount(activity_arithmetic.getDiscount());
			baseActivityArithmeticType.setDiscountsMoney(activity_arithmetic.getDiscountsMoney());
			baseActivityArithmeticType.setMaxDiscountsMoney(activity_arithmetic.getMaxDiscountsMoney());
			baseActivityArithmeticType.setSatisfyMoney(activity_arithmetic.getSatisfyMoney());
			
			Double money = baseActivityArithmeticType.arithmeticType(totalPrice);
			moneys.add(totalPrice - money);
			System.out.println("totalPrice:"+totalPrice+",money:"+money+","+(totalPrice - money));
		}
		Map<String,Object> map = new HashMap<>();
		map.put("data", list);
		map.put("discountsMoney", moneys);
		return map;
	}
}
