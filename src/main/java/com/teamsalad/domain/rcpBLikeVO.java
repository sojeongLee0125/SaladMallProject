package com.teamsalad.domain;

import java.sql.Timestamp;

public class rcpBLikeVO {
	
	private int rcp_b_num;
	private String m_id;
	private Timestamp like_date;
	
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
	public Timestamp getLike_date() {
		return like_date;
	}
	public void setLike_date(Timestamp like_date) {
		this.like_date = like_date;
	}
	
	@Override
	public String toString() {
		return "rcpBLikeVO [rcp_b_num=" + rcp_b_num + ", m_id=" + m_id + ", like_date=" + like_date + "]";
	}
	
	
	
}
