package com.teamsalad.persistence;

import java.util.List;

import com.teamsalad.domain.BoardMemberVO;
import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.recipeBoardVO;
import com.teamsalad.domain.recipeVO;
import com.teamsalad.domain.replyVO;

public interface R_BoardDAO {
	
	// 게시물 등록하기
	public void r_Board_regist(recipeBoardVO vo) throws Exception;
	
	// 게시물 수정하기
	public void r_Board_modify(recipeBoardVO vo) throws Exception;
	
	// 게시물 수정
	public void r_Board_delete(int rcp_b_num) throws Exception;
	
	// 게시물 가져오기
	public BoardMemberVO r_Board_detail(int rcp_b_num) throws Exception;
	
	// 게시물 리스트 일부 가져오기
	public List<BoardMemberVO> r_Board_listPage(int page, int total) throws Exception;
	
	// 재료 이름 가져오기
	public String r_Board_getIgdtName(int igdt) throws Exception;
	
	// 레시피 가져오기
	public recipeVO R_BoardgetRecipe(int rcp_num) throws Exception;
	
	// 주간 인기 게시물 가져오기
	public List<BoardMemberVO> r_Board_weeklyPopular() throws Exception;
	
	// 모든 게시물 가져오기
	public List<BoardMemberVO> r_Board_listTotal() throws Exception;
	
	// 좋아요 누른지 확인하기
	public boolean r_Board_likeCheck(int rcp_b_num, String m_id) throws Exception;
	
	// 좋아요 누른 후 게시물 좋아요 개수 업데이트
	public void r_Board_likeUpdate(int rcp_b_num) throws Exception;
	
	// 좋아요 테이블에 좋아요 삽입
	public void r_Board_likeInsert(int rcp_b_num, String m_id) throws Exception;
	
	// 좋아요 테이블에서 좋아요 삭제
	public void r_Board_likeDelete(int rcp_b_num, String m_id) throws Exception;
	
	// 게시물 좋아요 수치 감소
	public void r_Board_likeDiscount(int rcp_b_num) throws Exception;
	
	// 게시물 댓글들 불러오기
	public List<replyVO> r_Board_listReply(String reply_b_type, int reply_b_main_num) throws Exception;
	
	// 댓글 불러오기
	public replyVO r_Board_reply(int rcp_b_num) throws Exception;
	
	// 댓글 등록하기
	public void r_Board_addReply(replyVO reply) throws Exception;
	
	// 댓글 삭제하기
	public void r_Board_deleteReply(int reply_b_num) throws Exception;
	
	// 댓글 수정하기
	public void r_Board_modifyReply(String reply_b_content, int reply_b_num) throws Exception;
	
	// 멤버 리스트 페이징
	public List<BoardMemberVO> bListCri(Criteria cri) throws Exception;
	
	// 게시판 글 갯수 세기
	public int countBoards(Criteria cri) throws Exception;
	
	// recipe_board 컬럼 이름 가져오기
	public List<String> r_Board_getColumn() throws Exception;
	
	// 가져온 컬럼 데이터로 데이터 검색하기
	public List<Integer> r_Board_searchData(String column, String data) throws Exception;
	
	public List<recipeBoardVO> r_Board_searchNum(List<Integer> rcp_b_nums) throws Exception;
	
	//////////////////////////////////////////////////////////////////////////////////////////
	//
	// 여기부터는 다른 DAO를 만드는것도 좋다고 생각됨
	//
	////////////////////////////////////////////////////////////////////////////////////////
	
	// 선택 테이블의 기본 키(PK) 불러오기
	public String total_getPrimaryKeyName(String table_name) throws Exception;
	
	// 선택 테이블의 모든 컬럼 불러오기(이 부분은 사라질 수 있음 나중에 예외 설명함)
	// 현재는 String으로만 검색하기 때문에 int는 검색 안될 수 있음
	// 비밀번호 같은 검색 되면 안되는 컬럼은 제외해야함
	// 필요한 경우 따로 각 테이블마다 String 리스트를 만들어 검색도 가능함.
	public List<String> total_getDBColumn(String table_name) throws Exception;
	
	// 선택 테이블의 해당 컬럼을 검색하여 기본 키값 가져오기
	public List<Integer> total_searchPrimaryKey(String table_name, String primary_key, String columns, String data) throws Exception;
	
	// 검색한 기본키로 해당 테이블의 모든 정보 가져오기
	public Object total_searchTotal(String table_name, String primary_key, List<Integer> search_num) throws Exception;
	
}
