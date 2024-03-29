package com.teamsalad.controller;

import com.teamsalad.domain.memberVO;
import com.teamsalad.service.M_LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/M_Login/*")
public class M_Login_Controller {

    @Inject
    private M_LoginService service;

    // 로그인 메인 페이지 (GET)
    // http://localhost:8080/M_Login/login
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String mLoginGET(HttpSession session) throws Exception {

        if (session.getAttribute("m_id") != null) {
            return "redirect:/index";
        }

        return "/M_Login/login";
    }

    // 로그인 처리 (POST)
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void mLoginPOST(memberVO mvo, HttpSession session, HttpServletResponse response, Model model) throws Exception {
        memberVO loginResultMVO = service.memberLogin(mvo);

        if (loginResultMVO == null) {
            response.getWriter().print(false);
            return;
        }

        if (loginResultMVO.getM_id().equals("admin")) {
            session.setAttribute("m_id", loginResultMVO.getM_id());
            response.getWriter().print("admin");
            return;
        }

        session.setAttribute("m_id", loginResultMVO.getM_id());
        response.getWriter().print(true);
    }

    // 구글 연동 로그인하기
    @ResponseBody
    @RequestMapping(value = "/googlelogin", method = RequestMethod.POST)
    public int googleLoginPOST(HttpSession session, RedirectAttributes rttr, memberVO mvo) throws Exception {
        memberVO googleLoginResultMVO = service.googleLogin(mvo);
        String google_id = mvo.getM_id();

        if (googleLoginResultMVO == null) { // 디비에 등록되지 않은 구글 아이디
            // 구글 회원가입
            service.googleJoin(mvo);

            // 구글 로그인
            googleLoginResultMVO = service.googleLogin(mvo);
            session.setAttribute("m_id", googleLoginResultMVO.getM_id());
            rttr.addFlashAttribute("mvo", googleLoginResultMVO);

            return 1;
        }

        if (google_id.equals(googleLoginResultMVO.getM_id())) { // 디비에 등록된 구글아이디
            // 구글 로그인
            session.setAttribute("m_id", googleLoginResultMVO.getM_id());
            rttr.addFlashAttribute("mvo", googleLoginResultMVO);

            return 0;

        }

        return -1;
    }

    // 임시 구글 로그아웃 페이지
    @RequestMapping(value = "/googleLogout", method = RequestMethod.GET)
    public void googleLogout() throws Exception {
    }

    // 로그아웃 처리 (get)
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String mLogoutGET(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/index";
    }

    // 비밀번호 찾기
    @RequestMapping(value = "/findpw", method = RequestMethod.GET)
    public void findPwGET() throws Exception {
    }

    // 비밀번호 찾기 이메일 전송
    @RequestMapping(value = "/findpw", method = RequestMethod.POST)
    public void findPwPOST(@ModelAttribute memberVO vo, HttpServletResponse response) throws Exception {
        service.findPw(response, vo);
    }

}
