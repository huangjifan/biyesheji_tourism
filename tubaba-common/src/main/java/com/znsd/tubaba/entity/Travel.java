package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 *	游记信息模型类(游记表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Travel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String title;
	private String content;
	private Date time;
	private Set<User> user=new HashSet<>();
	private Integer userid;
	private String coverimg;
	private Integer indentid;
	public String getCoverimg() {
		return coverimg;
	}
	public void setCoverimg(String coverimg) {
		this.coverimg = coverimg;
	}
	public Integer getIndentid() {
		return indentid;
	}
	public void setIndentid(Integer indentid) {
		this.indentid = indentid;
	}
	private Set<Scenic> scenics = new HashSet<Scenic>(0);
	private Set<TravelCommon> travelCommon=new HashSet<>();
	private Set<TravelLike> travelLike=new HashSet<>();
	public Set<TravelCommon> getTravelCommon() {
		return travelCommon;
	}
	public void setTravelCommon(Set<TravelCommon> travelCommon) {
		this.travelCommon = travelCommon;
	}
	public Set<TravelLike> getTravelLike() {
		return travelLike;
	}
	public void setTravelLike(Set<TravelLike> travelLike) {
		this.travelLike = travelLike;
	}
	private Integer views;
	
	public Set<User> getUser() {
		return user;
	}
	public void setUser(Set<User> user) {
		this.user = user;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Set<Scenic> getScenics() {
		return scenics;
	}
	public void setScenics(Set<Scenic> scenics) {
		this.scenics = scenics;
	}
	public Travel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Travel(String title, String content, Date time, Integer userid) {
		super();
		this.title = title;
		this.content = content;
		this.time = time;
		this.userid = userid;
	}
	public Travel(Integer iid,String title,String content,Date time,Integer userid) {
		this.indentid=iid;
		this.title=title;
		this.content=content;
		this.time=time;
		this.userid=userid;
	}
	@Override
	public String toString() {
		return "Travel [id=" + id + ", title=" + title + ", content=" + content + ", time=" + time + ", user=" + user
				+ ", userid=" + userid + ", scenics=" + scenics + ", views=" + views + "]";
	}
	
}
