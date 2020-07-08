package com.znsd.tubaba.activity;


/*
 *折扣  满satisfyMoney元打discount折
 **/
public class DiscountActivityArithmecitType extends BaseActivityArithmeticType {

	@Override
	public double arithmeticType(Double money) {
		double div = Math.floor(money/satisfyMoney);
		//原价 > 满足金额
		if(div > 0) {
			//打discount折
			money = money*discount;
		}
		
		return money;
	}

}
