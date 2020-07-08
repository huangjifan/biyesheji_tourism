package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author 石杰
 * 
 * @version 用户记录表
 *
 */
public class Coupon implements Serializable {
	private Integer id;//主键id
	private User user;//用户外键id
	private Double couponMoney;//优惠卷金额
	private Integer couponStatus;//优惠卷状态(0.未使用,1.已使用,2.已过期)
	private Date startTime;//开始时间
	private Date endTime;//结束时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Double getCouponMoney() {
		return couponMoney;
	}
	public void setCouponMoney(Double couponMoney) {
		this.couponMoney = couponMoney;
	}
	public Integer getCouponStatus() {
		return couponStatus;
	}
	public void setCouponStatus(Integer couponStatus) {
		this.couponStatus = couponStatus;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "Userrecord [id=" + id + ", couponMoney=" + couponMoney + ", couponStatus=" + couponStatus
				+ ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
}
