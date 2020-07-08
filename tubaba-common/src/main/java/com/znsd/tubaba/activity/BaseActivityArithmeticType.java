package com.znsd.tubaba.activity;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月3日 下午10:36:50
 * 
 * @描述: 活动策略基础类
 */
public abstract class BaseActivityArithmeticType {
	/**
	 * 优惠金额
	 */
	protected Double discountsMoney;
	/**
	 * 折扣
	 */
	protected Double discount;
	/**
	 * 满足金额
	 */
	protected Double satisfyMoney;
	/**
	 * 最高优惠金额
	 */
	protected Double maxDiscountsMoney;
	
	/**
	 * 活动的具体优惠返回结果
	 * @param money 原价
	 * @return 返回活动后的优惠价格
	 */
	public abstract double arithmeticType(Double money);

	public Double getDiscountsMoney() {
		return discountsMoney;
	}

	public void setDiscountsMoney(Double discountsMoney) {
		this.discountsMoney = discountsMoney;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Double getSatisfyMoney() {
		return satisfyMoney;
	}

	public void setSatisfyMoney(Double satisfyMoney) {
		this.satisfyMoney = satisfyMoney;
	}

	public Double getMaxDiscountsMoney() {
		return maxDiscountsMoney;
	}

	public void setMaxDiscountsMoney(Double maxDiscountsMoney) {
		this.maxDiscountsMoney = maxDiscountsMoney;
	}
}
