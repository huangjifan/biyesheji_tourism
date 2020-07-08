package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 *	订单详情信息模型类(订单详情表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Indentdetails implements Serializable{
	
	public Indentdetails() {
		super();
	}
	
	public Indentdetails(Date orderstime, Integer peopleCount, Integer copies, Scenicway scenicway, Date starttime,
			Date endtime, Scenic scenic, User user, Integer status, Indent indent) {
		super();
		this.orderstime = orderstime;
		this.peopleCount = peopleCount;
		this.copies = copies;
		this.scenicway = scenicway;
		this.starttime = starttime;
		this.endtime = endtime;
		this.scenic = scenic;
		this.user = user;
		this.status = status;
		this.indent = indent;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Date orderstime;
	private Integer peopleCount;
	private Integer copies;
	private Scenicway scenicway;//路线
	private Date starttime;
	private Date endtime;
	private PlayMan playMan;
	private Scenic scenic;//门票
	private User user;//用户
	private Integer status;
	private Indent indent;
	private Set<Indent> indents = new HashSet<Indent>(0);
	
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
	
	public Indent getIndent() {
		return indent;
	}
	public void setIndent(Indent indent) {
		this.indent = indent;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Set<Indent> getIndents() {
		return indents;
	}
	public void setIndents(Set<Indent> indents) {
		this.indents = indents;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getOrderstime() {
		return orderstime;
	}
	public void setOrderstime(Date orderstime) {
		this.orderstime = orderstime;
	}
	public Integer getPeopleCount() {
		return peopleCount;
	}
	public void setPeopleCount(Integer peopleCount) {
		this.peopleCount = peopleCount;
	}
	public Integer getCopies() {
		return copies;
	}
	public void setCopies(Integer copies) {
		this.copies = copies;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public PlayMan getPlayMan() {
		return playMan;
	}
	public void setPlayMan(PlayMan playMan) {
		this.playMan = playMan;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Indentdetails [id=" + id + ", orderstime=" + orderstime + ", peopleCount=" + peopleCount + ", copies="
				+ copies + ", starttime=" + starttime + ", endtime=" + endtime + ", status=" + status + "]";
	}
}
