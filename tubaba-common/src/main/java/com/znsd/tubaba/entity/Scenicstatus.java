package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 *	景点状态信息模型类(景点状态表)
 */
public class Scenicstatus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Date puttime;//上架时间
	private Integer browseCount;//浏览次数
	private Integer status;//景点状态
	private Date serviceingtime;//维护时间
	private Scenic scenics;
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Scenic getScenics() {
		return scenics;
	}
	public void setScenics(Scenic scenics) {
		this.scenics = scenics;
	}
	public Date getPuttime() {
		return puttime;
	}
	public void setPuttime(Date puttime) {
		this.puttime = puttime;
	}
	public Integer getBrowseCount() {
		return browseCount;
	}
	public void setBrowseCount(Integer browseCount) {
		this.browseCount = browseCount;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getServiceingtime() {
		return serviceingtime;
	}
	public void setServiceingtime(Date serviceingtime) {
		this.serviceingtime = serviceingtime;
	}
	@Override
	public String toString() {
		return "Scenicstatus [id=" + id + ", puttime=" + puttime + ", browseCount=" + browseCount + ", status=" + status
				+ ", serviceingtime=" + serviceingtime + ", scenics=" + scenics + "]";
	}
	 
}
