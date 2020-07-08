package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * 费用信息模型类(费用表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Cost implements Serializable {

	public Cost() {
		super();
	}
	
	public Cost(Double concessionsMoney, Double grossAmount, Date paytime, Indent indent) {
		super();
		this.concessionsMoney = concessionsMoney;
		this.grossAmount = grossAmount;
		this.paytime = paytime;
		this.indent = indent;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 优惠金额
	 */
	private Double concessionsMoney;
	/**
	 * 优惠后的金额
	 */
	private Double grossAmount;
	/**
	 * 支付时间
	 */
	private Date paytime;
	/**
	 * 订单信息
	 */
	private Indent indent;
	/**
	 * 费用详细信息set集合
	 */
	private Set<CostExplain> costExplains;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getConcessionsMoney() {
		return concessionsMoney;
	}
	public void setConcessionsMoney(Double concessionsMoney) {
		this.concessionsMoney = concessionsMoney;
	}
	public Double getGrossAmount() {
		return grossAmount;
	}
	public void setGrossAmount(Double grossAmount) {
		this.grossAmount = grossAmount;
	}
	public Date getPaytime() {
		return paytime;
	}
	public void setPaytime(Date paytime) {
		this.paytime = paytime;
	}
	public Indent getIndent() {
		return indent;
	}
	public void setIndent(Indent indent) {
		this.indent = indent;
	}
	public Set<CostExplain> getCostexplains() {
		return costExplains;
	}
	public void setCostexplains(Set<CostExplain> costExplains) {
		this.costExplains = costExplains;
	}
	@Override
	public String toString() {
		return "Cost [id=" + id + ", concessionsMoney=" + concessionsMoney + ", grossAmount=" + grossAmount
				+ ", paytime=" + paytime + "]";
	}
}
