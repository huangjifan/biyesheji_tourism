package com.znsd.tubaba.test;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Cost;
import com.znsd.tubaba.service.CostService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午11:17:04
 *
 * @描述: 费用功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class CostTest {
	/**
	 * 费用功能service
	 */
	@Autowired
	CostService costService;
	
	/**
	 * 增加费用
	 */
	@Test
	public void addCost() {
		System.out.println("增加费用");
		Cost cost = new Cost(10d,100d,new Date(),null);
		Integer id = costService.addCost(cost);
		System.out.println(id);
	}
	/**
	 * 通过主键编号查询费用信息
	 */
	@Test
	public void findById() {
		System.out.println("通过主键编号查询费用信息");
		System.out.println(costService.findById(1));
	}
	/**
	 * 修改费用
	 */
	@Test
	public void update() {
		System.out.println("修改费用");
		Cost cost = new Cost();
		cost.setId(1);
		cost.setPaytime(new Date());
		System.out.println(costService.update(cost));
	}
}
