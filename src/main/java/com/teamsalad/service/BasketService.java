package com.teamsalad.service;

import java.util.List;

import com.teamsalad.domain.cartVO;

public interface BasketService {

	// 장바구니 목록
	public List<cartVO> Basket(String m_id) throws Exception;
		
	// 장바구니 삭제
	public void deleteCart(int cart_num) throws Exception;
}