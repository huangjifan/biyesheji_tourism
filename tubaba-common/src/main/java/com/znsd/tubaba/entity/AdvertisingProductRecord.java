package com.znsd.tubaba.entity;

import java.io.Serializable;


/**
 * 广告内容产品记录表
 * 
 * */
public class AdvertisingProductRecord  implements Serializable{
	
	private static final long serialVersionUID = 8780445045909711698L;



	public AdvertisingProductRecord() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public AdvertisingProductRecord(Integer productid, Integer advertisingid, Integer atId) {
		this.productid = productid;
		this.advertisingid = advertisingid;
		this.atId = atId;
	}


	private Integer id;
	
	/**
	 * 产品编号
	 * 
	 * */
	private Integer productid;
	
	/**
	 * 广告编号
	 * */
	private Integer advertisingid;
	
	/**
	 * 产品分类编号
	 * */
	private Integer atId;
	
	

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getProductid() {
		return productid;
	}


	public void setProductid(Integer productid) {
		this.productid = productid;
	}


	public Integer getAdvertisingid() {
		return advertisingid;
	}


	public void setAdvertisingid(Integer advertisingid) {
		this.advertisingid = advertisingid;
	}


	public Integer getAtId() {
		return atId;
	}


	public void setAtId(Integer atId) {
		this.atId = atId;
	}

	@Override
	public String toString() {
		return "AdvertisingProductRecord [id=" + id + ", productid=" + productid + ", advertisingid=" + advertisingid
				+ ", atId=" + atId + "]";
	}
	
}
