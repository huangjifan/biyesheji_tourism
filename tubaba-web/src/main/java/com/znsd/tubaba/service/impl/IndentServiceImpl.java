package com.znsd.tubaba.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.znsd.tubaba.entity.Cost;
import com.znsd.tubaba.entity.CostExplain;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.PlayMan;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.mapper.IndentMapper;
import com.znsd.tubaba.service.CostExplainService;
import com.znsd.tubaba.service.CostService;
import com.znsd.tubaba.service.CouponService;
import com.znsd.tubaba.service.IndentService;
import com.znsd.tubaba.service.IndentdetailsService;
import com.znsd.tubaba.service.LinkManService;
import com.znsd.tubaba.service.PlayManService;
import com.znsd.tubaba.service.UserService;

@Service
public class IndentServiceImpl implements IndentService {
	
	@Autowired
	IndentMapper indentMapper;
	/**
	 * 订单详情功能service
	 */
	@Autowired
	IndentdetailsService indentdetailsService;
	/**
	 * 联系人功能service
	 */
	@Autowired
	LinkManService linkManService;
	/**
	 * 游玩人功能Service
	 */
	@Autowired
	PlayManService playManService;
	/**
	 * 费用功能service
	 */
	@Autowired
	CostService costService;
	/**
	 * 费用详细说明功能service
	 */
	@Autowired
	CostExplainService costExplainService;
	/**
	 * 用户功能service
	 */
	@Autowired
	UserService userService;
	/**
	 * 优惠卷功能service
	 */
	@Autowired
	CouponService couponService;
	
	@Override
	public Indent findByIndentId(Integer id) {
		return indentMapper.findByIndentId(id);
	}

	@Override
	public List<Indent> findByAll() {
		return indentMapper.findByAll();
	}

	@Override
	public List<Indent> findByType(String type,String indentstatus,Integer userId) {
		return indentMapper.findByType(type,indentstatus,userId);
	}
	
	@Override
	public List<Indent> findByRecently(Integer userId) {
		return indentMapper.findByRecently(userId);
	}

	@Override
	public Integer updateIndentstatus(Integer indentstatus, Integer id,String cancel) {
		return indentMapper.updateIndentstatus(indentstatus, id,cancel);
	}

	/*@Override
	public Set<PlayMan> findByPlayManIndentId(Integer indentId) {
		return indentMapper.findByPlayManIndentId(indentId);
	}*/

	@Override
	public Integer updatestatus(int status, int indentId) {
		return indentMapper.updatestatus(status, indentId);
	}

	public Integer addIndent(Indent indent) {
		indentMapper.addIndent(indent);
		Integer id = indent.getId();
		return id;
	}

	@Transactional
	@Override
	public boolean submitIndent(Integer userId,Indent indent,Indentdetails indentdetails,LinkMan linkMan
			,List<PlayMan> playMans,Cost cost,List<CostExplain> costExplains,Integer couponId) {
		//生成联系人
		Integer linkManId = linkManService.addLinkMan(linkMan);
		System.out.println("联系人编号:"+linkManId);
		//查询用户信息
		User user = userService.findById(userId);
		indentdetails.setUser(user);
		//生成订单详情
		Integer indentdetailsId = indentdetailsService.addIndentdetails(indentdetails);
		System.out.println("订单详情编号:"+indentdetailsId);
		//生成订单
		indent.setIndentdetails(indentdetails);
		indent.setLinkMan(linkMan);
		Integer indentId = this.addIndent(indent);
		System.out.println("订单编号:"+indentId);
		//生成游玩人
		for(PlayMan playMan : playMans) {
			playMan.setLinkMan(linkMan);
		}
		Integer playManNumber = playManService.batchAddPlayMan(playMans);
		System.out.println("新增游玩人个数:"+playManNumber);
		//生成费用
		cost.setIndent(indent);
		Integer costId = costService.addCost(cost);
		System.out.println("费用编号:"+costId);
		//生成费用说明
		for(CostExplain costExplain : costExplains) {
			costExplain.setCost(cost);
		}
		Integer costExplainNumber = costExplainService.batchAddCostExplain(costExplains);
		System.out.println("新增费用说明个数:"+costExplainNumber);
		
		if(couponId != null) {
			couponService.updateState(couponId, 1);
		}
		
		return true;
	}

	@Override
	public Indent findByOrdernumber(String ordernumber) {
		Indent indent = indentMapper.findByOrdernumber(ordernumber);
		return indent;
	}
	
	@Transactional
	@Override
	public Map<String,Object> paymentIndent(Integer userId,Integer pass, Integer indentId) {
		Map<String,Object> map = new HashMap<>();
		boolean flag = false;
		Indent indent = this.findByIndentId(indentId);
		if(userId != null) {
			System.out.println("正常支付。。");
			User user = userService.findById(userId);
			System.out.println(user.getPaymentCode().equals(pass)+","+pass+","+user.getPaymentCode());
			//密码错误
			if(!pass.equals(user.getPaymentCode())) {
				flag = false;
				map.put("success", false);
				map.put("message", "密码错误");
				return map;
			}
			if(user.getMoney() < indent.getPrice()) {
				flag = false;
				map.put("success", false);
				map.put("message", "没钱了,请充值!");
				return map;
			}
			flag = userService.updateUserMoney2(userId, indent.getPrice(), null, 0);
			//增加用户成长值
			Integer integral = (int) (indent.getPrice() / 10);
			userService.addUserIntegral(userId, integral);
		}else {
			System.out.println("假装第三方支付。。");
			if(!pass.equals(123456)) {
				flag = false;
				map.put("message", "密码错误");
				return map;
			}
		}
		
		Cost cost = indent.getCost();
		if(cost != null) {
			cost.setPaytime(new Date());
			flag = costService.update(cost) > 0;
		}
		flag = this.updateIndentstatus(0, indent.getId(), null) > 0;
		map.put("success", flag);
		map.put("message", "支付成功");
		return map;
	}

	@Override
	public void editStatus(int status,int id) {
		// TODO Auto-generated method stub
		indentMapper.editStatus(status, id);
	}

	@Override
	public Indent findByUserIdAndScenicwayId(Integer userId, Integer scenicwayId) {
		Indent indent = indentMapper.findByUserIdAndScenicwayId(userId, scenicwayId);
		return indent;
	}
}
