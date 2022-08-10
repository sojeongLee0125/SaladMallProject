package com.teamsalad.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.teamsalad.domain.memberVO;
import com.teamsalad.persistence.M_LoginDAO;

@Service
public class M_LoginServiceImpl implements M_LoginService {
	
	@Inject
	private M_LoginDAO mLdao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	public static final Logger logger = LoggerFactory.getLogger(M_LoginServiceImpl.class);
	
	// 로그인
	@Override
	public memberVO memberLogin(memberVO mvo) throws Exception {
		
		System.out.println(" S: memberLogin(memberVO mvo)");
		
		memberVO loginResultMVO = mLdao.memberLogin(mvo);
		
		return loginResultMVO;
	}
	
	// 구글 회원가입
	@Override
	public void googleJoin(memberVO mvo) throws Exception {	
		
		System.out.println(" S: googleJoin(memberVO mvo)");
		
		mLdao.googleJoin(mvo);
	}
	
	// 구글 로그인
	@Override
	public memberVO googleLogin(memberVO mvo) throws Exception {
		
		memberVO googleLoginResultMVO = null;
		
		System.out.println(" S: googleLogin(memberVO mvo)");
		
		googleLoginResultMVO = mLdao.googleLogin(mvo);
		
		return googleLoginResultMVO;
	}
		
	// 비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, memberVO vo) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		
		memberVO ck = mLdao.readMember(vo.getM_id());
		
		PrintWriter out = response.getWriter();
		
		// 가입된 아이디가 없으면
		if (mLdao.readMember(vo.getM_id()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		} else if (!vo.getM_email().equals(ck.getM_email())) {
			// 가입된 이메일이 아니면
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
		}
			
		vo.setM_pw(pw);
		
		// 비밀번호 변경
		mLdao.updatePw(vo);
		
		// 비밀번호 변경 메일 발송
		sendEmail(vo, "findpw");

		out.print("이메일로 임시 비밀번호를 발송하였습니다.");
		out.close();
	}
	
	// 비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(memberVO vo, String div) throws Exception {

		/* 이메일 보내기 */
		String setFrom = "teamsalad2021@gmail.com";
		String toMail = vo.getM_email();
		String title = "샐러드몰 임시 비밀번호 메일입니다.";
		String msg = "";

		System.out.println(toMail);

		if (div.equals("findpw")) {

			System.out.println("진입");

			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: red;'>";
			msg += vo.getM_id() + "님의 임시 비밀번호 입니다.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getM_pw() + "</p></div>";
		}

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(msg, true);
			mailSender.send(message);

			logger.info("전송완료");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
