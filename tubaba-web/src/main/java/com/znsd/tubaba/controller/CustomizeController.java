package com.znsd.tubaba.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Coustomize;
import com.znsd.tubaba.service.CoustomizeService;

@Controller
public class CustomizeController {
	
	/**
	 *私人定制 
	 */
	@Autowired
	CoustomizeService coustomizeService;

	//查询私人定制数据
	@ResponseBody
	@RequestMapping("customData")
	public Map<String, Object> ticketsPage(HttpServletRequest request,
			@RequestParam("page") Integer pageindex,
			@RequestParam("limit") Integer pagesize){
		 Map<String, Object> map = new HashMap<>();
		Page<Coustomize> page = PageHelper.startPage(pageindex, pagesize);
		List<Coustomize> scenicList = coustomizeService.queryAll();
		for (Coustomize list : scenicList) {
			System.out.println(list);
		}
		map.put("code", 200);//数据状态200正常，其他错误
		map.put("msg", "");//文本消息
		map.put("count", page.getTotal());//数据总数
		map.put("data", scenicList);//数据
		return map;
	}
	//日期转换
	public Date updateDate(String date) {
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date da = null;
		try {
			da = sdf.parse(date);
			return da;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return da;	
	}
	
	
	//增加一条数据
	@ResponseBody
	@RequestMapping("addCoustom")
	public boolean addCoustom(Coustomize coustomize,@RequestParam("start") String starttime,
		@RequestParam("end") String endtime,
		@RequestParam("username") String username){
		String ordernumber = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + 10 + (int)((Math.random()*9+1)*1000);
		coustomize.setOrdernumber(ordernumber);
		Date start = updateDate(starttime);
		Date end = updateDate(endtime);
		coustomize.setStarttime(start);
		coustomize.setEndtime(end);		
		if(coustomizeService.addCoustomize(coustomize)>0) {
			return true;
		}
		return false;
	}
	
	//删除一条数据
	@ResponseBody
	@RequestMapping("delcous")
	public boolean delcous(int id) {
		Coustomize coustomize = coustomizeService.queryOneId(id);
		coustomizeService.delCustomize(coustomize);
		return true;
	}
	
	
	//根据名字查询一条数据
	@RequestMapping("queryUsername")
	public String queryName(String username,Map<String,Object> map) {	
		List<Coustomize> coustomize = coustomizeService.queryOneName(username);
		map.put("list", coustomize);
		System.out.println(coustomize+"--------");
		return "view/user/companylist";
	}
}
