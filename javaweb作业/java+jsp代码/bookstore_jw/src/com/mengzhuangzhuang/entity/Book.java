package com.mengzhuangzhuang.entity;

import java.io.Serializable;

public class Book implements Serializable{
	private String goodsName;
	private String id;
	private int goodsType;
	private double price;
	private int quantity;
	public String getgoodsName() {
		return goodsName;
	}
	public void setgoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public int getgoodsType() {
		return goodsType;
	}
	public void setgoodsType(int goodsType) {
		this.goodsType = goodsType;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getquantity() {
		return quantity;
	}
	public void setquantity(int quantity) {
		this.quantity = quantity;
	}

	
}
