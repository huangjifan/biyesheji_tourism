package com.znsd.tubaba.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Travel;
import com.znsd.tubaba.entity.TravelLike;
import com.znsd.tubaba.entity.UserStatus;
import com.znsd.tubaba.service.MySpaceTripService;
import com.znsd.tubaba.service.UserService;

@Controller
public class MySpaceTripController {
	@Autowired
	MySpaceTripService mySpaceTripService;
	@Autowired
	UserService userService;
	
	//上传封面页面
	@RequestMapping("mySecond")
	public String mySecond(HttpServletRequest req,Map<String, Object> map) {
		String tid=req.getParameter("tid");
		map.put("tid", tid);
		return "view/user/mySecond";
	}
	//写游记页面
	@RequestMapping("mywrite")
	public String mywrite(Integer iid,Map<String, Object> map) {
		map.put("iid",iid);
		return "view/user/myWrite";
	}
	//查询我的游记页面
	@RequestMapping("mySpaceTrip")
	public String mySpaceTrip(HttpSession session,String type,Integer pageNum,Map<String,Object> map) {
		int pageSize=5;
		if (type==null) {
			type="ddp";
		}
		if (pageNum==null) {
			pageNum=1;
		}
		Integer userid=(Integer) session.getAttribute("userid");
		if (userid!=null) {
			//我的游记
			if (type.equals("myTravel")) {
				List<Travel> result=mySpaceTripService.myTrip(userid,pageNum,pageSize);
				Page<Travel> pageList = (Page<Travel>) result;
				session.setAttribute("pageList",pageList);
				session.setAttribute("type",type);
				return "view/user/mySpaceTrip";
			}
			//待写的游记
			else if (type.equals("dWrite")) {
				List<Indent> result=mySpaceTripService.notWriteTravel(userid,pageNum,pageSize);
				Page<Indent> pageList = (Page<Indent>) result;
				map.put("pageList",pageList);
				map.put("type",type);
				return "view/user/mySpaceTrip";
			}
			//我写的游记评论
			else {
				return "view/user/mySpaceTrip";
			}
		}
		return "view/user/mySpaceTrip";
	}
	//增加游记
	@RequestMapping("addWrite")
	@ResponseBody
	public String addWrite(HttpServletRequest req,HttpSession session,Integer iid) {
		Integer userid=(Integer) session.getAttribute("userid");
		String theme=req.getParameter("theme");
		String content=req.getParameter("content");
		if (userid!=null) {
			//是否有订单id
			if (iid!=null) {
				Travel travel=new Travel(iid, theme, content, new Date(),userid);
				int result=mySpaceTripService.addWriteAndIndent(travel);
				if (result>0) {
					Travel tid=mySpaceTripService.newTravel();
					return ""+tid.getId();
				}
				else {
					return "false";
				}
			}
			else {
				Travel travel=new Travel(theme,content,new Date(),userid);
				int result=mySpaceTripService.addWrite(travel);
				if (result>0) {
					Travel tid=mySpaceTripService.newTravel();
					return ""+tid.getId();
				}
				else {
					return "false";
				}
			}
		}
		return "nologin";
	}
	//修改游记
	@RequestMapping("editWrite")
	@ResponseBody
	public String editWrite(HttpSession session,HttpServletRequest req,Integer id) {
		String theme=req.getParameter("theme");
		String content=req.getParameter("content");
		Travel travel=new Travel();
		travel.setTitle(theme);
		travel.setContent(content);
		travel.setTime(new Date());
		travel.setId(id);
		int result=mySpaceTripService.alterTravel(travel);
		if (result>0) {
			return "true";
		}
		else {
			return "false";
		}
	}
	//删除游记
	@RequestMapping("delTravel")
	@ResponseBody
	public String delTravel(Integer id) {
		if (id!=null) {
			int one=mySpaceTripService.delCommonById(id);
			int two=mySpaceTripService.delLikeById(id);
			int three=mySpaceTripService.delTravel(id);
			if (three>0) {
				return "true";
			}
			return "false";
		}
		return "false";
	}
	//跳转到修改游记页面
	@RequestMapping("editTravel")
	public String editPage(HttpServletRequest req,Map<String, Object> map) {
		String ids=req.getParameter("id");
		int id=Integer.parseInt(ids);
		Travel result=mySpaceTripService.selectTravelById(id);
		map.put("edit",result);
		return "view/user/editTravel";
	}
	//跳转游记详情页面
	@RequestMapping("travelNote")
	public String travelNote(Integer tid,Map<String, Object> map,HttpSession session) {
		Travel result=mySpaceTripService.selectTravelById(tid);
		//每点击一次增加一次阅读量
		mySpaceTripService.travelViews(tid);
		Integer id=(Integer) session.getAttribute("userid");
		UserStatus userStatus = userService.findByUserid(id);
		map.put("travelNote", result);
		map.put("hair", userStatus.getHair());
		return "view/user/travelNote";
	}
	//游记点赞
	@RequestMapping("/addZan")
	@ResponseBody
	public String addZan(HttpSession session,Integer tid) {
		Integer userid=(Integer) session.getAttribute("userid");
		List<TravelLike> zan=mySpaceTripService.existZan(userid, tid);
		//已经点过赞了直接返回
		if (zan.size()>0) {
			return "exist";
		}
		//没有点赞就添加
		else {
			mySpaceTripService.addzan(userid, tid);
			return "true";
		}
	}
	//
	@RequestMapping("uploadTravelImg")
	public String uploadTravelImg(@RequestParam("file") MultipartFile file,String tid,HttpServletRequest req) throws IllegalStateException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());
        // uploads文件夹位置
        String rootPath = req.getSession().getServletContext().getRealPath("coverimg/uploads/");
        System.out.println("rootpath:------"+rootPath);
        // 原始名称
        String originalFileName = file.getOriginalFilename();
        // 新文件名
        String newFileName = "sliver" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 新文件
        File newFile = new File(rootPath + newFileName);
        // 判断目标文件所在目录是否存在
        if( !newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        System.out.println(newFile);
        // 将内存中的数据写入磁盘
        file.transferTo(newFile);
        Integer id=Integer.parseInt(tid);
        Travel isnull=mySpaceTripService.isCoverImg(id);
        //可以加图片
        if (isnull != null) {
        	mySpaceTripService.addCoverImg("coverimg/uploads/" + newFileName, id);
			return "redirect:mySpaceTrip";
		}
        else {
        	return "view/user/mySecond";
		}
		
	}
	//旅游攻略游记
	@RequestMapping("trip")
	public String trip(Map<String, Object> map,Integer pageNum) {
		//pageNum=(Boolean) null?1:pageNum;
		//游记推荐
		List<Travel> recommend=mySpaceTripService.travelRecommend();
		//游记列表
		List<Travel> result=mySpaceTripService.travelAll(pageNum,5);
		Page<Travel> pageList = (Page<Travel>) result;
		map.put("travelList", pageList);
		map.put("recommend", recommend);
		return "view/user/trip";
	}
	//游记审核标准页面
	@RequestMapping("audit")
	public String audit() {
		return "view/user/tripAudit";
	}
}
