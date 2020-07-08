package com.znsd.tubaba.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.service.TitleService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月6日 上午10:53:34
 * 
 * @描述: 主题功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TitleTest {
	/**
	 * 主题功能service
	 */
	@Autowired
	TitleService titleService;
	
	/**
	 * 查询产品分类的热门主题
	 */
	@Test
	public void queryHotTitleByAttractionsId() {
		System.out.println("查询产品分类的热门主题");
		List<Title> list = titleService.queryHotTitleByAttractionsId(1);
		for (Title title : list) {
			System.out.println(title);
		}
	}
	/**
	 * 通过主题分类搜索主题信息
	 */
	@Test
	public void queryTitleByType() {
		System.out.println("通过主题分类搜索主题信息");
		List<Title> list = titleService.queryTitleByType("都");
		for (Title title : list) {
			System.out.println(title);
		}
	}
}
