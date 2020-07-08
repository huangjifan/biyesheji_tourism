package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 * 费用详细说明信息模型类(费用详细说明表)
 */
public class CostExplain implements Serializable {

	public CostExplain() {
		super();
	}
	
	public CostExplain(String content, Double price, Integer number, Cost cost) {
		super();
		this.content = content;
		this.price = price;
		this.number = number;
		this.cost = cost;
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
	 * 内容
	 */
	private String content;
	/**
	 * 单价
	 */
	private Double price;
	/**
	 * 数量
	 */
	private Integer number;
	/**
	 * 费用信息
	 */
	private Cost cost;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Cost getCost() {
		return cost;
	}
	public void setCost(Cost cost) {
		this.cost = cost;
	}
	@Override
	public String toString() {
		return "Costexplain [id=" + id + ", content=" + content + ", price=" + price + ", number=" + number + "]";
	}
}
