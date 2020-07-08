package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;

public class Coustomize implements Serializable{

	/**
	 * 私人定制
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String startcity;
	private String endcity;
	private Date starttime;
	private Date endtime;
	private Integer people;
	private Integer budget;
	private String email;
	private String phone;
	private String name;
	private Integer state;
	private String username;
	private String ordernumber;
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStartcity() {
		return startcity;
	}
	public void setStartcity(String startcity) {
		this.startcity = startcity;
	}
	public String getEndcity() {
		return endcity;
	}
	public void setEndcity(String endcity) {
		this.endcity = endcity;
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
	public Integer getPeople() {
		return people;
	}
	public void setPeople(Integer people) {
		this.people = people;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getBudget() {
		return budget;
	}
	public void setBudget(Integer budget) {
		this.budget = budget;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "Coustomize [id=" + id + ", startcity=" + startcity + ", endcity=" + endcity + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", people=" + people + ", budget=" + budget + ", email=" + email + ", phone="
				+ phone + ", name=" + name + ", state=" + state + ", username=" + username + "]";
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	
	
	

}
