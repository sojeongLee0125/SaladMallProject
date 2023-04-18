package com.teamsalad.controller;

import com.teamsalad.domain.*;
import com.teamsalad.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/Admin")
public class Admin_Controller {

    @Inject
    private AdminService service;

    // 관리자 메인 페이지(GET)
    // http://localhost:8080/Admin/main
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String adminMainGET(HttpSession session, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");
        int pageNum = 1;

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        // 최근 주문 리스트 전달
        List<orderVO> recentOList = service.getRecentOrder();

        // 인기 레시피 리스트 전달
        List<recipeBoardVO> popularRList = service.getPopularRecipe();

        model.addAttribute("pageNum", pageNum);
        model.addAttribute("recentOList", recentOList);
        model.addAttribute("popularRList", popularRList);

        return "/Admin/main";
    }

    // 권한없는 잘못된 접근(GET)
    @RequestMapping(value = "/notAdminAccess", method = RequestMethod.GET)
    public void notAdminAccessGET() throws Exception {
    }

    // 관리자 정보 등록 성공(GET)
    @RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
    public void registerSuccessGET() throws Exception {
    }

    ////////////////////////////////////////////////////////////회원정보관련/////////////////////////////////////////////////////////////////////////

    // 회원 전체 리스트 출력(GET)
    @RequestMapping(value = "/mListAll", method = RequestMethod.GET)
    public String memberListAllGET(HttpSession session, Criteria cri, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        // 페이징처리 정보생성 (하단부)
        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(service.countMembers(cri));

        // Criteria 객체 정보 저장(pageStart/pageSize)
        model.addAttribute("mListAll", service.mListCri(cri));
        model.addAttribute("pm", pm);

        return "/Admin/mListAll";
    }

    // 개별 회원 정보 조회(GET)
    @RequestMapping(value = "/mInfo", method = RequestMethod.GET)
    public String memberInfoGET(HttpSession session, String m_id, Model model, Integer pageNum) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        memberVO mvo = service.getMInfo(m_id);

        // 쿠폰 정보도 같이 전달
        int coupon_id = mvo.getM_coupon();

        model.addAttribute("cvo", service.getCouponInfo(coupon_id));
        model.addAttribute("mvo", mvo);
        model.addAttribute("pageNum", pageNum);

