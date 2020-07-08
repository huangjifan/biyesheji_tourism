package com.znsd.tubaba.activity;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月3日 下午10:40:19
 * 
 * @描述: 满减 每满satisfyMoney元减discountsMoney元(最高立减maxDiscountsMoney元)
 */
public class PromotionArithmeticType extends BaseActivityArithmeticType {
	
	@Override
	public double arithmeticType(Double money) {
		double div = Math.floor(money/satisfyMoney);
		//原价 > 满足金额
		if(div > 0) {
			double finalDiscountsMoney = div * discountsMoney;
			//优惠金额 > 最高优惠金额
			if(maxDiscountsMoney != null && finalDiscountsMoney > maxDiscountsMoney) {
				finalDiscountsMoney = maxDiscountsMoney;
			}
			money -= finalDiscountsMoney;
		}
		return money;
	}
}
