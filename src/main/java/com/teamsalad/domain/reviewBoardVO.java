package com.teamsalad.domain;

import java.sql.Timestamp;

public class reviewBoardVO {
	
	private int review_b_num;
	private String m_id;
	private int rcp_num;
	private Timestamp review_b_date;
	private String review_b_title;
	private String review_b_content;
	private String review_b_img1;
	private String review_b_img2;
	private String review_b_img3;
	private int review_b_like_count;
	
	public int getReview_b_num() {
		return review_b_num;
	}
	public void setReview_b_num(int review_b_num) {
		this.review_b_num = review_b_num;
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
	public Timestamp getReview_b_date() {
		return review_b_date;
	}
	public void setReview_b_date(Timestamp review_b_date) {
		this.review_b_date = review_b_date;
	}
	public String getReview_b_title() {
		return review_b_title;
	}
	public void setReview_b_title(String review_b_title) {
		this.review_b_title = review_b_title;
	}
	public String getReview_b_content() {
		return review_b_content;
	}
	public void setReview_b_content(String review_b_content) {
		this.review_b_content = review_b_content;
	}
	public String getReview_b_img1() {
		return review_b_img1;
	}
	public void setReview_b_img1(String review_b_img1) {
		this.review_b_img1 = review_b_img1;
	}
	public String getReview_b_img2() {
		return review_b_img2;
	}
	public void setReview_b_img2(String review_b_img2) {
		this.review_b_img2 = review_b_img2;
	}
	public String getReview_b_img3() {
		return review_b_img3;
	}
	public void setReview_b_img3(String review_b_img3) {
		this.review_b_img3 = review_b_img3;
	}
	public int getReview_b_like_count() {
		return review_b_like_count;
	}
	public void setReview_b_like_count(int review_b_like_count) {
		this.review_b_like_count = review_b_like_count;
	}
	
	@Override
	public String toString() {
		return "reviewBoardVO [review_b_num=" + review_b_num + ", m_id=" + m_id + ", rcp_num=" + rcp_num
				+ ", review_b_date=" + review_b_date + ", review_b_title=" + review_b_title + ", review_b_content="
				+ review_b_content + ", review_b_img1=" + review_b_img1 + ", review_b_img2=" + review_b_img2
				+ ", review_b_img3=" + review_b_img3 + ", review_b_like_count=" + review_b_like_count + "]";
	}
	
	
	

}
