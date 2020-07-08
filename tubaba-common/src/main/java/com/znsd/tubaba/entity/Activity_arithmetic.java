package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;


/**
 *	活动算法表
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Activity_arithmetic implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String arithmeticType;
	private Double discountsMoney;
	private Double discount;
	private Double satisfyMoney;
	private Double maxDiscountsMoney;
	
	private Set<Activity_type> activityType;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getArithmeticType() {
		return arithmeticType;
	}

	public void setArithmeticType(String arithmeticType) {
		this.arithmeticType = arithmeticType;
	}

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

	public Set<Activity_type> getActivityType() {
		return activityType;
	}

	public void setActivityType(Set<Activity_type> activityType) {
		this.activityType = activityType;
	}

	@Override
	public String toString() {
		return "Activity_arithmetic [id=" + id + ", arithmeticType=" + arithmeticType + ", discountsMoney="
				+ discountsMoney + ", discount=" + discount + ", satisfyMoney=" + satisfyMoney + ", maxDiscountsMoney="
				+ maxDiscountsMoney + ", activityType=" + activityType + "]";
	}
	
	
}
