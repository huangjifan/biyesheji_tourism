package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.ScenicwayDepart;
import com.znsd.tubaba.service.ScenicwayDepartService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午10:10:45
 * 
 * @描述: 旅游路线出发时间功能controller类
 */
@Controller
public class ScenicwayDepartController {
	
	/**
	 * 旅游路线出发时间功能service
	 */
	@Autowired
	ScenicwayDepartService scenicwayDepartService;
	
	/**
	 * 通过旅游路线编号查询旅游路线出发时间信息
	 * @param scenicwayId 旅游路线编号
	 * @return 返回装载通过旅游路线编号查询旅游路线出发时间信息的list的map,无数据时返回空的list的map
	 */
	@ResponseBody
	@GetMapping("/scenicwayDepart/queryScenicwayDepartByScenicwayId")
	public Map<String,Object> queryScenicwayDepartByScenicwayId(@RequestParam("scenicwayId") Integer scenicwayId,@RequestParam(value = "year") Integer year,@RequestParam(value = "month") Integer month){
		System.out.println("通过旅游路线编号查询旅游路线出发时间信息 scenicwayId:"+scenicwayId);
		
		List<ScenicwayDepart> list = scenicwayDepartService.queryScenicwayDepartByScenicwayId(scenicwayId,year,month);
		
		Map<String,Object> map = new HashMap<>();
		map.put("data", list);
		System.out.println("返回装载通过旅游路线编号查询旅游路线信息的map的结果是:"+map);
		return map;
	}
}
