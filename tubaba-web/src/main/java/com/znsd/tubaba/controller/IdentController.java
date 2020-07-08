/**
 * 下午8:56:28TODO
 */
package com.znsd.tubaba.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.PlayMan;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.entity.Userrecord;
import com.znsd.tubaba.service.IndentService;
import com.znsd.tubaba.service.IndentdetailsService;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.service.UserrecordService;

/**
 * @author 黄振伟
 * @Time  2018年11月13日20:57:21
 */
@Controller
public class IdentController {
	
	
	/**
	 * 订单功能service
	 */
	@Autowired
	IndentService indentService;
	/**
	 * 订单详情
	 */
	@Autowired
	IndentdetailsService indentdetailsService;
	/**
	 * 用户
	 */
	@Autowired
	UserService userService;
	/**
	 * 用户记录
	 */
	@Autowired
	UserrecordService userrecordService;
	/**
	 * 
	 */
	@RequestMapping("conding")
	public String conding(){
		return "admin/codeing";
	}
	/**
	 * 进入到订单管理页面
	 */
	@RequestMapping("ident-list")
	public String ident_list(Map<String, Object> map){
		List<Indent> identList = indentService.findByAll();
		for (Indent indent : identList) {
			System.out.println(indent);
		}
		
		map.put("data", identList);//数据
		
		return "admin/ident-list";
	}
	
	/**
	 * 获取订单详细信息
	 */
	@RequestMapping("queryAllIdent")
	public String queryAllIdent(@RequestParam("id") Integer id,
			Map<String, Object> map,HttpSession session){
		Indent indent = indentService.findByIndentId(id);
		System.out.println("-----  订单详细信息  ------");
		System.out.println(indent);
		Indentdetails details = indent.getIndentdetails();
		Set<PlayMan> playMan = indent.getLinkMan().getPlayMans();
		User user = details.getUser();
		session.setAttribute("user", user);
		
		map.put("indent", indent);
		map.put("playMan", playMan);
		return "admin/detailedIdent";
	}
	
	/**
	 * 确认退款
	 */
	@ResponseBody
	@RequestMapping("refund")
	public boolean refund(@RequestParam("id") Integer id,HttpSession session
			,@RequestParam("price") Double price,@RequestParam("cancel") String cancel){
		System.out.println("-----------"+id);
		indentService.updateIndentstatus(4, id, cancel);
		User user = (User)session.getAttribute("user");
		if(user!=null)
		{
			userService.updateMoney(price,user.getId());
			Userrecord cord = new Userrecord();
			cord.setUser(user);
			cord.setOperation(2);
			cord.setOperationTime(new Date());
			Indent ind = new Indent();
			ind.setId(id);
			cord.setIndent(ind);
			cord.setMoney(price);
			userrecordService.insertUserrecord(cord);
			System.out.println("退款成功-------------------------");
			return true;
			
		}
		return false;
	}
}
