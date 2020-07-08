package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.service.TitleService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月6日 上午10:56:18
 * 
 * @描述: 主题功能controller类
 */
@Controller
public class TitleController {
	/**
	 * 主题功能service
	 */
	@Autowired
	TitleService titleService;
	
	/**
	 * 查询产品分类的热门主题
	 * @param attractionsId 产品分类编号
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 返回产品分类的热门主题的list的map,无数据返回空的list的map
	 */
	@ResponseBody
	@GetMapping("/title/queryHotTitleByAttractionsId")
	public Map<String,Object> queryHotTitleByAttractionsId(@RequestParam("attractionsId") Integer attractionsId,@RequestParam(value="rows",required=false)Integer rows,@RequestParam(value="size",required=false) Integer size){
		System.out.println("查询产品分类的热门主题");
		Integer pageNum = rows!=null?rows:1;
        Integer pageSize = size!=null?size:10;
        System.out.println("当前页:"+pageNum);
		System.out.println("每页记录数:"+pageSize);
		
		Page<Title> page = PageHelper.startPage(pageNum, pageSize);
		List<Title> list = titleService.queryHotTitleByAttractionsId(attractionsId);
		Map<String,Object> map = new HashMap<>();
		map.put("total", page.getTotal());
		map.put("data", list);
		System.out.println("查询产品分类的热门主题的结果:"+map);
		return map;
	}
}
