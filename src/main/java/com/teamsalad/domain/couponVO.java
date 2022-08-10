package com.teamsalad.domain;

public class couponVO {
	
	private int coupon_id;
	private String coupon_name;
	private int coupon_disc_rate;
	
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_disc_rate() {
		return coupon_disc_rate;
	}
	public void setCoupon_disc_rate(int coupon_disc_rate) {
		this.coupon_disc_rate = coupon_disc_rate;
	}
	
	@Override
	public String toString() {
		return "couponVO [coupon_id=" + coupon_id + ", coupon_name=" + coupon_name + ", coupon_disc_rate="
				+ coupon_disc_rate + "]";
	}
	
	
	

	

}
