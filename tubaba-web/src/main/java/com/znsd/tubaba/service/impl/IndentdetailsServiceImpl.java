package com.znsd.tubaba.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.mapper.IndentdetailsMapper;
import com.znsd.tubaba.service.IndentService;
import com.znsd.tubaba.service.IndentdetailsService;
import com.znsd.tubaba.service.LinkManService;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.UserService;

@Service
public class IndentdetailsServiceImpl implements IndentdetailsService {
	
	@Autowired
	IndentdetailsMapper indentdetailsMapper;
	
	
	@Autowired
	LinkManService linkManService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ScenicService scenicService;
	
	
	@Autowired
	IndentService indentService;
	//根据id查询订单详情
	@Override
	public Indentdetails findById(Integer id) {
		return indentdetailsMapper.findById(id);
	}

	@Override
	public Integer addIndentdetails(Indentdetails indentdetails) {
		indentdetailsMapper.addIndentdetails(indentdetails);
		Integer id = indentdetails.getId();
		return id;
	}
	
	
	
	/*@Override
	public boolean subIndenttails(Integer userId,String scenic, Indent indent,Indentdetails indentdetails,LinkMan linkMan) {
		//生成联系人
		Integer linkManId = linkManService.addLinkMan(linkMan);
		System.out.println("联系人编号:"+linkManId);
		//查询用户信息
		User user = userService.findById(userId);
		indentdetails.setUser(user);
		Scenic scenics = scenicService.queryScenicById(Integer.valueOf(scenic));
		indentdetails.setScenic(scenics);	
		//生成订单详情
		Integer indentdetailsId = this.addIndentdetails(indentdetails);
		System.out.println("订单详情编号:"+indentdetailsId);
		//生成订单
		indent.setIndentdetails(indentdetails);
		indent.setLinkMan(linkMan);
		Integer indentId = indentService.addIndent(indent);
		System.out.println("订单编号:"+indentId);
		return true;
	}*/
	
	@Transactional
	public boolean submitIndenttails(User user,Indent indent,Indentdetails indentdetails,LinkMan linkMan) {
		this.addIndentdetails(indentdetails);
		linkManService.addLinkMan(linkMan);
		indentService.addIndent(indent);
		return true;
	}
	
	

}
