package com.teamsalad.service;

import com.teamsalad.domain.*;

import java.util.List;

public interface R_BoardService {

    // 게시물 등록하기
    public void registBoard(recipeBoardVO vo) throws Exception;

    // 게시물 삭제하기
    public void deleteBoard(int rcp_b_num) throws Exception;

    // 게시물 수정하기
    public void modifyBoard(recipeBoardVO vo) throws Exception;

    // 게시물 리스트 페이지 불러오기
    public List<BoardMemberVO> getListPage(int page, int total) throws Exception;

    // 게시물 자세히 불러오기
    public BoardMemberVO getBoardDetail(int rcp_b_num) throws Exception;

    // 재료 이름 가져오기
    public String getIgdtName(int igdt) throws Exception;

    public recipeVO getRecipe(int rcp_num) throws Exception;

    // 좋아요 확인하기
    public boolean checkBoardLike(int rcp_b_num, String m_id) throws Exception;

    // 좋아요 테이블 추가 게시판 업데이트
    public void boardLikeAdd(int rcp_b_num, String m_id) throws Exception;

    // 좋아요 테이블 삭제 게시판 좋아요 업데이트
    public void boadrLikeCancel(int rcp_b_num, String m_id) throws Exception;

    // 주간 인기 품목 가져오기
    public List<BoardMemberVO> getWeeklyPopular() throws Exception;

    //검색한 데이터 불러오기
    public List<recipeBoardVO> getSearchData(String column, String data) throws Exception;

    // 게시물 댓글들 불러오기
    public List<replyVO> getBoardReply(int rcp_b_num) throws Exception;

    // 댓글 등록하기
    public void addReply(replyVO vo) throws Exception;

    // 댓글 삭제하기
    public void deleteReply(int reply_b_num) throws Exception;

    // 댓글 수정하기
    public void modifyReply(int reply_b_num, String reply_b_content) throws Exception;

    // 전체 게시물 목록 갯수 조회
    public int countBoards(Criteria cri) throws Exception;

    // 전체 게시판 목록 페이징 조회
    public List<BoardMemberVO> bListCri(Criteria cri) throws Exception;

    // 선택한 테이블에서 데이터 검색하기
    public Object getSearchTotal(String table_name, String data) throws Exception;
}
