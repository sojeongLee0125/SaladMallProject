 package com.teamsalad.persistence;

import java.util.List;

import com.teamsalad.domain.cartVO;

public interface BasketDAO {

	// 장바구니 정보
	public List<cartVO> Basket(String m_id) throws Exception;
		
	// 장바구니 삭제
	public void deleteCart(int cart_num) throws Exception;	
}