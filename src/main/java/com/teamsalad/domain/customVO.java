package com.teamsalad.domain;

public class customVO {
	private String m_id;
	private String rcp_cmbnt;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getRcp_cmbnt() {
		return rcp_cmbnt;
	}
	public void setRcp_cmbnt(String rcp_cmbnt) {
		this.rcp_cmbnt = rcp_cmbnt;
	}
	
	@Override
	public String toString() {
		return "customVO [m_id=" + m_id + ", rcp_cmbnt=" + rcp_cmbnt + "]";
	}
}
