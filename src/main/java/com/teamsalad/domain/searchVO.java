package com.teamsalad.domain;

public class searchVO {
	private int primaryKey;
	private String title;
	private String address;
	public int getPrimaryKey() {
		return primaryKey;
	}
	public void setPrimaryKey(int primaryKey) {
		this.primaryKey = primaryKey;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "searchVO [primaryKey=" + primaryKey + ", title=" + title + ", address=" + address + "]";
	}
	
}
