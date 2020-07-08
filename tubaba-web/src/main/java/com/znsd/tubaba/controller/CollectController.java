package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Collect;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.service.CollectService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月9日 下午8:30:52
 * 
 * @描述: 收藏功能controller类
 */
@Controller
public class CollectController {
	
	/**
	 * 收藏功能service
	 */
	@Autowired
	protected CollectService collectService;
	
	/**
	 * 用户添加收藏产品
	 */
	@ResponseBody
	@PostMapping("/collect/insertCollect")
	public Map<String,Object> insertCollect(@RequestParam("userId") Integer userId,@RequestParam(value = "scenicId",required = false) Integer scenicId,@RequestParam(value = "scenicwayId",required = false) Integer scenicwayId){
		System.out.println("用户添加收藏产品 userId:"+userId+",scenicId:"+scenicId+",scenicwayId:"+scenicwayId);
		Collect collect = new Collect();
		User user = new User();
		Scenic scenic = new Scenic();
		Scenicway scenicway = new Scenicway();
		
		user.setId(userId);
		scenic.setId(scenicId);
		scenicway.setId(scenicwayId);
		collect.setUser(user);
		collect.setScenic(scenic);
		collect.setScenicway(scenicway);
		
		int id = collectService.insertCollect(collect);
		
		Map<String,Object> map = new HashMap<>();
		map.put("success", id > 0);
		System.out.println("用户添加收藏产品的结果是:"+map);
		return map;
	}
	
	/**
	 * 用户取消收藏产品
	 */
	@ResponseBody
	@GetMapping("/collect/cancelCollect")
	public Map<String,Object> insertCollect(@RequestParam(value = "scenicId",required = false) String scenicId,@RequestParam(value = "scenicwayId",required = false) String scenicwayId,HttpServletRequest request){
		Integer userId = (Integer) request.getSession().getAttribute("userid");
		System.out.println("用户取消收藏产品 userId:"+userId+",scenicId:"+scenicId+",scenicwayId:"+scenicwayId);
		
		Integer rows = collectService.deleteByUserIdAndScenidId(userId, scenicId, scenicwayId, null);
		
		Map<String,Object> map = new HashMap<>();
		map.put("success", rows > 0);
		System.out.println("用户取消收藏产品的结果是:"+map);
		return map;
	}
	
	/**
	 * 查询用户是否收藏了该产品
	 */
	@ResponseBody
	@GetMapping("/collect/queryCollectByUserIdAndScenicIdOrScenicwayId")
	public Map<String,Object> queryCollectByUserIdAndScenicIdOrScenicwayId(@RequestParam(value = "scenicId",required = false) Integer scenicId,@RequestParam(value = "scenicwayId",required = false) Integer scenicwayId,HttpServletRequest request){
		Integer userId = (Integer) request.getSession().getAttribute("userid");
		System.out.println("查询用户是否收藏了该产品 userId:"+userId+",scenicId:"+scenicId+",scenicwayId:"+scenicwayId);
		
		Collect collect = collectService.queryCollectByUserIdAndScenicIdOrScenicwayId(userId, scenicId, scenicwayId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("isCollect", collect!=null);
		System.out.println("查询用户是否收藏了该产品的结果是:"+map);
		return map;
	}
}
