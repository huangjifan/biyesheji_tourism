package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.ScenicwayOrscenic;
import com.znsd.tubaba.service.ScenicwayOrscenicService;

/**
 * 
 * @author 尹加豪
 *
 * @时间 2018年11月15日 下午4:23:49
 *
 * @描述: 旅游路线景点记录功能controller类
 */
@Controller
public class ScenicwayOrscenicController {
	/**
	 * 旅游路线景点记录功能service
	 */
	@Autowired
	protected ScenicwayOrscenicService scenicwayOrscenicService;
	
	/**
	 * 通过旅游路线编号查询旅游路线景点记录
	 * @param scenicwayId 旅游路线编号
	 * @return 返回装载通过旅游路线编号查询旅游路线景点记录的list的map,无数据时返回空的list的map
	 */
	@ResponseBody
	@GetMapping("/scenicwayOrscenic/queryScenicwayOrscenicByScenicwayId")
	public Map<String,Object> queryScenicwayOrscenicByScenicwayId(@RequestParam Integer scenicwayId){
		System.out.println("通过旅游路线编号查询旅游路线景点记录 "+scenicwayId);
		List<ScenicwayOrscenic> list = scenicwayOrscenicService.queryScenicwayOrscenicByScenicwayId(scenicwayId);
		Map<String,Object> map = new HashMap<>();
		map.put("data", list);
		return map;
	}
}
