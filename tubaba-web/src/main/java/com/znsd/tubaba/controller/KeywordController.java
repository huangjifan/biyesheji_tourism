package com.znsd.tubaba.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.znsd.tubaba.entity.Keyword;
import com.znsd.tubaba.service.KeywordService;

@Controller
public class KeywordController {
	@Autowired
	KeywordService keyService;
	
	/**
	 * 关键字管理页面跳转
	 * */
	@RequestMapping("keyword-list")
	public String getKeyJsp(Map<String,Object> map) {
		List<Keyword> keylist=keyService.queryAll();
		map.put("keylist", keylist);
		map.put("count", keylist.size());
		return "admin/keyword-list";
	}
}
