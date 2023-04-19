package com.teamsalad.service;

import com.teamsalad.domain.*;
import com.teamsalad.persistence.R_BoardDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

@Service
public class R_BoardServiceImpl implements R_BoardService {

    @Inject
    private R_BoardDAO dao;

    // 게시물 등록하기
    public void registBoard(recipeBoardVO vo) throws Exception {
        dao.r_Board_regist(vo);
    }

    // 레시피 들고오기
    @Override
    public recipeVO getRecipe(int rcp_num) throws Exception {
        recipeVO vo = dao.R_BoardgetRecipe(rcp_num);
        return vo;
    }

    // 게시물 삭제하기
    public void deleteBoard(int rcp_b_num) throws Exception {
        dao.r_Board_delete(rcp_b_num);
    }

    // 게시물 수정하기
    public void modifyBoard(recipeBoardVO vo) throws Exception {
        dao.r_Board_modify(vo);
    }

    // 게시물 리스트 페이지 불러오기
    @Override
    public List<BoardMemberVO> getListPage(int page, int total) throws Exception {
        List<BoardMemberVO> vo = dao.r_Board_listPage(page, total);
        return vo;
    }

    // 게시물 자세히 불러오기
    @Override
    public BoardMemberVO getBoardDetail(int rcp_b_num) throws Exception {
        BoardMemberVO vo = dao.r_Board_detail(rcp_b_num);
        return vo;
    }

    // 재료 이름 가져오기
    public String getIgdtName(int igdt) throws Exception {
        return dao.r_Board_getIgdtName(igdt);
    }

    // 좋아요 확인하기
    @Override
    public boolean checkBoardLike(int rcp_b_num, String m_id) throws Exception {
        return dao.r_Board_likeCheck(rcp_b_num, m_id);
    }

    // 좋아요 테이블 추가 게시판 업데이트
    @Override
    public void boardLikeAdd(int rcp_b_num, String m_id) throws Exception {
        dao.r_Board_likeInsert(rcp_b_num, m_id);
        dao.r_Board_likeUpdate(rcp_b_num);
    }

    // 좋아요 테이블 삭제,  게시판 좋아요 업데이트
    @Override
    public void boadrLikeCancel(int rcp_b_num, String m_id) throws Exception {
        dao.r_Board_likeDelete(rcp_b_num, m_id);
        dao.r_Board_likeDiscount(rcp_b_num);
    }

    // 주간 인기 품목 가져오기
    @Override
    public List<BoardMemberVO> getWeeklyPopular() throws Exception {
        List<BoardMemberVO> vo = dao.r_Board_weeklyPopular();
        return vo;
    }

    //검색한 데이터 불러오기
    @Override
    public List<recipeBoardVO> getSearchData(String column, String data) throws Exception {
        List<Integer> rcp_b_nums = dao.r_Board_searchData(column, ("%" + data + "%"));
        if (rcp_b_nums.size() != 0) {
            List<recipeBoardVO> searchTitle = dao.r_Board_searchNum(rcp_b_nums);
            return searchTitle;
        }
        return null;
    }

    // 댓글 불러오기
    @Override
    public List<replyVO> getBoardReply(int rcp_b_num) throws Exception {
        List<replyVO> vo = dao.r_Board_listReply("board", rcp_b_num);
        return vo;
    }

    // 댓글 등록
    @Override
    public void addReply(replyVO vo) throws Exception {
        dao.r_Board_addReply(vo);
    }

    // 댓글 삭제
    @Override
    public void deleteReply(int reply_b_num) throws Exception {
        dao.r_Board_delete(reply_b_num);
    }

    // 댓글 수정
    @Override
    public void modifyReply(int reply_b_num, String reply_b_content) throws Exception {
        dao.r_Board_modifyReply(reply_b_content, reply_b_num);
    }

    // 게시글 수 조회
    @Override
    public int countBoards(Criteria cri) throws Exception {
        return dao.countBoards(cri);
    }

    // 전체 회원 목록 페이징 조회
    @Override
    public List<BoardMemberVO> bListCri(Criteria cri) throws Exception {
        return dao.bListCri(cri);
    }

    // 검색결과 불러오기
    @Override
    public Object getSearchTotal(String table_name, String data) throws Exception {
        Object returnData = new ArrayList<Object>();
        String primary_key = dao.total_getPrimaryKeyName(table_name);

        List<String> columns = dao.total_getDBColumn(table_name);
        List<Integer> search_num = new ArrayList<Integer>();

        for (String column : columns) {
            for (int i : dao.total_searchPrimaryKey(table_name, primary_key, column, data)) {
                search_num.add(i);
            }
        }

        if (search_num.size() != 0)
            returnData = dao.total_searchTotal(table_name, primary_key, search_num);

        return returnData;
    }
}
