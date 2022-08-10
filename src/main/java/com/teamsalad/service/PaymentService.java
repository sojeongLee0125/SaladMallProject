package com.teamsalad.service;

import java.util.List;

import com.teamsalad.domain.SaladCartVO;
import com.teamsalad.domain.cartVO;
import com.teamsalad.domain.orderVO;

public interface PaymentService {

	// 주문정보
	public void orderInfo(orderVO order) throws Exception;
		
	// 주문번호로 주문내역정보 가져오기
	public cartVO cartInfo(int cart_num) throws Exception;
	
	// 아이디로 카트정보, 멤버 정보, 레시피 정보 가져오기
	public List<SaladCartVO> getOrderInfo(String m_id) throws Exception;
	
	// 주문 번호 가져오기
	public int getOrderPayNum() throws Exception;
	
	// 장바구니 삭제하기
	public void deleteCart(int cart_num) throws Exception;
}
