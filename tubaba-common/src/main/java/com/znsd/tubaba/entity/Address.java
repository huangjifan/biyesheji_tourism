package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 *	地址信息模型类(地址表)
 */
public class Address implements Serializable{
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String area;
	/**
	 * 地区的拼音
	 */
	private String area_pinyin;
	private Integer upid;
	private Set<User> users=new HashSet<User>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getArea_pinyin() {
		return area_pinyin;
	}
	public void setArea_pinyin(String area_pinyin) {
		this.area_pinyin = area_pinyin;
	}
	public Integer getUpid() {
		return upid;
	}
	public void setUpid(Integer upid) {
		this.upid = upid;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	@Override
	public String toString() {
		return "Address [id=" + id + ", area=" + area + ", area_pinyin=" + area_pinyin + ", upid=" + upid + "]";
	}
}
