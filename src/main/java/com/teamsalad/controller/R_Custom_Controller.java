package com.teamsalad.controller;

import com.teamsalad.domain.cartVO;
import com.teamsalad.domain.customVO;
import com.teamsalad.domain.recipeVO;
import com.teamsalad.service.R_CustomService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/R_Custom")
public class R_Custom_Controller {

    @Inject
    private R_CustomService service;

    // http://localhost:8080/R_Custom/main
    // 메인 화면 호출(GET)
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String mainGET(HttpSession session) throws Exception {
        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        return "/R_Custom/main";
    }

    // 새로운 샐러드 만들기
    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public String mainPOST(HttpSession session) throws Exception {

        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // 새로운 샐러드 만들기
        service.newCustom(m_id);

        // 페이지 이동
        return "redirect:/R_Custom/step1";
    }

    // http://localhost:8080/R_Custom/step1
    // 스텝1 - 야채 선택
    @RequestMapping(value = "/step1", method = RequestMethod.GET)
    public String step1GET(HttpSession session, Model model) throws Exception {

        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(1));

        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step1";
    }

    // step-1 등록
    @RequestMapping(value = "/step1", method = RequestMethod.POST)
    public String step1POST(HttpSession session, customVO vo, Integer igdt_num, Model model) throws Exception {

        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");
        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // 재료 추가
        vo.setM_id(m_id);
        vo.setRcp_cmbnt("" + igdt_num);
        service.addCustom(vo);

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(1));

        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step1";
    }

    // http://localhost:8080/R_Custom/step2
    // 스텝2 - 고기 선택
    @RequestMapping(value = "/step2", method = RequestMethod.GET)
    public String step2GET(HttpSession session, Model model) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(2));

        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step2";
    }

    // 스텝 2 - 고기 등록
    @RequestMapping(value = "/step2", method = RequestMethod.POST)
    public String step2POST(HttpSession session, customVO vo, Integer igdt_num, Model model) throws Exception {
        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        vo.setM_id(m_id);
        vo.setRcp_cmbnt("" + igdt_num);
        service.addCustom(vo);

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(2));
        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step2";
    }

    // http://localhost:8080/R_Custom/step3
    // 스텝3 - 해산물 선택
    @RequestMapping(value = "/step3", method = RequestMethod.GET)
    public String step3GET(HttpSession session, Model model) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(3));

        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step3";
    }

    // 스텝3 - 해산물 등록
    @RequestMapping(value = "/step3", method = RequestMethod.POST)
    public String step3POST(HttpSession session, customVO vo, Integer igdt_num, Model model) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        vo.setM_id(m_id);
        vo.setRcp_cmbnt("" + igdt_num);
        service.addCustom(vo);

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(3));
        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step3";
    }

    // http://localhost:8080/R_Custom/step4
    // 스텝4 - 소스 선택
    @RequestMapping(value = "/step4", method = RequestMethod.GET)
    public String step4GET(HttpSession session, Model model) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(4));
        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step4";
    }

    // 스텝4 - 소스 등록
    @RequestMapping(value = "/step4", method = RequestMethod.POST)
    public String step4POST(HttpSession session, customVO vo, Integer igdt_num, Model model) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        vo.setM_id(m_id);
        vo.setRcp_cmbnt("" + igdt_num);
        service.addCustom(vo);

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(4));
        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step4";
    }

    // http://localhost:8080/R_Custom/step5
    // 스텝 5 - 기타 선택
    @RequestMapping(value = "/step5", method = RequestMethod.GET)
    public String step5GET(HttpSession session, Model model) throws Exception {
        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(5));

        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step5";
    }

    // 스텝5 - 기타 등록
    @RequestMapping(value = "/step5", method = RequestMethod.POST)
    public String step5POST(HttpSession session, customVO vo, Integer igdt_num, Model model) throws Exception {
        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        vo.setM_id(m_id);
        vo.setRcp_cmbnt("" + igdt_num);
        service.addCustom(vo);

        // DB에서 가져온 재료 view 페이지로 전달
        model.addAttribute("ingredientList", service.igdtList(5));
        // 현재 샐러드 보여주기
        model.addAttribute("customList", service.customList(m_id));

        return "/R_Custom/step5";

    }

    // 레시피 등록 페이지 호출
    @RequestMapping(value = "/addRecipe", method = RequestMethod.GET)
    public String addRecipeGET(HttpSession session, Model model) throws Exception {
        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // m_id에 해당하는 salad_custom이 null일 경우 돌아감
        if (service.chkcustom(m_id) == null) {
            return "redirect:/R_Custom/main";
        }

        // salad_custom 에서 rcp_cmbnt를 view 페이지로 전달
        model.addAttribute("rcp_cmbnt", service.custom(m_id));

        return "/R_Custom/addRecipe";
    }

    // 레시피 등록하기
    @RequestMapping(value = "/addRecipe", method = RequestMethod.POST)
    public String addRecipePOST(HttpSession session, recipeVO vo) throws Exception {

        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // salad_recipe에 추가
        service.addRecipe(vo);

        // R_Custom/main으로 이동

        return "redirect:/R_Custom/main";
    }

    // 장바구니 페이지 호출
    @RequestMapping(value = "/addCart", method = RequestMethod.GET)
    public String addCartGET(HttpSession session, Model model) throws Exception {
        // 세션값(m_id) 가져오기
        String m_id = (String) session.getAttribute("m_id");

        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        // m_id에 해당하는 salad_custom이 null일 경우 돌아감
        if (service.chkcustom(m_id) == null) {
            return "redirect:/R_Custom/main";
        }

        model.addAttribute("rcp_cmbnt", service.custom(m_id));

        return null;
    }

    // 장바구니 등록
    @RequestMapping(value = "/addCart", method = RequestMethod.POST)
    public String addCartPOST(String m_id, String rcp_cmbnt) throws Exception {
        // 세션값(m_id) 가져오기
        if (m_id == null) {
            return "redirect:/M_Login/login";
        }

        cartVO vo = new cartVO();
        recipeVO rvo = service.findRecipe(rcp_cmbnt);

        vo.setM_id(m_id);
        vo.setRcp_num(rvo.getRcp_num());

        // 레시피 가격
        vo.setCart_price(rvo.getRcp_price());

        // tbl_cart에 추가
        service.addCart(vo);

        return "redirect:/Basket/basket";
    }
}
