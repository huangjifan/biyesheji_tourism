package com.znsd.tubaba.activity;


/*
 *立减 满足satisfyMoney立减discountsMoney元 
 **/
public class KnockArithmecitType extends BaseActivityArithmeticType{

	@Override
	public double arithmeticType(Double money) {
		//原价 > 满足金额
		double div = Math.floor(money/satisfyMoney);
		if(div > 0) {
			//直接减discountsMoney
			money = money-discountsMoney;
		}
		return money;
	}

}
