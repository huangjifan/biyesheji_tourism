package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 * 关键字表
 * */
public class Keyword implements Serializable{
	
	
	public Keyword() {
	}
	
	
	
	
	public Keyword(String content, Integer type) {
		this.content = content;
		this.type = type;
	}




	/**
	 * 主键id
	 * */
	private Integer id;
	
	/**
	 * 内容
	 * */
	private String content;
	
	/**
	 * 状态
	 * */
	private Integer type;
	
	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Keyword [id=" + id + ", content=" + content + ", type=" + type + "]";
	}
}
