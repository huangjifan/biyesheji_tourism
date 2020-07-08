package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 活动显示地址表
 * */
public class Activity_address implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 活动地址表id
	 * */
	private Integer id;
	/**
	 * 
	 * 地址名称
	 */
	private String name;
	
	/**
	 * 
	 * 父级id
	 */
	private Integer upid;
	
	/**
	 * 状态id
	 */
	private Integer state;
	
	private Set<Discounts> discounts = new HashSet<Discounts>(0);
	
	/*private Set<Activity> activity;*/
	
	public Activity_address() {
		super();
	}
	
	public Activity_address(String name, Integer upid, Integer state) {
		super();
		this.name = name;
		this.upid = upid;
		this.state = state;
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
	public Integer getUpid() {
		return upid;
	}
	public void setUpid(Integer upid) {
		this.upid = upid;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Activity_Address [id=" + id + ", name=" + name + ", upid=" + upid + ", state=" + state + "]";
	}

	public Set<Discounts> getDiscounts() {
		return discounts;
	}

	public void setDiscounts(Set<Discounts> discounts) {
		this.discounts = discounts;
	}

}
