package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 * 菜单节点信息模型类(菜单节点表)
 */
public class Nav implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer Id;
	private String nname;
	private String iconCla;
	private String pid;
	private String url;
	private String state;
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	public String getIconCla() {
		return iconCla;
	}
	public void setIconCla(String iconCla) {
		this.iconCla = iconCla;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
