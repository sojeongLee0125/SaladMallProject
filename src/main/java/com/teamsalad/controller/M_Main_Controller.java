package com.teamsalad.controller;

import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.service.M_MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/M_Main/*")
public class M_Main_Controller {

    @Inject
    private M_MainService service;

    // 회원 마이페이지(GET)
    @RequestMapping(value = "/mypage", method = RequestMethod.GET)
    public String memberMypageGET(HttpSession session, Model model) throws Exception {
        // 세션값 저장
        String m_id = (String) session.getAttribute("m_id");
        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        memberVO mvo = service.getMemberInfo(m_id);
        model.addAttribute("mvo", mvo);

        return "/M_Main/mypage";
    }


    // 회원 정보조회(GET)
    @RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
    public String memberInfoGET(HttpSession session, Model model) throws Exception {
        // 세션값 저장
        String m_id = (String) session.getAttribute("m_id");
        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        memberVO mvo = service.getMemberInfo(m_id);
        model.addAttribute("mvo", mvo);
        return "/M_Main/memberInfo";
    }

    // 회원정보 수정(GET)
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
    public String memberUpdateGET(HttpSession session, Model model) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        model.addAttribute("mvo", service.getMemberInfo(m_id));

        return "/M_Main/memberUpdate";
    }

    // 회원정보 수정 처리(POST)
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
    public String memberUpdatePOST(memberVO mvo) throws Exception {
        service.updateMember(mvo);

        return "redirect:/M_Main/mypage";
    }

    // 회원 탈퇴(GET)
    @RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
    public String memberDeleteGET(HttpSession session, Model model) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        model.addAttribute("mvo", service.getMemberInfo(m_id));

        return "/M_Main/memberDelete";
    }

    // 회원 탈퇴(POST)
    @RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
    public String memberDeletePOST(HttpSession session) throws Exception {
        String m_id = (String) session.getAttribute("m_id");
        memberVO mvo = service.getMemberInfo(m_id);

        service.deleteMember(mvo);
        session.invalidate();

        return "redirect:/index";
    }

    // 주문목록조회(GET)
    @RequestMapping(value = "/orderList", method = RequestMethod.GET)
    public String orderListGET(Model model, HttpSession session) throws Exception {
        // 세션값(id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // 서비스 동작 호출
        List<orderVO> orderList = service.orderList(m_id);
        memberVO mvo = service.getMemberInfo(m_id);

        // 모델 객체에 저장 - view 페이지 까지 전달
        model.addAttribute("orderList", orderList);
        model.addAttribute("mvo", mvo);

        // 페이지 이동/M_Main/orderList.jsp
        return "/M_Main/orderList";
    }

    // 특정 주문 조회
    @RequestMapping(value = "/orderInfo", method = RequestMethod.GET)
    public String orderInfoGET(HttpSession session, Integer order_num, Model model) throws Exception {
        // 세션값(id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // 서비스객체 - 글번호에 해당하는 정보를 가져오는 동작
        orderVO ovo = service.orderInfo(order_num);
        memberVO mvo = service.getMemberInfo(m_id);

        model.addAttribute("ovo", ovo);
        model.addAttribute("mvo", mvo);

        return "/M_Main/orderInfo";

    }

    // 주문 삭제 (get)
    @RequestMapping(value = "/orderDelete", method = RequestMethod.GET)
    public String orderDeleteGET(HttpSession session, Model model, Integer order_num) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        if (order_num == null) {
            return "redirect:/M_Main/orderList";
        }

        model.addAttribute("mvo", service.getMemberInfo(m_id));
        model.addAttribute("ovo", service.orderInfo(order_num));

        return "/M_Main/orderDelete";
    }

    // 주문 삭제(POST)
    @RequestMapping(value = "/orderDelete", method = RequestMethod.POST)
    public String orderDeletePOST(HttpSession session, Integer order_num) throws Exception {
        service.orderDelete(order_num);

        return "redirect:./orderList";
    }

}
