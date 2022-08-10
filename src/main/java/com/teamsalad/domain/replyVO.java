package com.teamsalad.domain;

import java.sql.Timestamp;

public class replyVO {
	
	private int reply_b_num;
	private String reply_m_id;
	private String reply_b_type;
	private int reply_b_main_num;
	private String reply_b_content;
	private Timestamp reply_b_date;
	private String reply_b_ip;
	
	public int getReply_b_num() {
		return reply_b_num;
	}
	public void setReply_b_num(int reply_b_num) {
		this.reply_b_num = reply_b_num;
	}
	public String getReply_m_id() {
		return reply_m_id;
	}
	public void setReply_m_id(String reply_m_id) {
		this.reply_m_id = reply_m_id;
	}
	public String getReply_b_type() {
		return reply_b_type;
	}
	public void setReply_b_type(String reply_b_type) {
		this.reply_b_type = reply_b_type;
	}
	public int getReply_b_main_num() {
		return reply_b_main_num;
	}
	public void setReply_b_main_num(int reply_b_main_num) {
		this.reply_b_main_num = reply_b_main_num;
	}
	public String getReply_b_content() {
		return reply_b_content;
	}
	public void setReply_b_content(String reply_b_content) {
		this.reply_b_content = reply_b_content;
	}
	public Timestamp getReply_b_date() {
		return reply_b_date;
	}
	public void setReply_b_date(Timestamp reply_b_date) {
		this.reply_b_date = reply_b_date;
	}
	public String getReply_b_ip() {
		return reply_b_ip;
	}
	public void setReply_b_ip(String reply_b_ip) {
		this.reply_b_ip = reply_b_ip;
	}
	
	
	@Override
	public String toString() {
		return "replyVO [reply_b_num=" + reply_b_num + ", reply_m_id=" + reply_m_id + ", reply_b_type=" + reply_b_type
				+ ", reply_b_main_num=" + reply_b_main_num + ", reply_b_content=" + reply_b_content + ", reply_b_date="
				+ reply_b_date + ", reply_b_ip=" + reply_b_ip + "]";
	}
	
	
	
	
	

}
