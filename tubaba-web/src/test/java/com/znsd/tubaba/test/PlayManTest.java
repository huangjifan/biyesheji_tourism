package com.znsd.tubaba.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.PlayMan;
import com.znsd.tubaba.service.PlayManService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午10:52:16
 *
 * @描述: 游玩人功能测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class PlayManTest {
	/**
	 * 游玩人功能Service
	 */
	@Autowired
	PlayManService playManService;
	
	/**
	 * 增加游玩人
	 */
	@Test
	public void addPlayMan() {
		System.out.println("增加游玩人");
		LinkMan linkMan = new LinkMan();
		linkMan.setId(1);
		PlayMan playMan = new PlayMan("测试","12345678911",linkMan,"431127199905106713");
		Integer id = playManService.addPlayMan(playMan);
		System.out.println(id);
	}
	/**
	 * 批量增加游玩人
	 */
	@Test
	public void batchAddPlayMan() {
		System.out.println("批量增加游玩人");
		List<PlayMan> playMans = new ArrayList<>();
		PlayMan playMan1 = new PlayMan("测试3","12345678911",null,"431127199905106713");
		PlayMan playMan2 = new PlayMan("测试4","12345678911",null,"431127199905106713");
		playMans.add(playMan1);
		playMans.add(playMan2);
		System.out.println(playManService.batchAddPlayMan(playMans));
	}
}
