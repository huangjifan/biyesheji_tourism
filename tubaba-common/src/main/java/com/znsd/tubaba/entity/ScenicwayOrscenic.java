package com.znsd.tubaba.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月7日 下午9:50:13
 * 
 * @描述: 旅游路线景点记录信息模型类
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class ScenicwayOrscenic implements Serializable {

	private static final long serialVersionUID = -4791010740694190243L;
	
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 景点的顺序(从0开始)
	 */
	private Integer index;
	/**
	 * 旅游路线信息
	 */
	private Scenicway scenicway;
	/**
	 * 景点信息
	 */
	private Scenic scenic;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Scenicway getScenicway() {
		return scenicway;
	}
	public void setScenicway(Scenicway scenicway) {
		this.scenicway = scenicway;
	}
	public Scenic getScenic() {
		return scenic;
	}
	public void setScenic(Scenic scenic) {
		this.scenic = scenic;
	}
	@Override
	public String toString() {
		return "ScenicwayOrscenic [id=" + id + ", index=" + index + ", scenicway=" + scenicway + ", scenic=" + scenic
				+ "]";
	}
}
