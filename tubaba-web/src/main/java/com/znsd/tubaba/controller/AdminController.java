package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.znsd.tubaba.entity.Admin;
import com.znsd.tubaba.entity.Attractions;
import com.znsd.tubaba.entity.Nav;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.service.AdminService;
import com.znsd.tubaba.service.AttractionsService;
import com.znsd.tubaba.service.NavService;
import com.znsd.tubaba.service.ScenicwayService;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.utils.FileUtil;

@Controller
public class AdminController {
	@Autowired
	NavService navser;
	
	@Autowired
	AdminService admser;
	
	@Autowired
	ScenicwayService scenimpl;
	
	@Autowired
	AttractionsService attarser;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	
	//跳转到首页，并且获取导航栏
	@RequestMapping("admin_index")
	public String getAdmin(Map<String, Object> map,HttpSession session) {
		
		Admin admin = (Admin) session.getAttribute("admin");
		Integer permissions = admin.getAdmPermissions();
		
		List<Nav> navlist;
		//权限为0是超级管理员
		if (permissions == 0) {
			navlist = navser.queryNav();
		}else{
			navlist = navser.queryAdminNav(permissions);
		}
		map.put("navlist", navlist);
		
		return "admin/index";
	}
	
	//登录验证
	@ResponseBody
	@RequestMapping("login_validat")
	public boolean login_validat(@RequestParam("adminName") String adminName,
			@RequestParam("adminPass") String adminPass,HttpSession req){
		List<Admin> adminList = admser.queryAdmin();
		for (Admin admin : adminList) {
			if (admin.getAdmName().equals(adminName) && admin.getAdmPass().equals(adminPass)) {
				req.setAttribute("admin", admin);				
				System.out.println("成功");
				return true;
			}
		}
		return false;
	}
	
	//管理员登录
	@RequestMapping("admin_login")
	public String admin_login(String adminName,String adminPass){
		return "redirect:admin_index";
	}
	
	//多图片上传
	@ResponseBody
	@RequestMapping("upload")
	public List<String> upload(@RequestParam("file") MultipartFile[] file,HttpServletRequest request) throws Exception{
		List<String> uploadFile = FileUtil.uploadFile(file, request);
		return uploadFile;
	}
	
	//旅游经景点分类
	@RequestMapping("product-category")
	public String product(Map<String, Object> map){
		List<Attractions> list=attarser.queryAttr();
		map.put("attralist", list);
		map.put("cont", list.size());
		return "admin/product-category";
	}
	
	//景点分类增加页面的跳转
	@RequestMapping("admin-permission-add")
	public String permission() {
		return "admin/admin-permission-add";
	}
	//增加判断类型是否存在
	@ResponseBody
	@RequestMapping(value="checkattr",method=RequestMethod.POST)
	public boolean getCheck(String atrtitle) {
		if(attarser.queryCont(atrtitle)>0) {
			return false;
		}
		return true;
	}
	
	//旅游分类增加方法
	@ResponseBody
	@RequestMapping(value="addtitle")
	public boolean addtitl(Attractions attr,String atrtitle) {
		attr.setAtrtitle(atrtitle);
		if(attarser.addTitl(attr)>0) {
			return true;
		}
		return false;
	}
	
	//删除分类方法
	@ResponseBody
	@RequestMapping("delettitlecheck")
	public boolean delettitle(Integer atid) {
		System.out.println(atid);
		int  index=scenimpl.queryCount(atid);
		if(index>0) {
			return false;
		}
		return true;
	}
	

	
	@RequestMapping(value="user-list",method=RequestMethod.GET)
	//查询所有用户
	public String queryUserAll(Map<String,Object> map) {
		List<User> list = userService.queryUserAll();
		int count = userService.countUser();
		System.out.println(list);
		map.put("userlist",list);	
		map.put("count", count);
		return "admin/user-list";
	}
	
	@RequestMapping("user-add")
	//跳转到增加用户界面
	public String addUser() {
		return "admin/user-add";
	}
	
