package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 *	用户信息模型类(用户信息表)
 */
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;                                                                                                   
	private Integer id;
	private String username;
	private String userpass;
	private String realname;
	private String iphone;
	private String email;
	private String headportrait;
	private String marriage;
	private Job job;
	private Date birthday;
	private String sex;
	private Address address;
	private Integer type;
	private Double money;
	private Integer integral;
	private Integer paymentCode;
	private String logoutWhy;
	private String emailCode;
	private Integer disposable;
	public Integer getDisposable() {
		return disposable;
	}
	public void setDisposable(Integer disposable) {
		this.disposable = disposable;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getLogoutWhy() {
		return logoutWhy;
	}
	public void setLogoutWhy(String logoutWhy) {
		this.logoutWhy = logoutWhy;
	}
	public String getEmailCode() {
		return emailCode;
	}
	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
	}
	public Integer getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(Integer paymentCode) {
		this.paymentCode = paymentCode;
	}
	public Integer getIntegral() {
		return integral;
	}
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	private Set<OftenUser> oftenUsers = new HashSet<OftenUser>(0);
	private Set<Travel> travels = new HashSet<Travel>(0);
	private Set<UserStatus> userStatus = new HashSet<UserStatus>(0);
	private Set<Indent> indent=new HashSet<>(0);
	public Set<Indent> getIndent() {
		return indent;
	}
	public void setIndent(Set<Indent> indent) {
		this.indent = indent;
	}
	public Set<OftenUser> getOftenUsers() {
		return oftenUsers;
	}
	public Set<UserStatus> getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Set<UserStatus> userStatus) {
		this.userStatus = userStatus;
	}
	public void setOftenUsers(Set<OftenUser> oftenUsers) {
		this.oftenUsers = oftenUsers;
	}
	public Set<Travel> getTravels() {
		return travels;
	}
	public void setTravels(Set<Travel> travels) {
		this.travels = travels;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getIphone() {
		return iphone;
	}
	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHeadportrait() {
		return headportrait;
	}
	public void setHeadportrait(String headportrait) {
		this.headportrait = headportrait;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", userpass=" + userpass + ", realname=" + realname
				+ ", iphone=" + iphone + ", email=" + email + ", headportrait=" + headportrait + ", marriage="
				+ marriage + ", job=" + job + ", birthday=" + birthday + ", sex=" + sex + ", address=" + address
				+ ", type=" + type + ", money=" + money + ", integral=" + integral + ", oftenUsers=" + oftenUsers
				+ ", travels=" + travels + ", userStatus=" + userStatus + "]";
	}
	public User() {
		super();
	}
	public User(String username, String userpass) {
		super();
		this.username = username;
		this.userpass = userpass;
	}
	public User(String username, String userpass, String iphone, String email, String sex) {
		super();
		this.username = username;
		this.userpass = userpass;
		this.iphone = iphone;
		this.email = email;
		this.sex = sex;
	}
	
	
}
