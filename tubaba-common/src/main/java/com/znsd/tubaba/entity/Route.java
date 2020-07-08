package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 *	行程介绍信息模型类(行程介绍表)
 */
public class Route implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String title;
	private String content;
	private Scenicway scenicway;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Scenicway getScenicway() {
		return scenicway;
	}
	public void setScenicway(Scenicway scenicway) {
		this.scenicway = scenicway;
	}
	
}