	//管理员增加
	@RequestMapping(value ="addAdmin",method=RequestMethod.POST)
	public boolean addAdmin(String admName,String admPass, String admPhone,
	String admEmail,String admSex,int admPermissions ) {
		Admin admin = new Admin();		
		admin.setAdmName(admName);
		admin.setAdmPass(admPass);
		admin.setAdmEmail(admEmail);
		admin.setAdmPhone(admPhone);
		admin.setAdmPermissions(admPermissions);
		admin.setAdmSex(admSex);
		admin.setAdmState(0);
		int data = adminService.addAdmin(admin);
		if (data > 0) {
			return true;
		}
		return false;
	}
	
	
	@ResponseBody
	@RequestMapping("updateState")
	//修改管理员状态
	public boolean updateState(int admId) {
		Admin admin = adminService.queryState(admId);
		System.out.println(admin.getAdmState());
		if (admin.getAdmState() == 0) {
			admin.setAdmState(1);
			adminService.updateState(admin);
		}else if(admin.getAdmState() == 1) {
			admin.setAdmState(0);
			adminService.updateState(admin);
		}
		return true;
	}
	
	/**
	 * 修改管理员信息
	 * */
	@ResponseBody
	@RequestMapping("editAdmin")
	public boolean editAdmin(int admId,Admin admin) {
		Admin admins = adminService.queryState(admId);
		admins.setAdmEmail(admin.getAdmEmail());
		admins.setAdmName(admin.getAdmName());
		admins.setAdmPass(admin.getAdmPass());
		admins.setAdmPermissions(admin.getAdmPermissions());
		admins.setAdmPhone(admin.getAdmPhone());
		admins.setAdmSex(admin.getAdmSex());
		adminService.updateState(admins);
		return true;
	}
	
	
	@RequestMapping("user-password-edit")
	public String editUserPass(Integer id,Map<String,Object> map) {
		User user = userService.findById(id);
		map.put("user", user);
		return "admin/user-password-edit";
	}
	
	@ResponseBody
	@RequestMapping("editUserPass")
	public boolean getNewPass(String userpass,Integer id) {
		System.out.println(userpass);
		System.out.println(id);
		int data = userService.updateUser(userpass, id);
		if(data > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	/**
	 * qxl
	 * 用户删除
	 * */
	@ResponseBody
	@RequestMapping(value="/deletuser",method=RequestMethod.POST)
	public boolean getdelet(int userId) {
		if(userService.deleteUser(1, userId,null)>0) {
			return true;
		}
		return false;
	}
	
	/**
	 * qxl
	 * 封号/解封
	 * */
	@ResponseBody
	@RequestMapping(value="/userUpdate",method=RequestMethod.POST)
	public boolean getUpdate(int userId) {
		User user=userService.findById(userId);
		if(user.getType()==0) {
			if(userService.deleteUser(2, userId,null)>0) {
				return true;
			}
		}else if(user.getType()==1){
			if(userService.deleteUser(0, userId,null)>0) {
				return true;
			}
		}else if(user.getType()==2){
			if(userService.deleteUser(0, userId,null)>0) {
				return true;
			}
		}
		return false;
	}
	/**
	 * qxl
	 * 用户模糊查询
	 * */
	
	@ResponseBody
	@RequestMapping(value="queryUserCondition",method=RequestMethod.POST)
	public List<User> queryUserCondition(String strattime,String endtime,String nameorphoneoremail){
		System.out.println(nameorphoneoremail);
		Map<String,Object> map=new HashMap<String,Object>();
        map.put("strattime", strattime);
        map.put("endtime", endtime);
        map.put("username", nameorphoneoremail);
        map.put("iphone", nameorphoneoremail);
        map.put("email", nameorphoneoremail);
        List<User> userlist=userService.queryUserCondition(map);
        return userlist;
	}
	
	/**
	 * qxl
	 * 管理员的模糊查询
	 * */
	@ResponseBody
	@RequestMapping(value="queryUsername",method=RequestMethod.POST)
	public List<Admin> queryAdminUsername(String adminusername){
		Admin admin=new Admin();
		admin.setAdmName(adminusername);
		List<Admin> adminList=admser.queryAdminUsername(admin);
		return adminList;
	}
	
}
