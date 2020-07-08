package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 * 景点门票类型
 * */
public class TicketsType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String type;//类型
	private Double price;//价格
	private Scenic scenic;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Scenic getScenic() {
		return scenic;
	}
	public void setScenic(Scenic scenic) {
		this.scenic = scenic;
	}
	@Override
	public String toString() {
		return "TicketsType [id=" + id + ", type=" + type + ", price=" + price + ", scenic=" + scenic + "]";
	}
	
	
}
