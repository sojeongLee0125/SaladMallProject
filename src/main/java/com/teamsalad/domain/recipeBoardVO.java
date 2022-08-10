package com.teamsalad.domain;

import java.sql.Timestamp;

public class recipeBoardVO {
	
	private int rcp_b_num;
	private String m_id;
	private int rcp_num;
	private Timestamp rcp_b_date;
	private String rcp_b_title;
	private String rcp_b_content;
	private String rcp_b_thumbnail;
	private String rcp_b_img1;
	private String rcp_b_img2;
	private String rcp_b_img3;
	private int rcp_b_like_count;
	
	public int getRcp_b_num() {
		return rcp_b_num;
	}
	public void setRcp_b_num(int rcp_b_num) {
		this.rcp_b_num = rcp_b_num;
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
	public Timestamp getRcp_b_date() {
		return rcp_b_date;
	}
	public void setRcp_b_date(Timestamp rcp_b_date) {
		this.rcp_b_date = rcp_b_date;
	}
	public String getRcp_b_title() {
		return rcp_b_title;
	}
	public void setRcp_b_title(String rcp_b_title) {
		this.rcp_b_title = rcp_b_title;
	}
	public String getRcp_b_content() {
		return rcp_b_content;
	}
	public void setRcp_b_content(String rcp_b_content) {
		this.rcp_b_content = rcp_b_content;
	}
	public String getRcp_b_thumbnail() {
		return rcp_b_thumbnail;
	}
	public void setRcp_b_thumbnail(String rcp_b_thumbnail) {
		this.rcp_b_thumbnail = rcp_b_thumbnail;
	}
	public String getRcp_b_img1() {
		return rcp_b_img1;
	}
	public void setRcp_b_img1(String rcp_b_img1) {
		this.rcp_b_img1 = rcp_b_img1;
	}
	public String getRcp_b_img2() {
		return rcp_b_img2;
	}
	public void setRcp_b_img2(String rcp_b_img2) {
		this.rcp_b_img2 = rcp_b_img2;
	}
	public String getRcp_b_img3() {
		return rcp_b_img3;
	}
	public void setRcp_b_img3(String rcp_b_img3) {
		this.rcp_b_img3 = rcp_b_img3;
	}
	public int getRcp_b_like_count() {
		return rcp_b_like_count;
	}
	public void setRcp_b_like_count(int rcp_b_like_count) {
		this.rcp_b_like_count = rcp_b_like_count;
	}
	
	@Override
	public String toString() {
		return "recipeBoardVO [rcp_b_num=" + rcp_b_num + ", m_id=" + m_id + ", rcp_num=" + rcp_num + ", rcp_b_date="
				+ rcp_b_date + ", rcp_b_title=" + rcp_b_title + ", rcp_b_content=" + rcp_b_content
				+ ", rcp_b_thumbnail=" + rcp_b_thumbnail + ", rcp_b_img1=" + rcp_b_img1 + ", rcp_b_img2=" + rcp_b_img2
				+ ", rcp_b_img3=" + rcp_b_img3 + ", rcp_b_like_count=" + rcp_b_like_count + "]";
	}
	
}
