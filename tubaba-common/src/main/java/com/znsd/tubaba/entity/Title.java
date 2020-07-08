package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 *	主题类型信息模型类(主题类型表)
 */
public class Title implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String type;
	
	private Set<Scenic> scenSet=new HashSet<Scenic>();
	
	public Title() {
		super();
	}
	public Title(String title) {
		this.type=title;
	}	
	public Set<Scenic> getScenSet() {
		return scenSet;
	}
	public void setScenSet(Set<Scenic> scenSet) {
		this.scenSet = scenSet;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Title [id=" + id + ", type=" + type + "]";
	}
	
}
