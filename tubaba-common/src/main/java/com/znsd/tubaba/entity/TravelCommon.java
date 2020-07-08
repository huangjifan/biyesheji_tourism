package com.znsd.tubaba.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class TravelCommon implements Serializable{

	/**
	 * 游记评论表
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer userid;
	private Integer travelid;
	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getTravelid() {
		return travelid;
	}
	public void setTravelid(Integer travelid) {
		this.travelid = travelid;
	}
	@Override
	public String toString() {
		return "TravelCommon [id=" + id + ", userid=" + userid + ", travelid=" + travelid + ", content=" + content
				+ "]";
	}
	
}
