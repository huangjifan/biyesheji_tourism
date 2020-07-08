package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 *	旅游路线套餐信息模型类(旅游路线套餐表)
 */
public class Meal implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private Double price;
	private Hotel hotel;
	private Cost cost;
	private Set<Scenicway> scenicways = new HashSet<Scenicway>(0);
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	public Cost getCost() {
		return cost;
	}
	public void setCost(Cost cost) {
		this.cost = cost;
	}
	public Set<Scenicway> getScenicways() {
		return scenicways;
	}
	public void setScenicways(Set<Scenicway> scenicways) {
		this.scenicways = scenicways;
	}
	
}
