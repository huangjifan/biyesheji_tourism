package com.znsd.tubaba.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Cost;
import com.znsd.tubaba.entity.CostExplain;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.PlayMan;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.service.IndentService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月12日 下午10:27:22
 *
 * @描述: 订单功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class IndentTest {
	
	/**
	 * 订单功能service
	 */
	@Autowired
	IndentService indentService;
	
	/**
	 * 增加订单
	 */
	@Test
	public void addIndent() {
		System.out.println("增加订单");
		LinkMan linkMan = new LinkMan();
		linkMan.setId(1);
		Indentdetails indentdetails = new Indentdetails();
		indentdetails.setId(1);
		String ordernumber = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + 10 + (int)((Math.random()*9+1)*1000);
		Indent indent = new Indent(100d,"增加测试1",0,linkMan,null,ordernumber);
		System.out.println(indentService.addIndent(indent));
	}
	
	/**
	 * 提交订单
	 */
	@Test
	public void submitIndent() {
		System.out.println("提交订单");
		
		Scenicway scenicway = new Scenicway();
		scenicway.setId(1);
		scenicway.setWay("测试");
		scenicway.setFloor_price(50d);
		scenicway.setScenicday(5);
		
		Date starttime = new Date();
		Date endtime = new Date();
		
		User user = new User();
		user.setId(1);
		
		Double money = 100d;
		
		Double discountsMoney = 10d;
		
		Indent indent = new Indent();
		indent.setPrice(money);
		indent.setCommodity(scenicway.getWay());
		
		Indentdetails indentdetails = new Indentdetails(new Date(),10,10,scenicway,starttime,endtime,null,user,0,null);
		
		LinkMan linkMan = new LinkMan("测试","12345678911","11@qq.com");
		
		List<PlayMan> playMans = new ArrayList<>();
		PlayMan playMan1 = new PlayMan("测试3","12345678911",null,"431127199905106713");
		PlayMan playMan2 = new PlayMan("测试4","12345678911",null,"431127199905106713");
		playMans.add(playMan1);
		playMans.add(playMan2);
		
		Cost cost = new Cost(discountsMoney,money,null,null);
		
		List<CostExplain> costExplains = new ArrayList<>();
		CostExplain costExplain1 = new CostExplain("基本团费",scenicway.getFloor_price(),1,null);
		CostExplain costExplain2 = new CostExplain("大巴",50d,1,null);
		costExplains.add(costExplain1);
		costExplains.add(costExplain2);
		
		//System.out.println(indentService.submitIndent(user.getId(),indent,indentdetails,linkMan,playMans,cost,costExplains));
	}
	
	/**
	 * 通过伪订单编号查询订单
	 */
	@Test
	public void findByOrdernumber() {
		System.out.println("通过伪订单编号查询订单");
		Indent indent = indentService.findByOrdernumber("20181114103821104423");
		System.out.println(indent);
		//System.out.println(indent.getIndentdetails());
	}
	
	/**
	 * 支付订单
	 */
	@Test
	public void paymentIndent() {
		System.out.println("支付订单");
	}
	
	/**
	 * 通过用户编号和旅游路线编号查询待评论订单
	 */
	@Test
	public void findByUserIdAndScenicwayId() {
		System.out.println("通过用户编号和旅游路线编号查询待评论订单");
		Indent indent = indentService.findByUserIdAndScenicwayId(2, 26);
		System.out.println(indent);
	}
}
