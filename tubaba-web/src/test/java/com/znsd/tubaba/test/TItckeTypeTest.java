package com.znsd.tubaba.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Attractions;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.TicketsType;
import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.service.AttractionsService;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.admin.ScenicstatusService;
import com.znsd.tubaba.service.admin.TicketsTypeService;

/**
 * @author 黄振伟
 *
 * @时间 2018年11月5日 上午9:23:52
 * 
 * @描述: 测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TItckeTypeTest {
	
	@Autowired
	TicketsTypeService ticketsType;
	@Autowired
	ScenicstatusService scenic;
	@Autowired
	ScenicService  scenice;
	@Autowired
	TicketsTypeService tic;
	@Autowired
	AttractionsService attr;
	
	@Test
	public void show(){
		Integer updateTickets = ticketsType.updateTickets("50", 1);
		System.out.println(updateTickets);
	}
	@Test
	public void queryTicketsprice(){
		TicketsType ticketsprice = ticketsType.queryTicketsprice(29, "儿童票");
		//List<TicketsType> queryTicketsById = ticketsType.queryTicketsById(29);
		System.out.println(ticketsprice);
	}
	@Test
	public void updateScenicServicingtime(){
		Integer integer = scenic.updateScenicServicingtime(new Date(), 44);
		System.out.println(integer);
	}
	@Test
	public void queryAttrById(){
		
			Attractions queryOneId = attr.queryOneId(1);
			System.out.println(queryOneId);
	}
}
