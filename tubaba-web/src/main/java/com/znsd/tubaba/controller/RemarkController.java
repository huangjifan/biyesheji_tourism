package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Mark;
import com.znsd.tubaba.entity.Remark;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.service.IndentService;
import com.znsd.tubaba.service.RemarkService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午4:46:47
 * 
 * @描述: 评论功能controller类
 */
@Controller
public class RemarkController {
	/**
	 * 评论功能service
	 */
	@Autowired
	RemarkService remarkService;
	/**
	 * 订单功能service
	 */
	@Autowired
	IndentService indentService;
	/**
	 * 通过旅游路线编号或景点编号查询评论信息
	 * @param scenicwayId 旅游路线编号
	 * @param scenicId 景点编号
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 返回装载通过旅游路线编号或景点编号查询评论信息的list的map，无数据时返回空的list的map
	 */
	@ResponseBody
	@GetMapping("/remark/queryRemarkByScenicwayIdOrScenicId")
	public Map<String,Object> queryRemarkByScenicwayIdOrScenicId(@RequestParam(value = "scenicwayId",required = false)Integer scenicwayId,@RequestParam(value = "scenicId",required = false) Integer scenicId,@RequestParam(value = "rows",required = false)Integer rows,@RequestParam(value = "size",required = false) Integer size){
		System.out.println("通过旅游路线编号或景点编号查询评论信息  scenicwayId:"+scenicwayId+",scenicId:"+scenicId);
		Integer pageNum = rows!=null?rows:1;
		Integer pageSize = size!=null?size:10;
		System.out.println("当前页:"+pageNum);
		System.out.println("每页记录数:"+pageSize);
		
		Page<Remark> page = PageHelper.startPage(pageNum, pageSize);
		List<Remark> list = remarkService.queryRemarkByScenicwayIdOrScenicId(scenicwayId, scenicId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("total", page.getTotal());
		map.put("data", list);
		System.out.println("通过旅游路线编号或景点编号查询评论信息的结果是:"+map);
		return map;
	}
	
	/**
	 * 判断用户是否可以评论
	 */
	@ResponseBody
	@GetMapping("/remark/checkUserRemark")
	public Map<String,Object> checkUserRemark(@RequestParam(value = "scenicwayId")Integer scenicwayId
			,HttpServletRequest request){
		//查询用户信息
		Integer userId = (Integer) request.getSession().getAttribute("userid");
		System.out.println("判断用户是否可以评论  scenicwayId:"+scenicwayId);
		Indent indent = indentService.findByUserIdAndScenicwayId(userId, scenicwayId);
		Map<String,Object> map = new HashMap<>();
		map.put("success", indent != null);
		System.out.println("判断用户是否可以评论:"+map);
		return map;
	}
	
	/**
	 * 发表评论
	 */
	@ResponseBody
	@GetMapping("/remark/submitRemark")
	public Map<String,Object> submitRemark(@RequestParam String content,
			@RequestParam Integer number
			,@RequestParam(value = "scenicwayId")Integer scenicwayId
			,HttpServletRequest request){
		//查询用户信息
		Integer userId = (Integer) request.getSession().getAttribute("userid");
		Indent indent = indentService.findByUserIdAndScenicwayId(userId, scenicwayId);
		Remark remark = new Remark();
		User user = new User();
		user.setId(userId);
		remark.setUser(user);
		remark.setContent(content);
		Mark mark = new Mark();
		mark.setId(number);
		remark.setMark(mark);
		System.out.println(mark);
		System.out.println(remark);
		boolean flag = remarkService.sumbitRemark(remark,indent);
		//System.out.println("判断用户是否可以评论  scenicwayId:"+scenicwayId);
		Map<String,Object> map = new HashMap<>();
		map.put("success", flag);
		System.out.println("发表评论:"+map);
		return map;
	}
}
