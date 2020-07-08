package com.znsd.tubaba.test;


import org.junit.Test;

import com.znsd.tubaba.activity.BaseActivityArithmeticType;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月5日 上午9:23:52
 * 
 * @描述: 活动算术式测试类
 */
public class ActivityArithmeticTypeTest {
	/**
	 * 活动策略
	 */
	BaseActivityArithmeticType activity = null;
	/**
	 * PromotionArithmeticTypeOne活动策略(每满2000元减50元(最高立减500元))
	 */
	@Test
	public void one() {
		try {
			activity = (BaseActivityArithmeticType) Class.forName("com.znsd.tubaba.activity.PromotionArithmeticTypeOne").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(activity.arithmeticType(42010d));
	}
	/**
	 * PromotionArithmeticTypeTwo活动策略(每满1000元减10元(最高立减100元))
	 */
	@Test
	public void two() {
		try {
			activity = (BaseActivityArithmeticType) Class.forName("com.znsd.tubaba.activity.PromotionArithmeticTypeTwo").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(activity.arithmeticType(42010d));
	}
}
