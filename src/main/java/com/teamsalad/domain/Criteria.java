package com.teamsalad.domain;

public class Criteria {
	// 페이징 처리 정보를 저장하는 객체 
	
	// 현재 페이지
	private int pageNum;
	
	// 한 페이지 당 보여질 게시물 갯수
	private int pageAmount;
	
	// 스킵 할 게시물 수
	private int skip;
	
	// 기본 생성자
	public Criteria() {// 기본값은 항상 1페이지, 10개씩
		this.pageNum = 1;
		this.pageAmount = 10;
		this.skip = 0;
	}
	
	// 원하는 값 넣는 생성자
	public Criteria(int pageNum, int pageAmount) {
		this.pageNum = pageNum;
		this.pageAmount = pageAmount;
		this.skip = (pageNum-1)*pageAmount;
	}
	
	public void setPageNum(int pageNum) {

		// 페이지 정보가 음수인경우 1페이지로 처리 
		if(pageNum <= 0) { 
			pageNum = 1;
			return;
		}
		
		this.skip = (pageNum-1)*this.pageAmount;
		
		this.pageNum = pageNum;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	
	public void setPageAmount(int pageAmount) {
		
		if(pageAmount <=0 || pageAmount > 100) {
			pageAmount = 10;
			return;
		}
		
		this.skip = (this.pageNum-1)*pageAmount;
		
		this.pageAmount = pageAmount;
	}
	
	public int getPageAmount() {
		return pageAmount;
	}
	
	
	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	public int getSkip() {
		return skip;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", pageAmount=" + pageAmount + "]";
	}

	
	
	
	
	
	
	
	

}
