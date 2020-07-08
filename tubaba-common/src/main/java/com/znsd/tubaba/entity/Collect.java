package com.znsd.tubaba.entity;

import java.io.Serializable;

public class Collect implements Serializable {
	
	public Collect() {
		super();
	}
	public Collect(User user, Scenic scenic, Scenicway scenicway) {
		super();
		this.user = user;
		this.scenic = scenic;
		this.scenicway = scenicway;
	}
	
	private static final long serialVersionUID = 2224710856901622888L;
	private Integer id;//收藏id
	private User user;//用户
	private Scenic scenic;//景点
	private Scenicway scenicway;//路线
	private Hotel hotel;//酒店
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
	public Scenic getScenic() {
		return scenic;
	}
	public void setScenic(Scenic scenic) {
		this.scenic = scenic;
	}
	public Scenicway getScenicway() {
		return scenicway;
	}
	public void setScenicway(Scenicway scenicway) {
		this.scenicway = scenicway;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	@Override
	public String toString() {
		return "Collect [id=" + id + ", user=" + user + ", scenic=" + scenic + ", scenicway=" + scenicway + ", hotel="
				+ hotel + "]";
	}
	
}
