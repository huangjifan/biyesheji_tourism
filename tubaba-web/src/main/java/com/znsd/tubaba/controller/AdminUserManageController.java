package com.znsd.tubaba.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Admin;
import com.znsd.tubaba.service.AdminService;

/**
 * 后台的各种页面跳转
 * 
 * @author 黄振伟
 * 
 * 2018年10月31日19:58:59
 */
@Controller
public class AdminUserManageController {
	@Autowired
	AdminService adminService;
	
	//跳转到首页，并且获取导航栏
	@RequestMapping("admin-add")
	public String getAdmin() {
		return "admin/admin-add";
	}
	
	
	
	//根据id获取一条数据
	@RequestMapping("admin-edit")
	public String getAdminOne(@RequestParam("admId") int admId,Map<String,Object> map) {	
		Admin admin = adminService.queryState(admId);
		System.out.println(admin);
		map.put("admin",admin);
		return "admin/admin-edit";
	}
	
	//管理员列表
	//读取用户数据
	@RequestMapping("admin-list")
	public String  getPict(Map<String,Object> map) {
		List<Admin> list = adminService.queryAdmin();
		int count = adminService.countAdmin();
		System.out.println(list);
		map.put("adminlist",list);	
		map.put("count", count);
		return "admin/admin-list";
	}

	//添加资讯
	@RequestMapping("article-add")
	public String  articleAdd() {
		return "admin/article-add";
	}
	//添加图片
	@RequestMapping("picture-add")
	public String  pictureAdd() {
		return "admin/picture-add";
	}
	//添加产品
	@RequestMapping("product-add")
	public String  productAdd() {
		return "admin/product-add";
	}
	//添加用户
	@RequestMapping("member-add")
	public String  memberAdd() {
		return "admin/member-add";
	}
	//切换用户
	@RequestMapping("switchAdmin")
	public String switchAdmin(HttpSession session,HttpServletResponse response) throws IOException{
		session.removeAttribute("admin");
		session.invalidate();
		return "redirect:admin_login.jsp";
	}
	//查看个人信息
	@ResponseBody
	@RequestMapping("queryAdmin")
	public Admin queryAdmin(HttpSession session){
		Admin admin = (Admin)session.getAttribute("admin");
		return admin;
	}
	//景点编辑
	@RequestMapping("codeing")
	public String codeing(){
		return "admin/codeing";
	}
	
	//景点删除
	@ResponseBody
	@RequestMapping("active_del")
	public boolean active_del(){
		return true;
	}
}
