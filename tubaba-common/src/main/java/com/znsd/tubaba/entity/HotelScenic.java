package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月2日 上午9:59:08
 * 
 * @描述: 酒店+景点信息模型类
 */
public class HotelScenic implements Serializable {

	private static final long serialVersionUID = 2910427171289911010L;
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 酒店+景点介绍
	 */
	private String introduce;
	/**
	 * 价格
	 */
	private Double price;
	/**
	 * 景点信息
	 */
	private Scenic scenic;
	/**
	 * 酒店信息
	 */
	private Hotel hotel;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
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
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	@Override
	public String toString() {
		return "HotelScenic [id=" + id + ", introduce=" + introduce + ", price=" + price + ", scenic=" + scenic
				+ ", hotel=" + hotel + "]";
	}
}
