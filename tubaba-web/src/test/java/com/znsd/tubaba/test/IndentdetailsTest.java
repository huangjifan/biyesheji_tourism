package com.znsd.tubaba.test;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.service.IndentdetailsService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午9:53:48
 *
 * @描述: 订单详情功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class IndentdetailsTest {
	/**
	 * 订单详情功能service
	 */
	@Autowired
	IndentdetailsService indentdetailsService;
	
	/**
	 * 增加订单详情
	 */
	@Test
	public void addIndentdetails() {
		System.out.println("增加订单详情");
		Indentdetails indentdetails = new Indentdetails(new Date(),1,1,null,new Date(),new Date(),null,null,0,null);
		Integer id = indentdetailsService.addIndentdetails(indentdetails);
		System.out.println(id);
	}
}
