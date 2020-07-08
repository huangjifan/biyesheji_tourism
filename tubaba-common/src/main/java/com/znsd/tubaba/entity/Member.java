package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 * 会员表
 * @author 石杰
 *
 */
public class Member implements Serializable {
	private Integer id;//会员主键
	private String name;//会员名
	private Integer minIntegral;//最小积分
	private Integer maxIntegral;//最大积分
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
	public Integer getMinIntegral() {
		return minIntegral;
	}
	public void setMinIntegral(Integer minIntegral) {
		this.minIntegral = minIntegral;
	}
	public Integer getMaxIntegral() {
		return maxIntegral;
	}
	public void setMaxIntegral(Integer maxIntegral) {
		this.maxIntegral = maxIntegral;
	}
	@Override
	public String toString() {
		return "Eember [id=" + id + ", name=" + name + ", minIntegral=" + minIntegral + ", maxIntegral=" + maxIntegral
				+ "]";
	}
	
}
