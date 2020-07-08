package com.znsd.tubaba.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Activity_address;
import com.znsd.tubaba.service.ActivityAddressService;



@Controller
public class ActivityAddressControlle {

	/**
	 *活动显示所有操作 
	 */
	@Autowired
	ActivityAddressService activityAddressService; 
	
	//活动分类查询
	@RequestMapping("activity-address")
	public String queryActivityType(Map<String,Object> map) {
		List<Activity_address> list = activityAddressService.queryAddress();
		int count = list.size();
		map.put("actlist", list);
		map.put("count",count);
		return "admin/activity-address";
	}	
	
	//跳转到增加页面
	@RequestMapping("activity-address-add")
	public String getActivityType(Map<String,Object> map) {
		List<Activity_address> list = activityAddressService.queryAddress();
		map.put("actlist", list);
		return "admin/activity-address-add";
	}
	
	
	/**
	 * 判断是否存在
	 * */
	@ResponseBody
	@RequestMapping("chekact")
	public boolean  getChekact(String name) {
		if(activityAddressService.queryOneAct(name)>0) {
			return false;
		}
		return true;
	}
	
	
	/**
	 * 活动分类增加
	 * */
	@ResponseBody
	@RequestMapping("addType")
	public boolean addType(Integer upid,String name) {
		if(upid==null) {
			upid=0;
		}
		Activity_address adverclas=new Activity_address();
		adverclas.setName(name);
		adverclas.setUpid(upid);
		if(activityAddressService.addAct(adverclas)>0) {
			return true;
		}
		return false;
	}
	
	/**
	 * 活动删除判断
	 * */
	@ResponseBody
	@RequestMapping(value="delType",method=RequestMethod.POST)
	public boolean delType(Integer id) {
		System.out.println("------------"+id);
		if(activityAddressService.queryatredId(id)>0) {
			return false;
		}
		return true;
	}
	
	/**
	 * 活动分类删除（修改状态）
	 * */
	@ResponseBody
	@RequestMapping(value="delact",method=RequestMethod.POST)
	public boolean deleteadver(Integer id) {
		if(activityAddressService.deleteAct(1, id)>0) {
			return true;
		}
		return false;
	}
	
	@RequestMapping("activity-address-edit")
	public String getEdit(@RequestParam("id") Integer id,Map<String, Object> object) {
		Activity_address act=activityAddressService.queryOneId(id);
		List<Activity_address> actlist=activityAddressService.queryAddress();
		object.put("actlist", actlist);
		object.put("act", act);
		return "admin/activity-address-edit";
	}
	
	@ResponseBody
	@RequestMapping("editType")
	public boolean editAdver(Integer upid,String name,Integer id) {
		Activity_address act=new Activity_address();
		act.setId(id);
		act.setName(name);
		act.setUpid(upid);
		if(activityAddressService.updateact(act)>0) {
			return true;
		}
		return false;
	}
}
