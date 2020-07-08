package com.znsd.tubaba.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.UserService;

/**
 * @author 尹加豪
 *
 * @时间 2018年10月30日 下午9:13:44
 * 
 * @描述: 旅游景点功能的测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ScenicTest {
	@Autowired
	ScenicService scenicService;
	
	@Autowired
	UserService userService;
	
	/**
	 * 查询热搜景点信息
	 */
	@Test
	public void queryHotBotScenic(){
		System.out.println("查询热搜景点信息");
		List<Scenic> list = scenicService.queryHotBotScenic();
		for(Scenic sc : list) {
			System.out.println(sc);
		}
	}
	
	/**
	 * 按景点名称模糊查询景点信息
	 */
	@Test
	public void queryScenicBySearchScenicname(){
		System.out.println("按景点名称模糊查询景点信息 ");
		List<Scenic> list = scenicService.queryScenicBySearchScenicname("1");
		for(Scenic sc : list) {
			System.out.println(sc);
		}
	}
	/**
	 * 按景点名称的拼音模糊查询景点信息
	 */
	@Test
	public void queryScenicBySearchScenicnamePinYin(){
		System.out.println("按景点名称的拼音模糊查询景点信息 ");
		List<Scenic> list = scenicService.queryScenicBySearchScenicnamePinYin("s");
		for(Scenic sc : list) {
			System.out.println(sc);
		}
	}
	
	/**
	 * 按景点名称或景点名称的拼音模糊查询景点信息
	 */
	@Test
	public void queryScenicBySearchScenicnameOrScenicnamePinYin(){
		System.out.println("按景点名称的拼音模糊查询景点信息 ");
		List<Scenic> list = scenicService.queryScenicBySearchScenicnameOrScenicnamePinYin("测试", null);
		for(Scenic sc : list) {
			System.out.println(sc);
		}
		list = scenicService.queryScenicBySearchScenicnameOrScenicnamePinYin(null, "ce");
		for(Scenic sc : list) {
			System.out.println(sc);
		}
	}
	
	@Test
	public void inPhoneUpdatePass() {
		String phone = "18603467892";
		String userpass = "shijie1214...";
		Integer result = userService.inPhoneUpdatePass(phone, userpass);
		if(result > 0) {
			System.out.println("true");
		}else {
			System.out.println("false");
		}
	}
	
	@Test
	public void queryByCity(){
		List<Scenic> list = scenicService.queryScenicByCity("深圳市");
		System.out.println("-----------------");
		System.out.println(list);
	}
}
