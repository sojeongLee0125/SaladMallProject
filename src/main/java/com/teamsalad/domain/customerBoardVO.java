package com.teamsalad.domain;

import java.sql.Timestamp;

public class customerBoardVO {
	
	private int customer_b_num;
	private String m_id;
	private String customer_b_type;
	private int order_num;
	private Timestamp customer_b_date;
	private String customer_b_title;
	private String customer_b_content;
	private String customer_b_file;
	private int customer_b_status;
	
	public int getCustomer_b_num() {
		return customer_b_num;
	}
	public void setCustomer_b_num(int customer_b_num) {
		this.customer_b_num = customer_b_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getCustomer_b_type() {
		return customer_b_type;
	}
	public void setCustomer_b_type(String customer_b_type) {
		this.customer_b_type = customer_b_type;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public Timestamp getCustomer_b_date() {
		return customer_b_date;
	}
	public void setCustomer_b_date(Timestamp customer_b_date) {
		this.customer_b_date = customer_b_date;
	}
	public String getCustomer_b_title() {
		return customer_b_title;
	}
	public void setCustomer_b_title(String customer_b_title) {
		this.customer_b_title = customer_b_title;
	}
	public String getCustomer_b_content() {
		return customer_b_content;
	}
	public void setCustomer_b_content(String customer_b_content) {
		this.customer_b_content = customer_b_content;
	}
	public String getCustomer_b_file() {
		return customer_b_file;
	}
	public void setCustomer_b_file(String customer_b_file) {
		this.customer_b_file = customer_b_file;
	}
	public int getCustomer_b_status() {
		return customer_b_status;
	}
	public void setCustomer_b_status(int customer_b_status) {
		this.customer_b_status = customer_b_status;
	}
	
	@Override
	public String toString() {
		return "customerBoardVO [customer_b_num=" + customer_b_num + ", m_id=" + m_id + ", customer_b_type="
				+ customer_b_type + ", order_num=" + order_num + ", customer_b_date=" + customer_b_date
				+ ", customer_b_title=" + customer_b_title + ", customer_b_content=" + customer_b_content
				+ ", customer_b_file=" + customer_b_file + ", customer_b_status=" + customer_b_status + "]";
	}
	
	
	

}
