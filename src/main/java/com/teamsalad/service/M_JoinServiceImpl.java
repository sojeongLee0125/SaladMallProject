package com.teamsalad.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import com.teamsalad.domain.memberVO;
import com.teamsalad.persistence.M_JoinDAO;
import com.teamsalad.persistence.M_JoinDAOImpl;

@Service
public class M_JoinServiceImpl implements M_JoinService{
	
	@Inject
	private M_JoinDAO mdao;
	
	// 회원가입
	@Override
	public void joinMember(memberVO vo) {

		System.out.println("S : DAO-insertMember(vo) 호출(연결)");
		
		mdao.joinMember(vo);
		
		System.out.println(" S : 회원가입 처리 완료! ");
	}

	
	// 아이디 중복 검사
	@Override
	public int idCheck(String m_id) throws Exception {
		
		System.out.println("S : idCheck(String m_id) 호출(연결)");
		
		return mdao.idCheck(m_id);
	}
	
	
	
	
	

}
