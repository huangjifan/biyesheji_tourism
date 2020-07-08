package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * 活动形式信息模型类(活动形式表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Activity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String way;
	private Date starttime;
	private Date endtime;
	private Integer state;
	/**
	 * 活动类型表id
	 */
	private Activity_type typeid;
	private Activity_address address;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Activity_type getTypeid() {
		return typeid;
	}
	public void setTypeid(Activity_type typeid) {
		this.typeid = typeid;
	}
	public Activity_address getAddress() {
		return address;
	}
	public void setAddress(Activity_address address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "Activity [id=" + id + ", way=" + way + ", starttime=" + starttime + ", endtime=" + endtime + ", state="
				+ state + "]";
	}
}
