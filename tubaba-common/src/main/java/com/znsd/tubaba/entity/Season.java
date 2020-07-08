package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月5日 下午5:58:20
 * 
 * @描述: 季节表
 */
public class Season implements Serializable {

	private static final long serialVersionUID = 2301014251751719523L;
	
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 季节名称
	 */
	private String name;
	/**
	 * 月份
	 */
	private Integer month;
	
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
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	@Override
	public String toString() {
		return "Season [id=" + id + ", name=" + name + ", month=" + month + "]";
	}
}
