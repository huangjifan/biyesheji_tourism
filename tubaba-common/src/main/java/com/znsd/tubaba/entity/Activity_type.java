package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;


/**
 * 活动页面表
 * */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Activity_type implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String name;
	private Integer state;
	/*
	 * 活动算法表id
	 * */
	private Set<Activity> activity = new HashSet<Activity>(0);
	private Activity_arithmetic arithmeticid;
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

	public Activity_arithmetic getArithmeticid() {
		return arithmeticid;
	}
	public void setArithmeticid(Activity_arithmetic arithmeticid) {
		this.arithmeticid = arithmeticid;
	}
	public Set<Activity> getActivity() {
		return activity;
	}
	public void setActivity(Set<Activity> activity) {
		this.activity = activity;
	}
	@Override
	public String toString() {
		return "Activity_type [id=" + id + ", name=" + name + ", activity=" + activity + ", arithmeticid="
				+ arithmeticid + "]";
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	
	
}
