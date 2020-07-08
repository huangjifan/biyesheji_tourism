package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Attractions implements Serializable{
	
	public Attractions() {
	}
	public Attractions(String atrtitle) {
		this.atrtitle = atrtitle;
	}
	public Attractions(String atrtitle, Integer type) {
		this.atrtitle = atrtitle;
		this.type = type;
	}
	public Attractions(Integer atid, String atrtitle) {
		super();
		this.atid = atid;
		this.atrtitle = atrtitle;
	}
	private static final long serialVersionUID = 6067498408149432154L;
	private Integer atid;
	private String atrtitle;
	private Integer type;
	private Integer apid;
	public Integer getApid() {
		return apid;
	}
	public void setApid(Integer apid) {
		this.apid = apid;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}

	private Set<Scenicway> cenicways=new HashSet<>(0);
	public Set<Scenicway> getCenicways() {
		return cenicways;
	}
	public void setCenicways(Set<Scenicway> cenicways) {
		this.cenicways = cenicways;
	}
	public Integer getAtid() {
		return atid;
	}
	public void setAtid(Integer atid) {
		this.atid = atid;
	}
	public String getAtrtitle() {
		return atrtitle;
	}
	public void setAtrtitle(String atrtitle) {
		this.atrtitle = atrtitle;
	}
	
	@Override
	public String toString() {
		return "Attractions [atid=" + atid + ", atrtitle=" + atrtitle + ", type=" + type + "]";
	}
}
