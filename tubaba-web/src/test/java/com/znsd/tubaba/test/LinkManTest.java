package com.znsd.tubaba.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.service.LinkManService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午10:19:15
 *
 * @描述: 联系人功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class LinkManTest {
	/**
	 * 联系人功能service
	 */
	@Autowired
	LinkManService linkManService;
	
	/**
	 * 增加联系人
	 */
	@Test
	public void addLinkMan() {
		System.out.println("增加联系人");
		LinkMan linkMan = new LinkMan("测试2","12345678911","11@qq.com");
		Integer id = linkManService.addLinkMan(linkMan);
		System.out.println(id);
	}
}
