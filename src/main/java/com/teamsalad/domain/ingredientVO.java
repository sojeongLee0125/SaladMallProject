package com.teamsalad.domain;

public class ingredientVO {
	
	private int igdt_num;
	private String igdt_category;
	private String igdt_name;
	private String igdt_price;
	private String igdt_main_img;
	private String igdt_sub_img; 
	private String igdt_country;
	private String igdt_info;
	private int igdt_count;
	private String igdt_tag;
	private String igdt_size;
	
	public int getIgdt_num() {
		return igdt_num;
	}
	public void setIgdt_num(int igdt_num) {
		this.igdt_num = igdt_num;
	}
	public String getIgdt_category() {
		return igdt_category;
	}
	public void setIgdt_category(String igdt_category) {
		this.igdt_category = igdt_category;
	}
	public String getIgdt_name() {
		return igdt_name;
	}
	public void setIgdt_name(String igdt_name) {
		this.igdt_name = igdt_name;
	}
	public String getIgdt_price() {
		return igdt_price;
	}
	public void setIgdt_price(String igdt_price) {
		this.igdt_price = igdt_price;
	}
	public String getIgdt_main_img() {
		return igdt_main_img;
	}
	public void setIgdt_main_img(String igdt_main_img) {
		this.igdt_main_img = igdt_main_img;
	}
	public String getIgdt_sub_img() {
		return igdt_sub_img;
	}
	public void setIgdt_sub_img(String igdt_sub_img) {
		this.igdt_sub_img = igdt_sub_img;
	}
	public String getIgdt_country() {
		return igdt_country;
	}
	public void setIgdt_country(String igdt_country) {
		this.igdt_country = igdt_country;
	}
	public String getIgdt_info() {
		return igdt_info;
	}
	public void setIgdt_info(String igdt_info) {
		this.igdt_info = igdt_info;
	}
	public int getIgdt_count() {
		return igdt_count;
	}
	public void setIgdt_count(int igdt_count) {
		this.igdt_count = igdt_count;
	}
	public String getIgdt_tag() {
		return igdt_tag;
	}
	public void setIgdt_tag(String igdt_tag) {
		this.igdt_tag = igdt_tag;
	}
	public String getIgdt_size() {
		return igdt_size;
	}
	public void setIgdt_size(String igdt_size) {
		this.igdt_size = igdt_size;
	}
	
	@Override
	public String toString() {
		return "ingredientVO [igdt_num=" + igdt_num + ", igdt_category=" + igdt_category + ", igdt_name=" + igdt_name
				+ ", igdt_price=" + igdt_price + ", igdt_main_img=" + igdt_main_img + ", igdt_sub_img=" + igdt_sub_img
				+ ", igdt_country=" + igdt_country + ", igdt_info=" + igdt_info + ", igdt_count=" + igdt_count
				+ ", igdt_tag=" + igdt_tag + ", igdt_size=" + igdt_size + "]";
	}
	
	

}
