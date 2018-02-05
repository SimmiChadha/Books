package com.books.cart;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.books.library.Library;

@Entity
public class Cart 
{
	@Transient
	Library l = new Library();
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	
	private int id;
	private int lid;
	private int qty;
	private String SAdd;
	private String BAdd;
	private String userid;
	public Library getL() {
		return l;
	}
	public void setL(Library l) {
		this.l = l;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getSAdd() {
		return SAdd;
	}
	public void setSAdd(String sAdd) {
		SAdd = sAdd;
	}
	public String getBAdd() {
		return BAdd;
	}
	public void setBAdd(String bAdd) {
		BAdd = bAdd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Cart() {
		super();
	
	}
	
	
}
