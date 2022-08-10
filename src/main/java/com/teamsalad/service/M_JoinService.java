package com.teamsalad.service;

import com.teamsalad.domain.memberVO;

public interface M_JoinService {
	
	// 회원가입
	public void joinMember(memberVO vo);
	
	// 아이디 중복 검사
	public int idCheck(String m_id) throws Exception;
	
	
	
	
	
	
	
	

}
