package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户状态信息模型类(用户状态表)
 */
public class UserStatus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer status;
	private Integer loginCount;
	private Date resettime;
	private Date registertime;
	private Date lastlogintime;
	private User user;
	private Date lastLoginDate;
	private Date thisLoginDate;
	private String hair;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHair() {
		return hair;
	}
	public void setHair(String hair) {
		this.hair = hair;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public Date getThisLoginDate() {
		return thisLoginDate;
	}
	public void setThisLoginDate(Date thisLoginDate) {
		this.thisLoginDate = thisLoginDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getLoginCount() {
		return loginCount;
	}
	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}
	public Date getResettime() {
		return resettime;
	}
	public void setResettime(Date resettime) {
		this.resettime = resettime;
	}
	public Date getRegistertime() {
		return registertime;
	}
	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}
	public Date getLastlogintime() {
		return lastlogintime;
	}
	public void setLastlogintime(Date lastlogintime) {
		this.lastlogintime = lastlogintime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

}
