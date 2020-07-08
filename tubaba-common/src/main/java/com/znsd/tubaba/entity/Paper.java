package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 *	证件信息模型类(证件表)
 */
public class Paper implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String papertype;
	private Set<OftenUser> oftenUsers = new HashSet<OftenUser>(0);
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPapertype() {
		return papertype;
	}
	public void setPapertype(String papertype) {
		this.papertype = papertype;
	}
	public Set<OftenUser> getOftenUsers() {
		return oftenUsers;
	}
	public void setOftenUsers(Set<OftenUser> oftenUsers) {
		this.oftenUsers = oftenUsers;
	}
	
	
}
