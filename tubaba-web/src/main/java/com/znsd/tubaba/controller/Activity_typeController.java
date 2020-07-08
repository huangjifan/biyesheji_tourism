package com.znsd.tubaba.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Activity_arithmetic;
import com.znsd.tubaba.entity.Activity_type;
import com.znsd.tubaba.service.Activity_arithmeticService;
import com.znsd.tubaba.service.Activity_typeService;

@Controller
public class Activity_typeController {
	/**
	 * 活动类型操作/
	 */
	@Autowired
	Activity_typeService activity_type;
	
	@Autowired
	Activity_arithmeticService activity_arith;
	
	/**
	 * 读取数据
	 */
	@RequestMapping("activity-type-list")
	public String getActivity_type(Map<String,Object> map) {
		List<Activity_type> activity = activity_type.queryType();
		int count = activity_type.countType();
		map.put("activity",activity);
		map.put("count",count);
		return "admin/activity-type-list";
	}
	
	/**
	 *跳转到增加活动类型页面
	 */
	@RequestMapping("activity-type-add")
	public String getAddAct() {
		return "admin/activity-type-add";
	}
	
	@Transactional
	public void add(Activity_type actType,Activity_arithmetic actArith) {
		actType.setArithmeticid(actArith);
		activity_type.addType(actType);
		activity_arith.addArith(actArith);
	}	
	/**
	 * 增加数据
	 */	
/*	@ResponseBody
	@RequestMapping(value="addActType",method=RequestMethod.POST)
	public boolean addActType(Activity_type actType,Activity_arithmetic actArith) {	
		return true;
	}*/
	
	
	/**
	 * 删除活动
	 **/
	@ResponseBody
	@RequestMapping(value="delActType")
	public boolean delActType(int id) {
		Activity_type actType = activity_type.queryTypeOne(id);
		int data = activity_type.delActTyp(actType);
		if (data > 0) {
			return true;
		}		
		return false;
	}

}
