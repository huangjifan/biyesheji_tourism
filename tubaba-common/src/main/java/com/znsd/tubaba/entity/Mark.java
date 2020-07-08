package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 *	评论打分信息模型类(评论打分表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Mark implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String title;
	private Integer number;
	private Set<Remark> remarks = new HashSet<Remark>(0);
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
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Set<Remark> getRemarks() {
		return remarks;
	}
	public void setRemarks(Set<Remark> remarks) {
		this.remarks = remarks;
	}
	@Override
	public String toString() {
		return "Mark [id=" + id + ", title=" + title + ", number=" + number + "]";
	}
}
