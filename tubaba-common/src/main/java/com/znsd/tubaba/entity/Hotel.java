package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 *	酒店信息模型类(酒店表)
 */
public class Hotel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private String address;
	private String iphone;
	private String introduce;
	private String floor_price;
	private Hotelimage hotelimage;
	private Room room;
	private Set<Cost> costs = new HashSet<Cost>(0);
	public String getFloor_price() {
		return floor_price;
	}
	public void setFloor_price(String floor_price) {
		this.floor_price = floor_price;
	}
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIphone() {
		return iphone;
	}
	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Hotelimage getHotelimage() {
		return hotelimage;
	}
	public void setHotelimage(Hotelimage hotelimage) {
		this.hotelimage = hotelimage;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Set<Cost> getCosts() {
		return costs;
	}
	public void setCosts(Set<Cost> costs) {
		this.costs = costs;
	}
}
