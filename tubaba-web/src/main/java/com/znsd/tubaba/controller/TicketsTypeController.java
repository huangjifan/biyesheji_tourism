package com.znsd.tubaba.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.TicketsType;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.service.IndentService;
import com.znsd.tubaba.service.IndentdetailsService;
import com.znsd.tubaba.service.LinkManService;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.service.admin.TicketsTypeService;


@Controller
public class TicketsTypeController {
	/*
	 * 根据票种和景点查询数据
	 * */
	
	@Autowired
	TicketsTypeService ticketsTypeService;
	
	@Autowired
	ScenicService scenicService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	IndentdetailsService indentdetailsService;
	
	@Autowired
	LinkManService linkManservice;
	
	@Autowired
	IndentService indentService;
	
	@RequestMapping("indentTicket")
	//获取景点id和票种类型
	public String queryTikect(Integer id,String type,Map<String,Object> map) {
		TicketsType ticket =ticketsTypeService.queryTicketsprice(id,type);
		Scenic scenic = scenicService.queryScenicById(id);
		System.out.println(ticket);
		map.put("ticket", ticket);
		map.put("scenic", scenic);
		return "view/user/indent";
	}
	
	public Date updateDate(String date) {
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date da = null;
		try {
			da = sdf.parse(date);
			return da;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return da;	
	}
	

	

	@ResponseBody
	@RequestMapping("addIndent")
	public boolean addIndent(Integer id,String user,String visitTimeInput,String fullName0,
		String mobileLoginText,String idNo0,String txtAmount,String scenic,String txtTotal) {
		User users = userService.queryOneByName(user);
		LinkMan linkman = new LinkMan();
		linkman.setIphone(mobileLoginText);
		linkman.setRealname(fullName0);	
		String ordernumber = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + 10 + (int)((Math.random()*9+1)*1000);
		Indentdetails indentdetails = new Indentdetails(); 
		indentdetails.setCopies(Integer.valueOf(txtAmount));
		indentdetails.setPeopleCount(Integer.valueOf(txtAmount));
		indentdetails.setUser(users);
		Date str = updateDate(visitTimeInput);
		Date endtime=new Date(str.getTime()+24*60*60*1000);
		System.out.println("\n*****"+endtime+"\n");
		indentdetails.setStarttime(str);
		indentdetails.setEndtime(endtime);
		indentdetails.setStatus(0);
		Scenic scenics = scenicService.queryScenicById(Integer.valueOf(scenic));
		indentdetails.setScenic(scenics);	
		indentdetails.setOrderstime(new Date());		
		Indent indent = new Indent();	
		indent.setLinkMan(linkman);
		indent.setIndentdetails(indentdetails);	
		indent.setCommodity(scenics.getScenicname());
		indent.setPrice(Double.valueOf(txtTotal));	
		indent.setOrdernumber(ordernumber);		
		
		return indentdetailsService.submitIndenttails(users, indent, indentdetails, linkman);
		
	}
}	
