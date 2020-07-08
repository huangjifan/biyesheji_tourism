package com.znsd.tubaba.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;


/**
 * qxl
 * 
 * 广告分类表
 * 
 * */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class AdvertisingClassify implements Serializable {
	
	
	private static final long serialVersionUID = -7750058336379244088L;


	public AdvertisingClassify() {
	}
	
	
	public AdvertisingClassify(String name, Integer upid, Integer type) {
		this.name = name;
		this.upid = upid;
		this.type = type;
	}
	
	private  Integer id;

	/**
	 * 分类名称
	 * */
	private String name;
	
	/**
	 * 分类上级编号
	 * */
	private Integer upid;
	
	
	/**
	 * 状态（删除显示）
	 * */
	private Integer type;


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


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	@Override
	public String toString() {
		return "AdvertisingClassify [id=" + id + ", name=" + name + ", upid=" + upid + ", type=" + type + "]";
	}
	
}