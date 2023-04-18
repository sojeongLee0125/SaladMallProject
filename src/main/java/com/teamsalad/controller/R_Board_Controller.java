package com.teamsalad.controller;

import com.teamsalad.domain.*;
import com.teamsalad.service.R_BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/R_Board")
public class R_Board_Controller {

    @Inject
    R_BoardService service;

    //	게시물 리스트 가져오기
    //	http://localhost:8080/controller/R_Board/boardList
    @RequestMapping(value = "/boardList", method = RequestMethod.GET)
    public void main(Model model, Criteria cri) throws Exception {
        List<BoardMemberVO> weeklyPopular = service.getWeeklyPopular();

        cri.setPageAmount(4);
        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(service.countBoards(cri));

        model.addAttribute("pages", service.bListCri(cri));
        model.addAttribute("weeklyPopular", weeklyPopular);
        model.addAttribute("pm", pm);
    }

    //	게시물 자세히 보기
    @RequestMapping(value = "/board_detail", method = RequestMethod.GET)
    public void boardPage(@RequestParam("rcp_b_num") int rcp_b_num, Model model, HttpSession session) throws Exception {
        BoardMemberVO vo = service.getBoardDetail(rcp_b_num);

        List<BoardMemberVO> weeklyPopular = service.getWeeklyPopular();

        String m_id = (String) session.getAttribute("m_id");
        boolean likeCheck = false;

        List<replyVO> comments = service.getBoardReply(rcp_b_num);

        if (m_id != null) likeCheck = service.checkBoardLike(rcp_b_num, m_id);

        service.checkBoardLike(rcp_b_num, null);

        String[] igdts = vo.getRecipe().getRcp_cmbnt().split(",");
        for (int i = 0; i < igdts.length; i++) {
            igdts[i] = service.getIgdtName(Integer.parseInt(igdts[i]));
        }

        vo.getRecipe().setRcp_cmbnt(String.join("/", igdts));

        model.addAttribute("board", vo);
        model.addAttribute("weeklyPopular", weeklyPopular);
        model.addAttribute("like", likeCheck);
        model.addAttribute("comments", comments);
    }

    //	좋아요 체크 후 적용하기
    @RequestMapping(value = "/likeCheck", method = RequestMethod.GET)
    public String likeCheck(@RequestParam("rcp_b_num") int rcp_b_num, HttpSession session) throws Exception {
        String m_id = (String) session.getAttribute("m_id");

        if (m_id != null) {
            // 로그인 체크 후 좋아요 유무 체크하여 좋아요를 이미 했을 경우 삭제
            // 좋아요를 안했을 경우 추가
            if (service.checkBoardLike(rcp_b_num, m_id)) {
                service.boadrLikeCancel(rcp_b_num, m_id);
            } else {
                service.boardLikeAdd(rcp_b_num, m_id);
            }
        }

        return "redirect:/R_Board/board_detail?rcp_b_num=" + rcp_b_num;
    }

    // 게시물 등록 페이지 이동
    @RequestMapping(value = "regist", method = RequestMethod.GET)
    public void registBoardGET() throws Exception {
    }

