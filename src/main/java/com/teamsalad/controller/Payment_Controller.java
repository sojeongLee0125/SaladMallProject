package com.teamsalad.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamsalad.domain.SaladCartVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.persistence.M_LoginDAO;
import com.teamsalad.service.PaymentService;

@Controller
@RequestMapping("/Payment/*")
public class Payment_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Payment_Controller.class);
	
	// 서비스객체 주입
	@Inject
	private PaymentService service;
	
	@Inject
	private M_LoginDAO mdao;
	
	// 장바구니 페이지
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public void getPayment(HttpSession session, Model model) throws Exception {
		
		String m_id = (String)session.getAttribute("m_id");
		
		model.addAttribute("orderInfo", service.getOrderInfo(m_id));
		model.addAttribute("member", mdao.readMember(m_id));
	}
	
	// 장바구니 등록
	@RequestMapping(value = "cart", method = RequestMethod.POST)
	public void postPayment(HttpSession session, orderVO ovo) throws Exception {
		
		String m_id = (String)session.getAttribute("m_id");
		
		ovo.setM_id(m_id);
		ovo.setCoupon_id(0);
		ovo.setOrder_pay_num(Integer.toString(service.getOrderPayNum()) );
		ovo.setOrder_ship_price("5000");
		
		//rcp_name, rcp_num, amount
		List<SaladCartVO> list = service.getOrderInfo(m_id);
		
		for(SaladCartVO svo: list) {
			ovo.setRcp_num(svo.getRecipe().getRcp_num());
			ovo.setRcp_name(svo.getRecipe().getRcp_name());
			ovo.setOrder_amount(svo.getCart().getCart_amount());
			
			int total_price = Integer.parseInt(svo.getCart().getCart_price())
					+ 5000;
			
			ovo.setOrder_total_price(Integer.toString(total_price));
			
			service.orderInfo(ovo);
			service.deleteCart(svo.getCart().getCart_num());
		}
	}

}
