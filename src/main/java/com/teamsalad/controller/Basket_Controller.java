package com.teamsalad.controller;

import com.teamsalad.domain.cartVO;
import com.teamsalad.service.BasketService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Basket")
public class Basket_Controller {

    @Inject
    private BasketService service;

    // http://localhost:8080/Basket/basket
    // 1. 장바구니 목록
    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public String basketGet(HttpSession session, Model model) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        model.addAttribute("m_id", m_id);
        model.addAttribute("Basket", service.Basket(m_id));

        return "/Basket/basket";
    }

    // 2. 장바구니 비우기
    @RequestMapping(value = "/basket", method = RequestMethod.POST)
    public String basketPOST(cartVO vo) throws Exception {

        // 서비스 객체안에 삭제처리 동작
        service.deleteCart(vo.getCart_num());

        // 리스트페이지로 이동
        return "redirect:/Basket/basket";
    }

}