        return "/Admin/mInfo";
    }

    // 검색용 회원 정보 조회(GET)
    @RequestMapping(value = "/mInfoSeq", method = RequestMethod.GET)
    public String memberInfoSeqGET(HttpSession session, Integer m_seq, Model model, Integer pageNum) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        model.addAttribute("mvo", service.getMInfoSeq(m_seq));
        model.addAttribute("pageNum", pageNum);

        return "/Admin/mInfo";
    }


    // 개별 회원 정보 수정(GET)
    @RequestMapping(value = "/mUpdate", method = RequestMethod.GET)
    public String memberUpdateGET(HttpSession session, String m_id, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        model.addAttribute("mvo", service.getMInfo(m_id));

        return "Admin/mUpdate";
    }

    // 개별 회원 정보 수정(POST)
    @RequestMapping(value = "/mUpdate", method = RequestMethod.POST)
    public String memberUpdatePOST(memberVO uvo) throws Exception {
        service.updateMember(uvo);
        return "redirect:/Admin/mListAll";
    }

    // 개별 회원 정보 삭제(GET)
    @RequestMapping(value = "/mDelete", method = RequestMethod.GET)
    public String memberDeleteGET(HttpSession session, String m_id) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        service.deleteMember(m_id);

        return "redirect:/Admin/mListAll";
    }

    ////////////////////////////////////////////////////////////주문관련/////////////////////////////////////////////////////////////////////////

    // 전체 주문 목록 조회(GET)
    @RequestMapping(value = "/oListAll", method = RequestMethod.GET)
    public String orderListAllGET(HttpSession session, Criteria cri, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        // 페이징처리 정보생성 (하단부)
        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(service.countOrders(cri));

        // Criteria 객체 정보 저장(pageStart/pageSize)
        model.addAttribute("oListAll", service.oListCri(cri));
        model.addAttribute("pm", pm);

        return "/Admin/oListAll";
    }

    // 개별 주문 정보 조회(GET)
    @RequestMapping(value = "/oInfo", method = RequestMethod.GET)
    public String orderInfoGET(HttpSession session, Integer order_num, Model model, Integer pageNum) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        orderVO ovo = service.getOInfo(order_num);

        // 주문정보 속 쿠폰정보 전달
        int coupon_id = ovo.getCoupon_id();

        model.addAttribute("cvo", service.getCouponInfo(coupon_id));
        model.addAttribute("ovo", ovo);
        model.addAttribute("pageNum", pageNum);

        return "/Admin/oInfo";
    }

    // 개별 주문 정보 수정(GET)
    @RequestMapping(value = "/oUpdate", method = RequestMethod.GET)
    public String orderUpdateGET(HttpSession session, Integer order_num, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        orderVO ovo = service.getOInfo(order_num);

        int coupon_id = ovo.getCoupon_id();

        model.addAttribute("cvo", service.getCouponInfo(coupon_id));
        model.addAttribute("ovo", service.getOInfo(order_num));

        return "/Admin/oUpdate";
    }

    // 개별 주문 정보 수정(POST)
    @RequestMapping(value = "/oUpdate", method = RequestMethod.POST)
    public String orderUpdatePOST(orderVO ovo) throws Exception {
        service.updateOrder(ovo);

        return "redirect:/Admin/oListAll";
    }

    // 개별 주문 정보 삭제(GET)
    @RequestMapping(value = "/oDelete", method = RequestMethod.GET)
    public String orderDeleteGET(HttpSession session, Integer order_num) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        service.deleteOrder(order_num);

        return "redirect:/Admin/oListAll";
    }

    ////////////////////////////////////////////////////////////재료 재고 정보 관련////////////////////////////////////////////////////////////////////

    // 샐러드 재료 전체 리스트 출력(GET)
    @RequestMapping(value = "/igdtListAll", method = RequestMethod.GET)
    public String igdtListAllGET(HttpSession session, Criteria cri, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        // 페이징처리 정보생성 (하단부)
        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(service.countIngredients(cri));

        // Criteria 객체 정보 저장(pageStart/pageSize)
        model.addAttribute("igdtListAll", service.igdtListCri(cri));
        model.addAttribute("pm", pm);

        return "/Admin/igdtListAll";
    }

    // 샐러드 재료 등록(GET)
    @RequestMapping(value = "/igdtRegister", method = RequestMethod.GET)
    public String igdtRegisterGET(HttpSession session) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        return "/Admin/igdtRegister";
    }

    // 샐러드 재료 등록(POST)
    @RequestMapping(value = "/igdtRegister", method = RequestMethod.POST)
    public String igdtRegisterPOST(ingredientVO ivo) throws Exception {
        service.igdtRegister(ivo);

        return "redirect:/Admin/igdtListAll";
    }

    // 샐러드 재료 사진업로드 기능(POST)
    @RequestMapping(value = "/igdtImgRegister", method = RequestMethod.POST)
    public void igdtImgRegisterPOST(MultipartFile igdt_main_img, HttpServletRequest request) throws Exception {

        ServletContext servletContext = request.getSession().getServletContext();
        String uploadFolder = servletContext.getRealPath("./resources/upload");

        // 폴더생성
        File uploadPath = new File(uploadFolder);

        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        // 파일 이름
        String uploadFileName = igdt_main_img.getOriginalFilename();

        // 파일 위치, 파일 이름을 합친 File 객체
        File saveFile = new File(uploadPath, uploadFileName);

        // 파일 저장
        try {
            igdt_main_img.transferTo(saveFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 개별 재료 정보 조회(GET)
    @RequestMapping(value = "/igdtInfo", method = RequestMethod.GET)
    public String igdtInfoGET(HttpSession session, Integer igdt_num, Model model, Integer pageNum) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        ingredientVO ivo = service.getIgdtInfo(igdt_num);

        model.addAttribute("ivo", ivo);
        model.addAttribute("pageNum", pageNum);

        return "/Admin/igdtInfo";
    }

    // 개별 재료 정보 수정(GET)
    @RequestMapping(value = "igdtUpdate", method = RequestMethod.GET)
    public String igdtUpdateGET(HttpSession session, Integer igdt_num, Model model, Integer pageNum) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        model.addAttribute("ivo", service.getIgdtInfo(igdt_num));
        model.addAttribute("pageNum", pageNum);

        return "/Admin/igdtUpdate";
    }

    // 개별 재료 재고 정보 수정(POST)
    @RequestMapping(value = "/igdtUpdate", method = RequestMethod.POST)
    public String igdtUpdatePOST(ingredientVO ivo) throws Exception {
        service.updateIngredient(ivo);
        return "redirect:/Admin/igdtListAll";
    }

    // 개별 재료 정보 삭제(GET)
    @RequestMapping(value = "/igdtDelete", method = RequestMethod.GET)
    public String ingredientDeleteGET(HttpSession session, Integer igdt_num) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        service.deleteIngredient(igdt_num);

        return "redirect:/Admin/igdtListAll";
    }

    ////////////////////////////////////////////////////////////쿠폰 정보 관련////////////////////////////////////////////////////////////////////

    // 쿠폰 전체 리스트 출력(GET)
    @RequestMapping(value = "/couponListAll", method = RequestMethod.GET)
    public String couponListAllGET(HttpSession session, Criteria cri, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        // 페이징처리 정보생성 (하단부)
        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(service.countCoupons(cri));

        // Criteria 객체 정보 저장(pageStart/pageSize)
        model.addAttribute("couponListAll", service.couponListCri(cri));
        model.addAttribute("pm", pm);

        return "/Admin/couponListAll";
    }

    // 쿠폰 개별 상세정보 조회(GET)
    @RequestMapping(value = "/couponInfo", method = RequestMethod.GET)
    public String couponInfoGET(HttpSession session, Integer coupon_id, Model model, Integer pageNum) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        couponVO cvo = service.getCouponInfo(coupon_id);

        model.addAttribute("cvo", cvo);
        model.addAttribute("pageNum", pageNum);

        return "/Admin/couponInfo";
    }

    // 쿠폰 발급 회원 조회(GET)
    @RequestMapping(value = "/couponMList", method = RequestMethod.GET)
    public String couponMListGET(Model model, Integer coupon_id) throws Exception {
        model.addAttribute("couponMList", service.getCouponMList(coupon_id));

        return "/Admin/couponMList";
    }

    // 개별 쿠폰 정보 수정(GET)
    @RequestMapping(value = "/couponUpdate", method = RequestMethod.GET)
    public String couponUpdateGET(HttpSession session, Integer coupon_id, Model model, Integer pageNum) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        model.addAttribute("cvo", service.getCouponInfo(coupon_id));
        model.addAttribute("pageNum", pageNum);

        return "/Admin/couponUpdate";
    }

    // 개별 쿠폰 정보 수정(POST)
    @RequestMapping(value = "/couponUpdate", method = RequestMethod.POST)
    public String couponUpdatePOST(couponVO cvo, Integer pageNum) throws Exception {
        service.updateCoupon(cvo);
        return "redirect:/Admin/couponListAll?pageNum=" + pageNum;
    }

    // 개별 쿠폰 정보 삭제(GET)
    @RequestMapping(value = "/couponDelete", method = RequestMethod.GET)
    public String couponDeleteGET(HttpSession session, Integer coupon_id, Integer pageNum) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        service.deleteCoupon(coupon_id);

        return "redirect:/Admin/couponListAll?pageNum=" + pageNum;
    }

    // 쿠폰 등록(GET)
    @RequestMapping(value = "/couponRegister", method = RequestMethod.GET)
    public String couponRegisterGET(HttpSession session) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        return "/Admin/couponRegister";
    }

    // 쿠폰 등록(POST)
    @RequestMapping(value = "/couponRegister", method = RequestMethod.POST)
    public String couponRegisterPOST(couponVO cvo) throws Exception {
        Random random = new Random();

        int coupon_id = random.nextInt(88888) + 11111;
        cvo.setCoupon_id(coupon_id);
        service.couponRegister(cvo);

        return "redirect:/Admin/registerSuccess";
    }

    // 개별 회원 쿠폰 발급(GET)
    @RequestMapping(value = "/memberCouponRegister", method = RequestMethod.GET)
    public String memberCouponRegisterGET(HttpSession session, Model model, Criteria cri) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        model.addAttribute("couponListAll", service.couponListCri(cri));

        return "/Admin/memberCouponRegister";
    }

    // 개별 회원 쿠폰 발급(POST)
    @RequestMapping(value = "/memberCouponRegister", method = RequestMethod.POST)
    public String memberCouponRegisterPOST(memberVO mvo) throws Exception {
        service.memberInsertCoupon(mvo);
        return "redirect:/Admin/registerSuccess";
    }

//////////////////////////////////////////////////////////// 판매 성향 정보 관련////////////////////////////////////////////////////////////////////

    // 주간 레시피 게시판 top 10 출력(GET)
    @RequestMapping(value = "/RBoard_TopList", method = RequestMethod.GET)
    public String RBoard_TopListGET(HttpSession session, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        // Criteria 객체 정보 저장(pageStart/pageSize)
        model.addAttribute("RBoard_TopList", service.getR_Board_TopList());

        return "/Admin/RBoard_TopList";
    }

    // 주간 샐러드 판매량 top 10 출력(GET)
    @RequestMapping(value = "/Salad_TopList", method = RequestMethod.GET)
    public String Salad_TopListGET(HttpSession session, Model model) throws Exception {
        String admin_id = (String) session.getAttribute("m_id");

        if (admin_id == null || !admin_id.equals("admin")) {
            return "redirect:/Admin/notAdminAccess";
        }

        // Criteria 객체 정보 저장(pageStart/pageSize)
        model.addAttribute("Salad_TopList", service.getSalad_TopList());

        return "/Admin/Salad_TopList";
    }

}
