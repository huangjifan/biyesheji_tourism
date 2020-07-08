package com.znsd.tubaba.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.znsd.tubaba.entity.Collect;
import com.znsd.tubaba.entity.Coupon;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.Member;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.entity.UserStatus;
import com.znsd.tubaba.entity.Userrecord;
import com.znsd.tubaba.service.CollectService;
import com.znsd.tubaba.service.CouponService;
import com.znsd.tubaba.service.IndentService;
import com.znsd.tubaba.service.MemberService;
import com.znsd.tubaba.service.MySpaceCommonService;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.service.UserrecordService;



@Controller
public class MySpaceCommonController {
	@Autowired
	MySpaceCommonService mySpaceCommonService;
	
	@Autowired
	UserService userService;//用户
	
	@Autowired
	CollectService collectService;//收藏
	
	@Autowired
	IndentService indentService;//订单
	
	@Autowired
	UserrecordService userrecordService;//用户消费纪录
	
	@Autowired
	CouponService couponService;//优惠卷
	
	@Autowired
	MemberService memberService;
	
	//我的成长页面
	@RequestMapping("myMemberCenter")
	public String myMemberCenter(Map<String,Object> map,HttpSession session) {
		/*User user = userService.findByEmail("1209237719@qq.com");*/
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		List<Member> list = memberService.findByAll();
		map.put("list", list);
		map.put("users", user);
		return "view/user/myMemberCenter";
	}
	//我的驴妈妈页面
	@RequestMapping("indexdo")
	public String indexdo(HttpSession session,Map<String,Object> map) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		Integer schedule = 10;
		if(user.getRealname() != null && user.getRealname() !="") {
			schedule += 10;
		}
		if(user.getUsername() != null && user.getUsername() != "") {
			schedule += 10;
		}
		if(user.getIphone() != null && user.getIphone() != "") {
			schedule += 10;
		}
		if(user.getEmail() != null && user.getEmail() != "") {
			schedule += 10;
		}
		if(user.getSex() != null && user.getSex() != "") {
			schedule += 10;
		}
		if(user.getBirthday() != null) {
			schedule += 10;
		}
		if(user.getJob() != null) {
			schedule += 10;
		}
		if(user.getMarriage() != null && user.getMarriage() != "") {
			schedule += 10;
		}
		UserStatus userStatus = userService.findByUserid(userId);
		List<Member> list = memberService.findByAll();
		map.put("list", list);
		map.put("userStatus",userStatus);
		map.put("schedule", schedule);
		map.put("users", user);
		return "view/user/indexdo";
	}
	//我的收藏页面
	@RequestMapping("myCollect/{type}/{pageNum}")
	public String myCollect(Map<String,Object> map,@PathVariable String type,@PathVariable Integer pageNum,HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userid");
		Integer pageSize = 12;
		List<Collect> list = new ArrayList<Collect>();//页面输出的收藏
		Integer collectAllCount = collectService.findByUserIdCount(userId);//所有收藏数量
		Integer scenidCollectCount = collectService.findByUserIdAndScenicIdNotNullCount(userId);//景点收藏数量
		Integer scenidwayCollectCount = collectService.findByUserIdAndScenicwayIdNotNullCount(userId);//线路收藏数量
		Integer hotelCollectCount = collectService.findByUserIdAndHotelIdNotNullCount(userId);//酒店收藏数量
		Integer activityCollectCount = collectService.findByUserIdAndActivityCount(userId);//特卖收藏数量
		if("activity".equals(type)) {
			list = collectService.findByUserIdAndActivity(userId,pageNum,pageSize);//特卖收藏
		}else if("scenic".equals(type)) {
			list = collectService.findByUserIdAndScenicIdNotNull(userId,pageNum,pageSize);//景点收藏
		}else if("scenicway".equals(type)) {
			list = collectService.findByUserIdAndScenicwayIdNotNull(userId,pageNum,pageSize);//线路收藏
		}else if("hotel".equals(type)) {
			list = collectService.findByUserIdAndHotelIdNotNull(userId,pageNum,pageSize);//酒店收藏
		}else {
			list = collectService.findByUserId(userId,pageNum,pageSize);//所有收藏
		}
		Page<Collect> pageList = (Page<Collect>) list;
		map.put("pageList", pageList);
		map.put("collectAllCount", collectAllCount);
		map.put("scenidCollectCount", scenidCollectCount);
		map.put("scenidwayCollectCount", scenidwayCollectCount);
		map.put("hotelCollectCount", hotelCollectCount);
		map.put("activityCollectCount", activityCollectCount);
		map.put("type", type);
		return "view/user/myCollect";
	}
		//删除我的收藏
		@ResponseBody
		@RequestMapping("removeCollect")
		public boolean removeCollect(@RequestParam String param,HttpSession session) {
			String scenidId = "";
			String scenicwayId = "";
			String hotelId = "";
			String[] coll = param.split("#");
			for (int i = 0; i < coll.length; i++) {
				if(coll[i].split("-").length > 0) {
					if(coll[i].split("-")[1].equals("scenic")) {
						scenidId += coll[i].split("-")[0] + ",";
					}else if(coll[i].split("-")[1].equals("scenicway")) {
						scenicwayId += coll[i].split("-")[0] + ",";
					}else if(coll[i].split("-")[1].equals("hotel")) {
						hotelId += coll[i].split("-")[0] + ",";
					}
				}
			}
			if(scenidId.length() > 0) {
				scenidId = scenidId.substring(0, scenidId.length() - 1);
			}else {
				scenidId = "''";
			}
			if(scenicwayId.length() > 0) {
				scenicwayId = scenicwayId.substring(0, scenicwayId.length() - 1);
			}else {
				scenicwayId = "''";
			}
			if(hotelId.length() > 0) {
				hotelId = hotelId.substring(0, hotelId.length() - 1);
			}else {
				hotelId = "''";
			}
			Integer userId = (Integer) session.getAttribute("userid");
			Integer result = collectService.deleteByUserIdAndScenidId2(userId, scenidId, scenicwayId, hotelId);
			if(result > 0) {
				return true;
			}
			return false;
		}
	//我的订单页面
	@RequestMapping("myOrder")
	public String myOrder(String type,String indentstatus,Map<String,Object> map,HttpSession session) {
		List<Indent> list = null;
		/*if(type == null ||type.equals("all")) {
			list = indentService.findByAll();
		}else {
			list = indentService.findByType(type,indentstatus);
		}*/
		Integer userId =  (Integer) session.getAttribute("userid");
		list = indentService.findByType(type,indentstatus,userId);
		System.out.println("-------------------------------------list:"+list);
		map.put("indentList", list);
		return "view/user/myOrder";
	}
	//查询订单
	@ResponseBody
	@PostMapping("getIndent")
	public List<Indent> getIndent(String type,String indentstatus,HttpSession session){
		List<Indent> list = null;
		/*if(type == null || type.equals("all")) {
			list = indentService.findByAll();
		}else {
			list = indentService.findByType(type);
		}*/
		Integer userId =  (Integer) session.getAttribute("userid");
		list = indentService.findByType(type,indentstatus,userId);
		return list;
	}
	//查询用户最近订单
	@ResponseBody
	@PostMapping("findByRecently")
	public List<Indent> findByRecently(HttpSession session){
		Integer userId = (Integer) session.getAttribute("userid");
		List<Indent> list = indentService.findByRecently(userId);
		return list;
	}
	
	//修改订单状态
	@ResponseBody
	@GetMapping("updateIndentstatus")
	public boolean updateIndentstatus(@RequestParam("indentstatus") Integer indentstatus,@RequestParam("indentId") Integer indentId,String vause) {
		Integer result = indentService.updateIndentstatus(indentstatus, indentId,vause);
		if(result > 0) {
			return true;
		}
		return false;
	}
	//订单详情页面
	@GetMapping("viewDetail/{id}")
	public String viewDetail(@PathVariable Integer id,Map<String,Object> map) {
		Indent indent = indentService.findByIndentId(id);
		map.put("indent", indent);
		return "view/user/viewDetail";
	}
	//公共顶部页面
	@RequestMapping("mySpaceTop")
	public String mySpaceLeft() {
		return "view/user/mySpaceTop";
	}
	@RequestMapping("mySpaceCommon")
	public String mySpaceCommon(HttpSession session,Map<String, Object> map,Integer pageNum,String type) {
		Integer id=(Integer) session.getAttribute("userid");
		Integer pageSize=2;
		if (id != null) {
			int ddp=mySpaceCommonService.ddp(id);
			int ydp=mySpaceCommonService.ydp(id);
			if (type.equals("ddp")) {
				List<Indentdetails> common=mySpaceCommonService.myCommonAll(id,pageNum,pageSize);
				Page<Indentdetails> pageList = (Page<Indentdetails>) common;
				session.setAttribute("pageList",pageList);
				session.setAttribute("type", type);
			}
			else {
				List<Indentdetails> common=mySpaceCommonService.ydpAll(id,pageNum,pageSize);
				Page<Indentdetails> pageList = (Page<Indentdetails>) common;
				session.setAttribute("pageList",pageList);
				session.setAttribute("type", type);
			}
			map.put("ddp",ddp);
			map.put("ydp",ydp);
		}
		return "view/user/mySpaceCommon";
	}
	//我的问答页面
	@RequestMapping("myQuestions")
	public String myQuestions() {
		return "view/user/myQuestions";
	}
	//我的站内消息页面
	@RequestMapping("myMessage")
	public String myMessage() {
		return "view/user/myMessage";
	}
	//查询我的评论
	/*@RequestMapping("myCommon")
	@ResponseBody
	public List<Indentdetails> myCommon(HttpServletResponse resp,HttpServletRequest req) {
		String userid=req.getParameter("userid");
		int id=Integer.parseInt(userid);
		List<Indentdetails> common=mySpaceCommonService.myCommonAll(id);
		return common;
	}*/
	
	//账户余额页面
	@GetMapping("myAccount/{operation}/{pageNum}")
	public String myAccount(Map<String,Object> map,HttpSession session,@PathVariable("operation")Integer operation,@PathVariable("pageNum")Integer pageNum) {
		session.removeAttribute("code");
		Integer pageSize = 5;
		Integer userId = (Integer) session.getAttribute("userid");
		Integer consumeMoney = userrecordService.findByUserIdMoney(userId, 1);//查询用户充值金额
		Page<Userrecord> pageList = (Page<Userrecord>) userrecordService.findByUserIdAndOperation(userId, operation,pageNum,pageSize);
		User user = userService.findById(userId);
		map.put("operation", operation);
		map.put("users", user);
		map.put("pageList", pageList);
		map.put("consumeMoney", consumeMoney);
		return "view/user/myAccount";
	}
	
	//会员礼包页面
	@GetMapping("myGrowUp/{couponStatus}")
	public String myGrowUp(HttpSession session,Map<String,Object> map,@PathVariable("couponStatus") Integer couponStatus) {
		Integer userId = (Integer) session.getAttribute("userid");
		User user = userService.findById(userId);
		List<Member> list = memberService.findByAll();
		List<Coupon> couponList = couponService.findByUserId(couponStatus,userId);
		System.out.println("xxx:"+couponStatus+","+Arrays.toString(couponList.toArray()));
		map.put("list", list);
		map.put("couponList", couponList);
		map.put("users", user);
		map.put("couponStatus", couponStatus);
		return "view/user/myGrowUp";
	}
}
