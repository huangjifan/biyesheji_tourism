package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * @author 石杰
 * 
 * @version 用户记录表
 *
 */
public class Userrecord implements Serializable {
	private Integer id;//主键id
	private User user;//用户表外键id
	private Integer operation;//操作类型(0.消费,1.充值,2.退款,3.提现)
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT-8")
	private Date operationTime;//操作时间
	private Double money;//操作金额
	private Indent indent;//订单外键id(退款时才有订单外键)
	private String paymentAccount;//收款账号(提现时才有)
	private Integer paymentStatus;//收款状态
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
	public Integer getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(Integer paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public Integer getOperation() {
		return operation;
	}
	public void setOperation(Integer operation) {
		this.operation = operation;
	}
	public Date getOperationTime() {
		return operationTime;
	}
	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Indent getIndent() {
		return indent;
	}
	public void setIndent(Indent indent) {
		this.indent = indent;
	}
	public String getPaymentAccount() {
		return paymentAccount;
	}
	public void setPaymentAccount(String paymentAccount) {
		this.paymentAccount = paymentAccount;
	}
	@Override
	public String toString() {
		return "Coupon [id=" + id + ", operation=" + operation + ", operationTime=" + operationTime
				+ ", money=" + money + ", paymentAccount=" + paymentAccount + "]";
	}
}
