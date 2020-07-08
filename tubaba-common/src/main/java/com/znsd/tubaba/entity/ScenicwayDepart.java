package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午9:35:37
 * 
 * @描述: 旅游路线出发时间信息模型类
 */
public class ScenicwayDepart implements Serializable {

	private static final long serialVersionUID = 2637146097026214345L;
	
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 出发时间
	 */
	private Date departtime;
	/**
	 * 当天价格
	 */
	private Double price;
	/**
	 * 旅游路线信息
	 */
	private Scenicway scenicway;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDeparttime() {
		return departtime;
	}
	public void setDeparttime(Date departtime) {
		this.departtime = departtime;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Scenicway getScenicway() {
		return scenicway;
	}
	public void setScenicway(Scenicway scenicway) {
		this.scenicway = scenicway;
	}
	@Override
	public String toString() {
		return "ScenicwayDepart [id=" + id + ", departtime=" + departtime + ", price=" + price + "]";
	}
}
