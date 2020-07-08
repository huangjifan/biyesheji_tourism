package com.znsd.tubaba.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 *	景点图片信息模型类(景点图片表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Scenicimage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String path;//路径
	private Scenic scenic;
	private Scenicway scenicway;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Scenic getScenic() {
		return scenic;
	}
	public void setScenic(Scenic scenic) {
		this.scenic = scenic;
	}
	public Scenicway getScenicway() {
		return scenicway;
	}
	public void setScenicway(Scenicway scenicway) {
		this.scenicway = scenicway;
	}
	@Override
	public String toString() {
		return "Scenicimage [id=" + id + ", path=" + path + "]";
	}
}
