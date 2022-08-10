package com.teamsalad.domain;

import java.sql.Timestamp;

public class recipeVO {
	
	private int rcp_num;
	private String rcp_cmbnt;
	private String rcp_name;
	private String rcp_content;
	private String rcp_img;
	private Timestamp rcp_date;
	private int rcp_like;
	private String rcp_price;
	private int rcp_week_count;
	private int rcp_total_count;
	
	public int getRcp_num() {
		return rcp_num;
	}
	public void setRcp_num(int rcp_num) {
		this.rcp_num = rcp_num;
	}
	public String getRcp_cmbnt() {
		return rcp_cmbnt;
	}
	public void setRcp_cmbnt(String rcp_cmbnt) {
		this.rcp_cmbnt = rcp_cmbnt;
	}
	public String getRcp_name() {
		return rcp_name;
	}
	public void setRcp_name(String rcp_name) {
		this.rcp_name = rcp_name;
	}
	public String getRcp_content() {
		return rcp_content;
	}
	public void setRcp_content(String rcp_content) {
		this.rcp_content = rcp_content;
	}
	public String getRcp_img() {
		return rcp_img;
	}
	public void setRcp_img(String rcp_img) {
		this.rcp_img = rcp_img;
	}
	public Timestamp getRcp_date() {
		return rcp_date;
	}
	public void setRcp_date(Timestamp rcp_date) {
		this.rcp_date = rcp_date;
	}
	public int getRcp_like() {
		return rcp_like;
	}
	public void setRcp_like(int rcp_like) {
		this.rcp_like = rcp_like;
	}
	public String getRcp_price() {
		return rcp_price;
	}
	public void setRcp_price(String rcp_price) {
		this.rcp_price = rcp_price;
	}
	public int getRcp_week_count() {
		return rcp_week_count;
	}
	public void setRcp_week_count(int rcp_week_count) {
		this.rcp_week_count = rcp_week_count;
	}
	public int getRcp_total_count() {
		return rcp_total_count;
	}
	public void setRcp_total_count(int rcp_total_count) {
		this.rcp_total_count = rcp_total_count;
	}
	
	@Override
	public String toString() {
		return "recipeVO [rcp_num=" + rcp_num + ", rcp_cmbnt=" + rcp_cmbnt + ", rcp_name=" + rcp_name + ", rcp_content="
				+ rcp_content + ", rcp_img=" + rcp_img + ", rcp_date=" + rcp_date + ", rcp_like=" + rcp_like
				+ ", rcp_price=" + rcp_price + ", rcp_week_count=" + rcp_week_count + ", rcp_total_count="
				+ rcp_total_count + "]";
	}
	
	
	
	

}
