package com.znsd.tubaba.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 *	活动优惠信息模型类(活动优惠表) 
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Discounts implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Activity activity;
	private Scenic scenic;
	private TicketsType ticketsType;
	private HotelScenic hotelScenic;
	private Activity_address activity_address;
	private Scenicway scenicway;
	
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Activity getActivity() {
		return activity;
	}


	public void setActivity(Activity activity) {
		this.activity = activity;
	}


	public Scenic getScenic() {
		return scenic;
	}


	public void setScenic(Scenic scenic) {
		this.scenic = scenic;
	}


	public TicketsType getTicketsType() {
		return ticketsType;
	}


	public void setTicketsType(TicketsType ticketsType) {
		this.ticketsType = ticketsType;
	}


	public HotelScenic getHotelScenic() {
		return hotelScenic;
	}


	public void setHotelScenic(HotelScenic hotelScenic) {
		this.hotelScenic = hotelScenic;
	}


	public Activity_address getActivity_address() {
		return activity_address;
	}


	public void setActivity_address(Activity_address activity_address) {
		this.activity_address = activity_address;
	}


	public Scenicway getScenicway() {
		return scenicway;
	}


	public void setScenicway(Scenicway scenicway) {
		this.scenicway = scenicway;
	}


	@Override
	public String toString() {
		return "Discounts [id=" + id + "]";
	}
}
