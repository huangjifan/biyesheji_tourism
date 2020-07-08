package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月2日 下午4:25:33
 * 
 * @描述: 酒店+景点状态信息模型类
 */
public class HotelScenicStatus implements Serializable {

	private static final long serialVersionUID = -3791385996022466144L;
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 上架时间
	 */
	private Date puttime;
	/**
	 * 浏览次数
	 */
	private Integer browseCount;
	/**
	 * 酒店+景点状态（0正常，1删除）
	 */
	private Integer status;
	/**
	 * 维护时间
	 */
	private Date serviceingtime;
	/**
	 * 酒店+景点信息
	 */
	private HotelScenic hotelScenic;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getPuttime() {
		return puttime;
	}
	public void setPuttime(Date puttime) {
		this.puttime = puttime;
	}
	public Integer getBrowseCount() {
		return browseCount;
	}
	public void setBrowseCount(Integer browseCount) {
		this.browseCount = browseCount;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getServiceingtime() {
		return serviceingtime;
	}
	public void setServiceingtime(Date serviceingtime) {
		this.serviceingtime = serviceingtime;
	}
	public HotelScenic getHotelScenic() {
		return hotelScenic;
	}
	public void setHotelScenic(HotelScenic hotelScenic) {
		this.hotelScenic = hotelScenic;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "HotelScenicStatus [id=" + id + ", puttime=" + puttime + ", browseCount=" + browseCount + ", status="
				+ status + ", serviceingtime=" + serviceingtime + "]";
	}
}
