package com.znsd.tubaba.entity;

import java.io.Serializable;

public class Introduce implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private Integer id;
	private String inName;
	private String inTitle;
	private String inImage;
	private Scenic scenic;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getInName() {
		return inName;
	}
	public void setInName(String inName) {
		this.inName = inName;
	}
	public String getInTitle() {
		return inTitle;
	}
	public void setInTitle(String inTitle) {
		this.inTitle = inTitle;
	}
	public String getInImage() {
		return inImage;
	}
	public Introduce() {
	}
	public Introduce(String inName, String inTitle, String inImage, Scenic scenic) {
		this.inName = inName;
		this.inTitle = inTitle;
		this.inImage = inImage;
		this.scenic = scenic;
	}
	@Override
	public String toString() {
		return "Introduce [id=" + id + ", inName=" + inName + ", inTitle=" + inTitle + ", inImage=" + inImage
				+ ", scenic=" + scenic + "]";
	}
	public void setInImage(String inImage) {
		this.inImage = inImage;
	}
	public Scenic getScenic() {
		return scenic;
	}
	public void setScenic(Scenic scenic) {
		this.scenic = scenic;
	}
	
	
}
