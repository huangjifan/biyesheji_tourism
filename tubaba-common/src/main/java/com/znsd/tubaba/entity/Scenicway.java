package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 *	旅游路线信息模型类(旅游路线表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Scenicway implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String way;
	private String way_pinyin;
	private Integer scenicday;
	private String endpath; 
	private String startpath;
	private Integer status;
	private String description;
	private Double floor_price;
	private String scenicwayImage;
	private String introduce;
	/**
	 * 好评率 非数据库字段
	 */
	private Double feedback;
	/**
	 * 最少成团人数
	 */
	private Integer minimumGroupSize;
	private Attractions attractions;//分类
	private Title title;//主题
	private Set<Scenic> scenics=new HashSet<Scenic>(0);//景点
	private Meal meal;//费用
	private Set<Route> routes = new HashSet<Route>(0);	//行程
	private Set<Scenicimage> scenicimages=new HashSet<Scenicimage>(0);//景点图片
	private Set<Discounts> discounts = new HashSet<Discounts>(0);//活动记录
	private Set<ScenicwayDepart> scenicDeparts;//路线出发日期
	
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
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public String getWay_pinyin() {
		return way_pinyin;
	}
	public void setWay_pinyin(String way_pinyin) {
		this.way_pinyin = way_pinyin;
	}
	public Integer getScenicday() {
		return scenicday;
	}
	public void setScenicday(Integer scenicday) {
		this.scenicday = scenicday;
	}
	public String getEndpath() {
		return endpath;
	}
	public void setEndpath(String endpath) {
		this.endpath = endpath;
	}
	public String getStartpath() {
		return startpath;
	}
	public void setStartpath(String startpath) {
		this.startpath = startpath;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getFloor_price() {
		return floor_price;
	}
	public void setFloor_price(Double floor_price) {
		this.floor_price = floor_price;
	}
	public String getScenicwayImage() {
		return scenicwayImage;
	}
	public void setScenicwayImage(String scenicwayImage) {
		this.scenicwayImage = scenicwayImage;
	}
	public Double getFeedback() {
		return feedback;
	}
	public void setFeedback(Double feedback) {
		this.feedback = feedback;
	}
	public Integer getMinimumGroupSize() {
		return minimumGroupSize;
	}
	public void setMinimumGroupSize(Integer minimumGroupSize) {
		this.minimumGroupSize = minimumGroupSize;
	}
	public Attractions getAttractions() {
		return attractions;
	}
	public void setAttractions(Attractions attractions) {
		this.attractions = attractions;
	}
	public Set<Scenic> getScenics() {
		return scenics;
	}
	public void setScenics(Set<Scenic> scenics) {
		this.scenics = scenics;
	}
	public Meal getMeal() {
		return meal;
	}
	public void setMeal(Meal meal) {
		this.meal = meal;
	}
	public Set<Route> getRoutes() {
		return routes;
	}
	public void setRoutes(Set<Route> routes) {
		this.routes = routes;
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
	public Set<ScenicwayDepart> getScenicDeparts() {
		return scenicDeparts;
	}
	public void setScenicDeparts(Set<ScenicwayDepart> scenicDeparts) {
		this.scenicDeparts = scenicDeparts;
	}
	
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	@Override
	public String toString() {
		return "Scenicway [id=" + id + ", way=" + way + ", way_pinyin=" + way_pinyin + ", scenicday=" + scenicday
				+ ", endpath=" + endpath + ", startpath=" + startpath + ", status=" + status + ", description="
				+ description+ ", attractions=" +attractions + ", floor_price=" + floor_price + ", scenicwayImage=" + scenicwayImage + ", feedback="
				+ feedback +",introduce"+introduce+",title"+title+ ", minimumGroupSize=" + minimumGroupSize + "]";
	}
	
}
