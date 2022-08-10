package com.teamsalad.service;

import javax.servlet.http.HttpServletResponse;

import com.teamsalad.domain.memberVO;

public interface M_LoginService {

	// 로그인
	public memberVO memberLogin(memberVO mvo) throws Exception;
	
	// 구글로그인
	public memberVO googleLogin(memberVO mvo) throws Exception;
	
	// 구글 회원가입
	public void googleJoin(memberVO mvo) throws Exception;
	
	//이메일발송
	public void sendEmail(memberVO vo, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, memberVO vo) throws Exception;

}
