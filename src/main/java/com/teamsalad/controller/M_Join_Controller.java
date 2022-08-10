package com.teamsalad.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamsalad.domain.memberVO;
import com.teamsalad.service.M_JoinService;

@Controller
@RequestMapping("/M_Join/*")
public class M_Join_Controller {

	private static final Logger logger = LoggerFactory.getLogger(M_Join_Controller.class);

	@Inject
	private M_JoinService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// http://localhost:8080/M_Join/join
	
	// 회원가입 메인 페이지(GET)
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String MemberJoinGETs() throws Exception {

		logger.info("MemberJoinGETs() 호출!!! ");

		return "/M_Join/join";
	}

	// 회원가입 처리 (POST)
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String MemberJoinPOSTs(memberVO vo) throws Exception {

		logger.info("MemberJoinPOSTs() 호출!!! ");
				
		service.joinMember(vo);

		logger.info(" 회원 가입 성공!!! ");

		return "redirect:/index";
	}

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/memberIdCk", method = RequestMethod.POST)
	public String memberIdCkPOST(String m_id) throws Exception {

		logger.info("memberIdChk() 호출");

		int result = service.idCheck(m_id);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 없음
		}

	}
	
	// 이메일 인증
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	public String mailCheckGET(String email) throws Exception {

		logger.info("이메일 데이터 전송 확인");

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
		String setFrom = "teamsalad2021@gmail.com";
		String toMail = email;
		String title = "샐러드몰 회원가입 인증 이메일 입니다.";
		String content = "저희 샐러드몰에 가입해주셔서 감사합니다." + "<br><br>" + "회원가입 인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 번호를 인증번호 확인란에 기입하여 주세요.";

	    try { 
	
	    	MimeMessage message = mailSender.createMimeMessage(); 
	    	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	    	helper.setFrom(setFrom); 
	    	helper.setTo(toMail); 
	    	helper.setSubject(title);
	    	helper.setText(content, true); 
	    	mailSender.send(message);
	  
	    	logger.info("전송완료"); 
	    	
	    } catch (Exception e) { 
	    	e.printStackTrace(); 
	    }	
		
	    String num = Integer.toString(checkNum);

	    return num;
	}	
}
