package com.znsd.tubaba.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Activity;
import com.znsd.tubaba.service.ActivityService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月3日 下午9:22:26
 * 
 * @描述: 活动功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ActivityTest {
	
	/**
	 * 活动功能service
	 */
	@Autowired
	ActivityService activityService;
	/**
	 * 通过活动展示地址编号查询活动信息
	 */
	@Test
	public void queryActivityByActivityAddressId() {
		System.out.println("通过活动展示地址编号查询活动信息");
		List<Activity> list = activityService.queryActivityByActivityAddressId(1);
		for (Activity activity : list) {
			System.out.println(activity);
		}
	}
	/**
	 * 根据id查询活动
	 */
	@Test
	public void queryActivityOne() {
		System.out.println("根据id查询活动");
		Activity activity = activityService.queryActivityOne(1);
		System.out.println("根据id查询活动的结果:"+activity);
		System.out.println(activity.getTypeid());
	}
}
