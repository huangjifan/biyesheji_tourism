package com.znsd.tubaba.entity;

import java.io.Serializable;

public class TravelLike implements Serializable{

	/**
	 * 游记点赞表
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer userid;
	private Integer travelid;
	private Integer likenum;
	public Integer getLikenum() {
		return likenum;
	}
	public void setLikenum(Integer likenum) {
		this.likenum = likenum;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getTravelid() {
		return travelid;
	}
	public void setTravelid(Integer travelid) {
		this.travelid = travelid;
	}
	@Override
	public String toString() {
		return "TravelLike [id=" + id + ", userid=" + userid + ", travelid=" + travelid + ", likenum=" + likenum + "]";
	}
	
}
