package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 *	旅游景点信息模型类(旅游景点表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Scenic implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String scenicname;
	private String scenicname_pinyin;
	private String address;
	
	private String introduce;
	private String province;
	private String city;
	private Integer floor_price;
	private String headline;
	private String coverImage;
	private Double praise;//好评
	
	public Double getPraise() {
		return praise;
	}
	public void setPraise(Double praise) {
		this.praise = praise;
	}
	/**
	 * floor_price 低价
	 * hint  温馨提示
	 * Title 主题
	 */
	private Hint hint;
	private Title title;
	private Set<Scenicimage> scenicimages =new HashSet<Scenicimage>(0);
	private Set<Discounts> discounts = new HashSet<Discounts>(0);
	
	/**
	 * 旅游路线景点记录信息set集合
	 */
	private Set<ScenicwayOrscenic> scenicwayOrscenics;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getScenicname() {
		return scenicname;
	}
	public void setScenicname(String scenicname) {
		this.scenicname = scenicname;
	}
	public String getScenicname_pinyin() {
		return scenicname_pinyin;
	}
	public void setScenicname_pinyin(String scenicname_pinyin) {
		this.scenicname_pinyin = scenicname_pinyin;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Integer getFloor_price() {
		return floor_price;
	}
	public void setFloor_price(Integer floor_price) {
		this.floor_price = floor_price;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public String getCoverImage() {
		return coverImage;
	}
	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}
	public Hint getHint() {
		return hint;
	}
	public void setHint(Hint hint) {
		this.hint = hint;
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	public Set<Scenicimage> getScenicimages() {
		return scenicimages;
	}
	public void setScenicimages(Set<Scenicimage> scenicimages) {
		this.scenicimages = scenicimages;
	}
	public Set<Discounts> getDiscounts() {
		return discounts;
	}
	public void setDiscounts(Set<Discounts> discounts) {
		this.discounts = discounts;
	}
	public Set<ScenicwayOrscenic> getScenicwayOrscenics() {
		return scenicwayOrscenics;
	}
	public void setScenicwayOrscenics(Set<ScenicwayOrscenic> scenicwayOrscenics) {
		this.scenicwayOrscenics = scenicwayOrscenics;
	}
	@Override
	public String toString() {
		return "Scenic [id=" + id + ", scenicname=" + scenicname + ", scenicname_pinyin=" + scenicname_pinyin
				+ ", address=" + address + ", introduce=" + introduce + ", province=" + province + ", city=" + city
				+ ", floor_price=" + floor_price + ", headline=" + headline + ", coverImage=" + coverImage + "]";
	}
}
