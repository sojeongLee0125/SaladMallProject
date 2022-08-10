package com.teamsalad.domain;

import java.sql.Timestamp;

public class cartVO {
	
	private int cart_num;
	private String m_id;
	private int rcp_num;
	private int cart_amount;
	private String cart_option;
	private String cart_price;
	private Timestamp cart_regdate;
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getRcp_num() {
		return rcp_num;
	}
	public void setRcp_num(int rcp_num) {
		this.rcp_num = rcp_num;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public String getCart_option() {
		return cart_option;
	}
	public void setCart_option(String cart_option) {
		this.cart_option = cart_option;
	}
	public String getCart_price() {
		return cart_price;
	}
	public void setCart_price(String cart_price) {
		this.cart_price = cart_price;
	}
	public Timestamp getCart_regdate() {
		return cart_regdate;
	}
	public void setCart_regdate(Timestamp cart_regdate) {
		this.cart_regdate = cart_regdate;
	}
	
	@Override
	public String toString() {
		return "cartVO [cart_num=" + cart_num + ", m_id=" + m_id + ", rcp_num=" + rcp_num + ", cart_amount="
				+ cart_amount + ", cart_option=" + cart_option + ", cart_price=" + cart_price + ", cart_regdate="
				+ cart_regdate + "]";
	}
	
	
	
	
	
	
	

}
