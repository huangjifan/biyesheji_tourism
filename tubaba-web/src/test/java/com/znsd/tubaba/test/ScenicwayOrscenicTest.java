package com.znsd.tubaba.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.ScenicwayOrscenic;
import com.znsd.tubaba.mapper.ScenicwayOrscenicMapper;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月7日 下午10:17:00
 * 
 * @描述: 旅游路线景点记录功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ScenicwayOrscenicTest {
	
	/**
	 * 旅游路线景点记录功能mapper
	 */
	@Autowired
	ScenicwayOrscenicMapper scenicwayOrscenicMapper;
	
	/**
	 * 通过旅游路线编号查询旅游路线景点记录
	 */
	@Test
	public void queryScenicwayOrscenicByScenicwayId() {
		System.out.println("通过旅游路线编号查询旅游路线景点记录");
		List<ScenicwayOrscenic> list = scenicwayOrscenicMapper.queryScenicwayOrscenicByScenicwayId(1);
		for (ScenicwayOrscenic scenicwayOrscenic : list) {
			System.out.println(scenicwayOrscenic);
		}
	}
	@Test
	public void add(){
		Scenic sc = new Scenic();
		sc.setId(1);
		Scenicway way = new Scenicway();
		way.setId(1);
		
		ScenicwayOrscenic wayScenic = new ScenicwayOrscenic();
		wayScenic.setScenic(sc);
		wayScenic.setScenicway(way);
		wayScenic.setIndex(0);
		
		scenicwayOrscenicMapper.updScenicwayOrscenic(wayScenic);
	}
}
