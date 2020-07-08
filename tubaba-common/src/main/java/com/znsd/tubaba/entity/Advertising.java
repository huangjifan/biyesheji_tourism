package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月1日 上午11:39:31
 * 
 * @描述: 广告信息模型类
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Advertising implements Serializable {
	
	public Advertising() {
	}
	
	public Advertising(String img, Integer index, Date starttime, Date endtime) {
		super();
		this.img = img;
		this.index = index;
		this.starttime = starttime;
		this.endtime = endtime;
	}

	public Advertising(Integer id, String img, Integer index, Date starttime, Date endtime,
			AdvertisingClassify adverclasId) {
		this.id = id;
		this.img = img;
		this.index = index;
		this.starttime = starttime;
		this.endtime = endtime;
		this.adverclasId = adverclasId;
	}



	private static final long serialVersionUID = 1L;
	
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 产品图片地址
	 */
	private String img;
	
	/**
	 * 广告顺序
	 * */
	private Integer index;
	
	/**
	 * 广告开始时间
	 * */
	private Date starttime;
	
	/**
	 * 广告结束时间
	 * */
	private Date endtime;
	
	/**
	 * 广告分类
	 * */
	private AdvertisingClassify adverclasId;
	
	/**
	 * 状态
	 * */
	private Integer type;

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
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

	

	public AdvertisingClassify getAdverclasId() {
		return adverclasId;
	}

	public void setAdverclasId(AdvertisingClassify adverclasId) {
		this.adverclasId = adverclasId;
	}

	@Override
	public String toString() {
		return "Advertising [id=" + id + ", img=" + img + ", index=" + index + ", starttime=" + starttime + ", endtime="
				+ endtime + ", adverclasId=" + adverclasId + ", type=" + type + "]";
	}
}
