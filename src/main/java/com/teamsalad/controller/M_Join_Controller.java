package com.teamsalad.controller;

import com.teamsalad.domain.memberVO;
import com.teamsalad.service.M_JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Controller
@RequestMapping("/M_Join")
public class M_Join_Controller {

    @Inject
    private M_JoinService service;

    @Autowired
    private JavaMailSender mailSender;

    // http://localhost:8080/M_Join/join
    // 회원가입 메인 페이지(GET)
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String MemberJoinGETs() throws Exception {
        return "/M_Join/join";
    }

    // 회원가입 처리 (POST)
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String MemberJoinPOSTs(memberVO vo) throws Exception {
        service.joinMember(vo);
        return "redirect:/index";
    }

    // 아이디 중복 검사
    @ResponseBody
    @RequestMapping(value = "/memberIdCk", method = RequestMethod.POST)
    public String memberIdCkPOST(String m_id) throws Exception {
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
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Integer.toString(checkNum);
    }

}
