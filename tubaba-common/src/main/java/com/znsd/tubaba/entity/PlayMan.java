package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 *	游玩人信息模型类(游玩人信息表)
 */
public class PlayMan implements Serializable{

	public PlayMan() {
		super();
	}
	
	public PlayMan(String realname, String iphone, LinkMan linkMan, String identity) {
		super();
		this.realname = realname;
		this.iphone = iphone;
		this.linkMan = linkMan;
		this.identity = identity;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String realname;
	private String iphone;
	private LinkMan linkMan;
	private String identity;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
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
	public LinkMan getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(LinkMan linkMan) {
		this.linkMan = linkMan;
	}
	@Override
	public String toString() {
		return "PlayMan [id=" + id + ", realname=" + realname + ", iphone=" + iphone + ", identity=" + identity + "]";
	}
}