    // 게시물 등록
    @RequestMapping(value = "regist", method = RequestMethod.POST)
    public String registBoardPOST(recipeBoardVO vo, HttpSession session, @RequestParam("rcp_b_img") MultipartFile[] img, HttpServletRequest request) throws Exception {
        String id = (String) session.getAttribute("m_id");

        vo.setM_id(id);
        recipeVO bmvo = service.getRecipe(vo.getRcp_num());
        vo.setRcp_b_thumbnail(bmvo.getRcp_img());

        ServletContext servletContext = request.getSession().getServletContext();
        String uploadFolder = servletContext.getRealPath("./resources/upload");

        File uploadPath = new File(uploadFolder);

        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        int count = 1;

        for (MultipartFile igdt_main_img : img) {
            String uploadFileName = igdt_main_img.getOriginalFilename();
            if (uploadFileName.equals("")) break;

            if (count == 1) vo.setRcp_b_img1(uploadFileName);
            else if (count == 2) vo.setRcp_b_img2(uploadFileName);
            else if (count == 3) vo.setRcp_b_img3(uploadFileName);

            count += 1;

            // 파일 위치, 파일 이름을 합친 File 객체
            File saveFile = new File(uploadPath, uploadFileName);

            // 파일 저장
            try {
                igdt_main_img.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        service.registBoard(vo);

        return "redirect:/R_Board/boardList";
    }

    // 게시물 삭제하기
    @RequestMapping(value = "boardDelete", method = RequestMethod.GET)
    public String boardDelete(@RequestParam int rcp_b_num) throws Exception {
        service.deleteBoard(rcp_b_num);
        return "redirect:/R_Board/boardList";
    }

    // 게시물 수정하기 페이지 이동
    @RequestMapping(value = "boardModify", method = RequestMethod.GET)
    public void boardModifyGET(@RequestParam("rcp_b_num") int rcp_b_num, Model model) throws Exception {
        BoardMemberVO vo = service.getBoardDetail(rcp_b_num);
        model.addAttribute("board", vo);
    }

    // 게시물 수정하기
    @RequestMapping(value = "boardModify", method = RequestMethod.POST)
    public String boardModifyPOST(recipeBoardVO vo) throws Exception {
        service.modifyBoard(vo);
        return "redirect:/R_Board/board_detail?rcp_b_num=" + vo.getRcp_b_num();
    }

    // Rest로 검색 결과 불러오기
    @RequestMapping(value = "searchData")
    public @ResponseBody List<recipeBoardVO> searchTitle(String searchData) throws Exception {
        List<recipeBoardVO> searchTitle = service.getSearchData("rcp_b_title", searchData);
        return searchTitle;
    }

    @RequestMapping(value = "/totalSearch")
    public void searchPage() {
    }

    // 검색 데이터 불러오기
    @RequestMapping(value = "searchTotal/{table}")
    public @ResponseBody List<searchVO> searchTotal(@PathVariable String table, String searchData) throws Exception {
        Object searchTitle = service.getSearchTotal(table, searchData);
        List<searchVO> s = objectToSearchVO(table, searchTitle);
        return s;
    }

    // 검색 데이터 불러오기 (private)
    private List<searchVO> objectToSearchVO(String table, Object o) {

        List<searchVO> list = new ArrayList<searchVO>();

        switch (table) {
            case "recipe_board":
                List<recipeBoardVO> lvo = (List<recipeBoardVO>) o;
                for (recipeBoardVO vo : lvo) {
                    searchVO svo = new searchVO();

                    svo.setPrimaryKey(vo.getRcp_b_num());
                    svo.setTitle(vo.getRcp_b_title());
                    svo.setAddress("../R_Board/board_detail?rcp_b_num=" + vo.getRcp_b_num());
                    list.add(svo);
                }
                break;
            case "tbl_member":
                List<memberVO> mvo = (List<memberVO>) o;
                for (memberVO vo : mvo) {
                    searchVO svo = new searchVO();
                    svo.setPrimaryKey(vo.getM_seq());
                    svo.setTitle(vo.getM_id());
                    svo.setAddress("../Admin/mInfo?m_id=" + vo.getM_id() + "&pageNum=1");
                    list.add(svo);
                }
                break;
            case "tbl_order":
                List<orderVO> ovo = (List<orderVO>) o;
                for (orderVO vo : ovo) {
                    searchVO svo = new searchVO();
                    svo.setPrimaryKey(vo.getOrder_num());
                    svo.setTitle("" + vo.getOrder_num());
                    svo.setAddress("../Admin/oInfo?order_num=" + vo.getOrder_num() + "&pageNum=1");
                    list.add(svo);
                }
                break;
            case "salad_recipe":
                List<recipeVO> rvo = (List<recipeVO>) o;
                for (recipeVO vo : rvo) {
                    searchVO svo = new searchVO();
                    svo.setPrimaryKey(vo.getRcp_num());
                    svo.setTitle("" + vo.getRcp_name());
                    svo.setAddress("../Admin/oInfo?order_num=" + vo.getRcp_num() + "&pageNum=1");
                    list.add(svo);
                }
                break;
            default:
                break;
        }

        return list;
    }
}
