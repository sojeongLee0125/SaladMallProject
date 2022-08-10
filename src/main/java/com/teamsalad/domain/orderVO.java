package com.teamsalad.domain;

import java.sql.Timestamp;

public class orderVO {
	
	private int order_num;
	private String m_id;
	private int rcp_num;
	private int coupon_id;
	private String order_pay_num;
	private String rcp_name;
	private String order_name;
	private Timestamp order_date;
	private String order_receive_name;
	private String order_receive_phone;
	private String order_receive_zip;
	private String order_receive_addr1;
	private String order_receive_addr2;
	private String order_type;
	private int order_amount;
	private String order_ship_price;
	private String order_total_price;
	private int order_status;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getOrder_pay_num() {
		return order_pay_num;
	}
	public void setOrder_pay_num(String order_pay_num) {
		this.order_pay_num = order_pay_num;
	}
	public String getRcp_name() {
		return rcp_name;
	}
	public void setRcp_name(String rcp_name) {
		this.rcp_name = rcp_name;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getOrder_receive_name() {
		return order_receive_name;
	}
	public void setOrder_receive_name(String order_receive_name) {
		this.order_receive_name = order_receive_name;
	}
	public String getOrder_receive_phone() {
		return order_receive_phone;
	}
	public void setOrder_receive_phone(String order_receive_phone) {
		this.order_receive_phone = order_receive_phone;
	}
	public String getOrder_receive_zip() {
		return order_receive_zip;
	}
	public void setOrder_receive_zip(String order_receive_zip) {
		this.order_receive_zip = order_receive_zip;
	}
	public String getOrder_receive_addr1() {
		return order_receive_addr1;
	}
	public void setOrder_receive_addr1(String order_receive_addr1) {
		this.order_receive_addr1 = order_receive_addr1;
	}
	public String getOrder_receive_addr2() {
		return order_receive_addr2;
	}
	public void setOrder_receive_addr2(String order_receive_addr2) {
		this.order_receive_addr2 = order_receive_addr2;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public String getOrder_ship_price() {
		return order_ship_price;
	}
	public void setOrder_ship_price(String order_ship_price) {
		this.order_ship_price = order_ship_price;
	}
	public String getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(String order_total_price) {
		this.order_total_price = order_total_price;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	
	@Override
	public String toString() {
		return "orderVO [order_num=" + order_num + ", m_id=" + m_id + ", rcp_num=" + rcp_num + ", coupon_id="
				+ coupon_id + ", order_pay_num=" + order_pay_num + ", rcp_name=" + rcp_name + ", order_name="
				+ order_name + ", order_date=" + order_date + ", order_receive_name=" + order_receive_name
				+ ", order_receive_phone=" + order_receive_phone + ", order_receive_zip=" + order_receive_zip
				+ ", order_receive_addr1=" + order_receive_addr1 + ", order_receive_addr2=" + order_receive_addr2
				+ ", order_type=" + order_type + ", order_amount=" + order_amount + ", order_ship_price="
				+ order_ship_price + ", order_total_price=" + order_total_price + ", order_status=" + order_status
				+ "]";
	}
	
	
	
	

}
