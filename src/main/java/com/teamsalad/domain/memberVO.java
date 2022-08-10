package com.teamsalad.domain;

import java.sql.Timestamp;

public class memberVO {
	
	private int m_seq;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	private String m_zip;
	private String m_addr1;
	private String m_addr2;
	private String m_phone;
	private Timestamp m_regdate;
	private int m_grade;
	private String m_totalAmount;
	private int m_attendance;
	private int m_warning;
	private int m_coupon;
	
	
	
	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public String getM_id() {
		return m_id;
	}
	
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_zip() {
		return m_zip;
	}
	public void setM_zip(String m_zip) {
		this.m_zip = m_zip;
	}
	public String getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public Timestamp getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Timestamp m_regdate) {
		this.m_regdate = m_regdate;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_totalAmount() {
		return m_totalAmount;
	}
	public void setM_totalAmount(String m_totalAmount) {
		this.m_totalAmount = m_totalAmount;
	}
	public int getM_attendance() {
		return m_attendance;
	}
	public void setM_attendance(int m_attendance) {
		this.m_attendance = m_attendance;
	}
	public int getM_warning() {
		return m_warning;
	}
	public void setM_warning(int m_warning) {
		this.m_warning = m_warning;
	}
	public int getM_coupon() {
		return m_coupon;
	}
	public void setM_coupon(int m_coupon) {
		this.m_coupon = m_coupon;
	}

	@Override
	public String toString() {
		return "memberVO [m_seq=" + m_seq + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_email="
				+ m_email + ", m_zip=" + m_zip + ", m_addr1=" + m_addr1 + ", m_addr2=" + m_addr2 + ", m_phone="
				+ m_phone + ", m_regdate=" + m_regdate + ", m_grade=" + m_grade + ", m_totalAmount=" + m_totalAmount
				+ ", m_attendance=" + m_attendance + ", m_warning=" + m_warning + ", m_coupon=" + m_coupon + "]";
	}
	
	

}
