package com.znsd.tubaba.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.znsd.tubaba.entity.Address;
import com.znsd.tubaba.entity.Job;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.entity.UserStatus;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.utils.FileUtil;

@Controller
public class UserInfoController {
	@Autowired
	UserService userService;
	//安全设置页面
	@GetMapping("securitySettings")
	public String securitySettings(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		UserStatus userStatus = userService.findByUserid(userId);
		map.put("iphone", user.getIphone());
		map.put("email", user.getEmail());
		map.put("paymentCode", user.getPaymentCode());
		map.put("lastLoginDate", userStatus.getLastLoginDate());
		map.put("registertime", userStatus.getRegistertime());
		return "view/user/securitySettings";
	}
	
	//修改登陆密码页面
	@GetMapping("loginPass_update")
	public String loginPass_update(){
		return "view/user/loginPass_update";
	}
	
	//修改手机号页面(验证原手机号)
	@GetMapping("phone_update_1")
	public String phone_update_1(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		map.put("iphone", user.getIphone());
		return "view/user/phone_update_1";
	}
	
	//修改手机号页面(验证新手机号)
	@PostMapping("phone_update_2")
	public String phone_update_2(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		map.put("iphone", user.getIphone());
		map.put("userId", user.getId());
		return "view/user/phone_update_2";
	}
	
	//绑定邮箱页面
	@GetMapping("email_add")
	public String email_add() {
		return "view/user/email_add";
	}
	
	//修改邮箱页面(验证旧邮箱)
	@GetMapping("email_update_1")
	public String email_update_1(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		map.put("email", user.getEmail());
		return "view/user/email_update_1";
	}
	
	//修改邮箱页面(验证新邮箱)
	@PostMapping("email_update_2")
	public String email_update_2(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		map.put("iphone", user.getIphone());
		map.put("userId", user.getId());
		return "view/user/email_update_2";
	}
	
	//增加支付密码页面
	@GetMapping("paymentPassword_add")
	public String paymentPassword_add(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		map.put("userId", user.getId());
		map.put("iphone", user.getIphone());
		return "view/user/paymentPassword_add";
	}
	
	//重置支付密码页面
	@GetMapping("paymentPassword_reset")
	public String paymentPassword_reset(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		map.put("userId", user.getId());
		map.put("iphone", user.getIphone());
		return "view/user/paymentPassword_reset";
	}
	
	//修改支付密码页面
	@GetMapping("paymentPassword_update")
	public String paymentPassword_update(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		map.put("userId", userId);
		return "view/user/paymentPassword_update";
	}
	
	//注销用户页面
	@GetMapping("userLogout")
	public String userLogout(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		map.put("iphone", user.getIphone());
		map.put("userId", userId);
		return "view/user/userLogout";
	}
	
	//常用游客信息页面
	@GetMapping("visitor")
	public String visitor() {
		return "view/user/visitor";
	}
	
	//个人信息页面
	@GetMapping("Personal_information")
	public String Personal_information(Map<String,Object> map,HttpSession session) {
		Integer id=(Integer) session.getAttribute("userid");
		User user=userService.findById(id);
		UserStatus userStatus = userService.findByUserid(id);
		map.put("userinfo", user);
		map.put("hair",userStatus.getHair());
		return "view/user/Personal_information";
	}
	
	//头像设置页面
	@GetMapping("headSet")
	public String headSet(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		UserStatus userStatus = userService.findByUserid(userId);
		map.put("hair",userStatus.getHair());
		return "view/user/headSet";
	}
	
	//修改用户头像
	@ResponseBody
	@PostMapping("oploadHead")
	public Map<String,Object> oploadHead(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpSession session){
		Integer userId = (Integer) session.getAttribute("userid");
		Map<String,Object> map = new HashMap<String,Object>();
		//获取封面图片的路径
		List<String> upload = new ArrayList<String>();
		MultipartFile[] files = {file};
		try {
			upload = FileUtil.uploadFile(files, request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("result", userService.updateUserstatusHair(upload.get(0),userId));
		return map;
	}
	//修改用户名
		@RequestMapping("editUserName")
		@ResponseBody
		public String editUserName(HttpSession session,String newname) {
			Integer id=(Integer) session.getAttribute("userid");
			//查询是否修改过用户名
			int result=userService.editNameExit(id);
			//未修改
			if (result==0) {
				String username=userService.userNameExit(newname);
				//判断用户名是否存在
				if (username==null) {
					userService.editUserName( newname,id);
					session.setAttribute("user", newname);
					return "true";
				}
				else {
					return "ycz";
				}
			}
			//已修改
			else {
				return "false";
			}
		}
		//修改个人信息
		@RequestMapping("editUserInfo")
		@ResponseBody
		public String editUserInfo(HttpSession session,String realname,String sex,String ymd,Integer cityid,Integer job,String marriage) {
			Integer id=(Integer) session.getAttribute("userid");
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = null;
			try {
				date = sdf.parse(ymd);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();;
			}
			System.out.println("-------------"+cityid);
			if (cityid==null) {
				cityid=1;
			}
			User user=userService.findById(id);
			Address address=new Address();
			Job jobs=new Job();
			jobs.setId(job);
			address.setId(cityid);
			user.setAddress(address);
			user.setJob(jobs);
			user.setRealname(realname);
			user.setSex(sex);
			user.setBirthday(date);
			user.setMarriage(marriage);
			user.setId(id);
			user.getAddress().getId();
			System.out.println("user.getAddress().getId();"+user.getAddress().getId());
			System.out.println("user.getJob().getId();"+user.getJob().getId());
			user.getJob().getId();
			int result=userService.editUser(user);
			if (result>0) {
				return "true";
			}
			else {
				return "false";
			}
			
		}
	
}
