package com.teamsalad.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.PageMaker;
import com.teamsalad.domain.customerBoardVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.domain.replyVO;
import com.teamsalad.service.CSService;

@Controller
@RequestMapping("/CS/*")
public class CS_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(CS_Controller.class);
	
	@Inject
	private CSService CS_service;
	
	// 게시판 글 전체 조회 페이지(GET)
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listALLGET(Criteria cri, Model model, @ModelAttribute("result") String result) throws Exception {

		logger.info(" C: listALLGET() 호출 ");

		// 페이징처리 정보생성 (하단부)
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(CS_service.countCSBoard(cri));

		// Criteria 객체 정보 저장(pageStart/pageSize)
		model.addAttribute("listAll", CS_service.listCri(cri));
		model.addAttribute("pm", pm);

		return "/CS/listAll";
	}
	
	// 글쓰기(GET)
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET(HttpSession session, Model model) throws Exception{
		
		logger.info(" C : registerGET() 호출 -> view 페이지");
		
		// 세션값 저장
		String m_id = (String)session.getAttribute("m_id");
		
		if (m_id == null) {
			return "redirect:/M_Login/login";
		}
		
		model.addAttribute("m_id", m_id);
		model.addAttribute("m_orderList", CS_service.memberOrderInfo(m_id));
		
		return "/CS/register";
	}
	
	// 글쓰기(POST)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(customerBoardVO CS_vo, Model model) throws Exception {
		
		logger.info(" C: registerPOST() 호출");
		
		CS_service.create(CS_vo);
		
		model.addAttribute("result", "success");

		return "redirect:/CS/listAll";
	}
		
	// 글읽기(GET)
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(HttpSession session ,Integer customer_b_num, Model model,Integer pageNum) throws Exception{
		
		logger.info(" C : readGET() 호출! ");
		
		String m_id = (String) session.getAttribute("m_id");
				
		customerBoardVO CS_vo = CS_service.read(customer_b_num);
		
		// DB에서 가져온 데이터를 저장
		model.addAttribute("CS_vo", CS_vo);
		model.addAttribute("m_id", m_id);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 게시판 글 수정(GET)
	@RequestMapping(value = "/modify", method = {RequestMethod.GET})
	public String modifyGET(Integer customer_b_num, Model model, HttpSession session) throws Exception {
		
		logger.info(" C : modifyGET() 호출");
		
		String m_id = (String)session.getAttribute("m_id");
		
		if (m_id == null) {
			return "redirect:/M_Login/login";
		}
		
		model.addAttribute("m_id", m_id);
		model.addAttribute("m_orderList", CS_service.memberOrderInfo(m_id));		
		model.addAttribute("cvo", CS_service.read(customer_b_num));
	
		return "/CS/modify";	
	}
	
	// 게시판 글 수정처리(POST)
	@RequestMapping(value = "/modify" , method = RequestMethod.POST)
	public String modifyPOST(customerBoardVO CS_vo) throws Exception{
		
		logger.info(" C: modifyPOST(customerBoardVO CS_vo) 호출" );

		CS_service.modify(CS_vo);
		
		return "redirect:/CS/listAll";
	}
	
	// 게시판 글 삭제(GET)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET( HttpSession session, Integer customer_b_num) throws Exception{
		
		// 세션값 저장
		String m_id = (String)session.getAttribute("m_id");
		
		if (m_id == null) {
			return "redirect:/M_Login/login";
		}
		
		// 서비스 객체안에 삭제처리 동작
		CS_service.delete(customer_b_num);
		
		// 리스트페이지로 이동
		return "redirect:/CS/listAll";
	}
	
	// 게시판 글 삭제 (POST)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePost(Integer customer_b_num) throws Exception{
		
		// 서비스 객체안에 삭제처리 동작
		CS_service.delete(customer_b_num);
		
		// 리스트페이지로 이동
		return "redirect:/CS/listAll";
	}
}
