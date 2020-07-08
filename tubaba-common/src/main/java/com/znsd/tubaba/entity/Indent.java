package com.znsd.tubaba.entity;

import java.io.Serializable;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 *	订单信息模型类(订单表)
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer"})
public class Indent implements Serializable {
	
	public Indent() {
		super();
	}
	
	public Indent(Double price, String commodity, Integer indentstatus, LinkMan linkMan,
			Indentdetails indentdetails, String ordernumber) {
		super();
		this.price = price;
		this.commodity = commodity;
		this.indentstatus = indentstatus;
		this.linkMan = linkMan;
		this.indentdetails = indentdetails;
		this.ordernumber = ordernumber;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Double price;
	private String commodity;
	private String cancel;
	/**
	 * 订单状态(0=待审核,1=待支付,2=待出行,3=待点评,4=已评论,5=退款)
	 */
	private Integer indentstatus;
	/**
	 * 订单编号(时间戳(yyyyMMddHHmmss)+产品编号+4位随机数)
	 */
	private LinkMan linkMan;
	private Indentdetails indentdetails;
	private String ordernumber;
	private Set<PlayMan> playMan;
	//private Scenic scenic;
	/**
	 * 费用信息
	 */
	private Cost cost;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Set<PlayMan> getPlayMan() {
		return playMan;
	}
	public void setPlayMan(Set<PlayMan> playMan) {
		this.playMan = playMan;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public LinkMan getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(LinkMan linkMan) {
		this.linkMan = linkMan;
	}
	public String getCommodity() {
		return commodity;
	}
	public void setCommodity(String commodity) {
		this.commodity = commodity;
	}
	public Integer getIndentstatus() {
		return indentstatus;
	}
	public void setIndentstatus(Integer indentstatus) {
		this.indentstatus = indentstatus;
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public Indentdetails getIndentdetails() {
		return indentdetails;
	}
	public void setIndentdetails(Indentdetails indentdetails) {
		this.indentdetails = indentdetails;
	}
	/*public Scenic getScenic() {
		return scenic;
	}
	public void setScenic(Scenic scenic) {
		this.scenic = scenic;
	}*/
	public Cost getCost() {
		return cost;
	}
	public void setCosts(Cost cost) {
		this.cost = cost;
	}
	@Override
	public String toString() {
		return "Indent [id=" + id + ", price=" + price + ", linkMan=" + linkMan + ", commodity=" + commodity
				+ ", indentstatus=" + indentstatus + ", ordernumber=" + ordernumber + ", cancel=" + cancel + "]";
	}
}
