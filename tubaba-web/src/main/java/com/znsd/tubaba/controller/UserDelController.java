package com.znsd.tubaba.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.service.UserService;

@Controller
public class UserDelController {

	@Autowired
	UserService userService;
	
	@RequestMapping("user-del")
	public String getUser(Map<String,Object> map) {
		List<User> list = userService.queryUserAll();
		map.put("userlist", list);
		return "admin/user-del";
	}
}
