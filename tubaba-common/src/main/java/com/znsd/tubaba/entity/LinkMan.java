package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

/**
 *	联系人信息模型类(联系人信息表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class LinkMan implements Serializable{
	public LinkMan() {
		super();
	}
	public LinkMan(String realname, String iphone, String email) {
		super();
		this.realname = realname;
		this.iphone = iphone;
		this.email = email;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String realname;
	private String iphone;
	private String email;
	private Set<PlayMan> playMans = new HashSet<PlayMan>(0);
	private Set<Indent> indents = new HashSet<Indent>(0);
	
	public Set<PlayMan> getPlayMans() {
		return playMans;
	}
	public void setPlayMans(Set<PlayMan> playMans) {
		this.playMans = playMans;
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
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getIphone() {
		return iphone;
	}
	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "LinkMan [id=" + id + ", realname=" + realname + ", iphone=" + iphone + ", email=" + email + "]";
	}
}
