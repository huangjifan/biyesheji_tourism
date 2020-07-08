package com.znsd.tubaba.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.CostExplain;
import com.znsd.tubaba.service.CostExplainService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午11:37:31
 *
 * @描述: 费用详细说明功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class CostExplainTest {
	/**
	 * 费用详细说明功能service
	 */
	@Autowired
	CostExplainService costExplainService;
	
	/**
	 * 增加费用详细说明
	 */
	@Test
	public void addCostExplain() {
		System.out.println("增加费用详细说明");
		CostExplain costExplain = new CostExplain("测hi是",100d,1,null);
		Integer id = costExplainService.addCostExplain(costExplain);
		System.out.println(id);
	}
	
	/**
	 * 批量增加费用详细说明
	 */
	@Test
	public void batchAddCostExplain() {
		System.out.println("批量增加费用详细说明");
		List<CostExplain> list = new ArrayList<>();
		CostExplain costExplain1 = new CostExplain("测3",100d,1,null);
		CostExplain costExplain2 = new CostExplain("测4",100d,1,null);
		list.add(costExplain1);
		list.add(costExplain2);
		Integer rows = costExplainService.batchAddCostExplain(list);
		System.out.println(rows);
	}
}
