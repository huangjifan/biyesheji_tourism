package com.znsd.tubaba.entity;

import java.io.Serializable;

/**
 * 管理员表
 * @author Administrator
 *
 */
public class Admin implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer admId;
	private String admName;
	private String admPass;
	private String admSex;
	private String admEmail;
	private String admPhone;
	private Integer admPermissions;
	private Integer admState;
	
	
	public Admin(String admName, String admPass, String admSex, String admEmail, String admPhone,
			Integer admPermissions) {
		super();
		this.admName = admName;
		this.admPass = admPass;
		this.admSex = admSex;
		this.admEmail = admEmail;
		this.admPhone = admPhone;
		this.admPermissions = admPermissions;
	}
	
	public Admin() {
	}



	@Override
	public String toString() {
		return "Admin [admName=" + admName + ", admPass=" + admPass + ", admSex=" + admSex + ", admEmail=" + admEmail
				+ ", admPhone=" + admPhone + ", admPermissions=" + admPermissions + "]";
	}
	
	
	public Integer getAdmState() {
		return admState;
	}

	public void setAdmState(Integer admState) {
		this.admState = admState;
	}

	public Integer getAdmId() {
		return admId;
	}
	public void setAdmId(Integer admId) {
		this.admId = admId;
	}
	public String getAdmName() {
		return admName;
	}
	public void setAdmName(String admName) {
		this.admName = admName;
	}
	public String getAdmPass() {
		return admPass;
	}
	public void setAdmPass(String admPass) {
		this.admPass = admPass;
	}
	public String getAdmSex() {
		return admSex;
	}
	public void setAdmSex(String admSex) {
		this.admSex = admSex;
	}
	public String getAdmEmail() {
		return admEmail;
	}
	public void setAdmEmail(String admEmail) {
		this.admEmail = admEmail;
	}
	public String getAdmPhone() {
		return admPhone;
	}
	public void setAdmPhone(String admPhone) {
		this.admPhone = admPhone;
	}
	public Integer getAdmPermissions() {
		return admPermissions;
	}
	public void setAdmPermissions(Integer admPermissions) {
		this.admPermissions = admPermissions;
	}
}	
