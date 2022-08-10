package com.teamsalad.persistence;

import java.util.List;
import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;

public interface M_MainDAO {
	
	// 회원정보 조회
	public memberVO getMemberInfo(String m_id) throws Exception;
	
	// 회원정보 수정
	public void updateMember(memberVO mvo) throws Exception;
		
	// 회원정보 삭제
	public void deleteMember(memberVO mvo) throws Exception;
	
	// 주문리스트	
	public List<orderVO> orderList(String m_id) throws Exception;
	
	// 특정 주문 조회
	public orderVO orderInfo(Integer order_num) throws Exception;
	
	// 주문 수정
	public void orderUpdate(orderVO ovo) throws Exception;
		
	// 주문 삭제
	public void orderDelete(Integer order_num) throws Exception;
	
	

}
