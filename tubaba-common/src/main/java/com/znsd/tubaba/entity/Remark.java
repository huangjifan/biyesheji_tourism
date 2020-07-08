package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;


/**
 *	点评信息模型类(点评表) 
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Remark implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String content;
	private Integer essence;
	private Integer status;
	private Mark mark;
	private Set<Remark> remarks= new HashSet<Remark>(0);
	private Set<Remarklike> remlike=new HashSet<Remarklike>(0);
	public Set<Remarklike> getRemlike() {
		return remlike;
	}
	public void setRemlike(Set<Remarklike> remlike) {
		this.remlike = remlike;
	}
	public Set<Remark> getRemarks() {
		return remarks;
	}
	public void setRemarks(Set<Remark> remarks) {
		this.remarks = remarks;
	}
	/**
	 * 用户信息
	 */
	private User user;
	/**
	 * 订单信息
	 */
	private Indent indent;
	
	/**
	 * 评论子id
	 * */
	private Integer remid;
	
	public Integer getRemid() {
		return remid;
	}
	public void setRemid(Integer remid) {
		this.remid = remid;
	}
	/**
	 * 评论图片集合
	 * **/
	private Set<Remarkimg> remarkimg=new HashSet<Remarkimg>();
	
	public Set<Remarkimg> getRemarkimg() {
		return remarkimg;
	}
	public void setRemarkimg(Set<Remarkimg> remarkimg) {
		this.remarkimg = remarkimg;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getEssence() {
		return essence;
	}
	public void setEssence(Integer essence) {
		this.essence = essence;
	}
	public Mark getMark() {
		return mark;
	}
	public void setMark(Mark mark) {
		this.mark = mark;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Indent getIndent() {
		return indent;
	}
	public void setIndent(Indent indent) {
		this.indent = indent;
	}
	@Override
	public String toString() {
		return "Remark [id=" + id + ", content=" + content + ", essence=" + essence + ", status=" + status + ", mark="
				+ mark + ", user=" + user + ", indent=" + indent + ", remid=" + remid + "]";
	}
}
