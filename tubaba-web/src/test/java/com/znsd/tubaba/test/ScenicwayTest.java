package com.znsd.tubaba.test;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Scenicimage;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.service.ScenicwayService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月5日 下午8:51:19
 * 
 * @描述: 景点路线测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ScenicwayTest {

	/**
	 * 景点路线service
	 */
	@Autowired
	ScenicwayService scenicwayService;
	
	/**
	 * 通过id查询旅游景点信息
	 */
	@Test
	public void queryById() {
		System.out.println("通过id查询旅游景点信息");
		Scenicway sw = scenicwayService.queryById(22);
		System.out.println(sw);
		System.out.println(sw.getAttractions());
		Iterator<Scenicimage> it = sw.getScenicimages().iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
	}
	
	/**
	 * 通过产品分类id和出发城市查询旅游景点信息并使用好评率排序
	 */
	@Test
	public void findScenicwayByAttractionsIdAndStartpathOrderByFeedback() {
		System.out.println("通过产品分类id和出发城市查询旅游景点信息并使用好评率排序");
		List<Scenicway> list = scenicwayService.findScenicwayByAttractionsIdAndStartpathOrderByFeedback(2,"上海");
		for(Scenicway sw : list) {
			System.out.println(sw);
			System.out.println(sw.getAttractions());
			Iterator<Scenicimage> it = sw.getScenicimages().iterator();
			while(it.hasNext()) {
				System.out.println(it.next());
			}
			/*Iterator<ScenicwayOrscenic> it2 = sw.getScenicwayOrscenics().iterator();
			while(it2.hasNext()) {
				System.out.println(it2.next());
			}
			Iterator<Discounts> it3 = sw.getDiscounts().iterator();
			while(it3.hasNext()) {
				System.out.println(it3.next());
			}*/
		}
	}
	
	@Test
	public void add(){
		Scenicway way = new Scenicway();
		way.setWay("测试数据2");
		int scenicWay = scenicwayService.addScenicWay(way);
		System.out.println(scenicWay);
	}
}
