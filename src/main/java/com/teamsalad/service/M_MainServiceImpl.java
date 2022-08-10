package com.teamsalad.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.persistence.M_MainDAO;

@Service
public class M_MainServiceImpl implements M_MainService {

	private static final Logger logger = LoggerFactory.getLogger(M_MainService.class);

	@Inject
	private M_MainDAO mdao;

	// 회원정보 조회
	@Override
	public memberVO getMemberInfo(String m_id) throws Exception {
		
		logger.info(" S: getMemberInfo(m_id) 호출 ");

		memberVO mvo = mdao.getMemberInfo(m_id);

		return mvo;
	}

	// 회원정보 수정
	@Override
	public void updateMember(memberVO mvo) throws Exception {
		
		logger.info("S: updateMember(mvo) 호출");

		mdao.updateMember(mvo);
	}

	// 회원탈퇴
	@Override
	public void deleteMember(memberVO mvo) throws Exception {

		logger.info(" S: deleteMember(mvo) 호출");

		mdao.deleteMember(mvo);
	}

	// 주문 리스트
	@Override
	public List<orderVO> orderList(String m_id) throws Exception {
		
		logger.info(" S: orderList(String m_id) 호출");
		
		return mdao.orderList(m_id);
	}
	
	// 특정 주문 조회
	@Override
	public orderVO orderInfo(Integer order_num) throws Exception {
		
		logger.info(" S: orderInfo(Integer order_num) 호출");

		orderVO ovo = mdao.orderInfo(order_num);

		return ovo;
	}
	
	// 주문수정
	@Override
	public void orderUpdate(orderVO ovo) throws Exception {
		
		logger.info(" S : orderUpdate(ovo) 호출 ");

		mdao.orderUpdate(ovo);
	}

	// 주문삭제

	@Override
	public void orderDelete(Integer order_num) throws Exception {
		
		logger.info(" S : orderDelete(Integer order_num) 호출");

		mdao.orderDelete(order_num);

	}



}
