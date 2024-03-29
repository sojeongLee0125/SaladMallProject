package com.teamsalad.persistence;

import com.teamsalad.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class R_BoardDAOImpl implements R_BoardDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(R_BoardDAOImpl.class);

    private static final String namespace = "com.teamsalad.mapper.R_BoardMapper";

    // 게시물 등록하기
    public void r_Board_regist(recipeBoardVO vo) throws Exception {
        logger.info(" DAO : board regist 시작");

        sqlSession.insert(namespace + ".R_Board_regist", vo);
    }

    // 레시피 가져오기
    public recipeVO R_BoardgetRecipe(int rcp_num) throws Exception {
        logger.info(" DAO : board regist 시작");

        recipeVO vo = sqlSession.selectOne(namespace + ".R_BoardgetRecipe", rcp_num);

        return vo;
    }

    // 게시물 수정하기
    public void r_Board_modify(recipeBoardVO vo) throws Exception {
        logger.info(" DAO : board modify 시작");

        sqlSession.update(namespace + ".R_Board_modify", vo);
    }

    // 게시물 삭제
    public void r_Board_delete(int rcp_b_num) throws Exception {
        logger.info(" DAO : board delete 시작");

        sqlSession.delete(namespace + ".R_Board_delete", rcp_b_num);
    }

    // 게시물 가져오기
    public BoardMemberVO r_Board_detail(int rcp_b_num) throws Exception {
        logger.info(" DAO : board detail 시작");

        BoardMemberVO vo = sqlSession.selectOne(namespace + ".R_Board_detail", rcp_b_num);

        return vo;
    }

    // 재료 이름 가져오기
    public String r_Board_getIgdtName(int igdt) throws Exception {
        logger.info(" DAO : getIgdtName 시작");

        String name = sqlSession.selectOne(namespace + ".R_Board_getIgdtName", igdt);

        return name;
    }

    // 게시물 리스트 일부 가져오기
    public List<BoardMemberVO> r_Board_listPage(int page, int total) throws Exception {
        logger.info(" DAO : board listPage 시작");

        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("page", page);
        map.put("total", total);

        List<BoardMemberVO> vo = sqlSession.selectList(namespace + ".R_Board_listPage", map);

        return vo;
    }

    // 주간 인기 게시물 가져오기
    public List<BoardMemberVO> r_Board_weeklyPopular() throws Exception {
        logger.info(" DAO : board weeklyPopular 시작");

        List<BoardMemberVO> vo = sqlSession.selectList(namespace + ".R_Board_weeklyPopular");

        return vo;
    }

    // 모든 게시물 가져오기
    public List<BoardMemberVO> r_Board_listTotal() throws Exception {
        logger.info(" DAO : board listTotal 시작");
        return sqlSession.selectList(namespace + ".R_Board_listTotal");
    }

    // 좋아요 누른지 확인하기
    public boolean r_Board_likeCheck(int rcp_b_num, String m_id) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("rcp_b_num", rcp_b_num);
        map.put("m_id", m_id);

        logger.info(" DAO : board likeCheck 시작");

        int check = sqlSession.selectOne(namespace + ".R_Board_likeCheck", map);

        if (check == 0) return false;
        else return true;
    }

    // 좋아요 누른 후 게시물 좋아요 개수 업데이트
    public void r_Board_likeUpdate(int rcp_b_num) throws Exception {
        logger.info(" DAO : board likeUpdate 시작");

        sqlSession.update(namespace + ".R_Board_likeUpdate", rcp_b_num);
    }

    // 좋아요 테이블에 좋아요 삽입
    public void r_Board_likeInsert(int rcp_b_num, String m_id) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rcp_b_num", rcp_b_num);
        map.put("m_id", m_id);

        logger.info(" DAO : board likeInsert 시작");

        sqlSession.insert(namespace + ".R_Board_likeInsert", map);
    }

    // 좋아요 테이블에서 좋아요 삭제
    public void r_Board_likeDelete(int rcp_b_num, String m_id) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rcp_b_num", rcp_b_num);
        map.put("m_id", m_id);

        logger.info(" DAO : board likeDelete 시작");

        sqlSession.delete(namespace + ".R_Board_likeDelete", map);
    }

    // 게시물 좋아요 수치 감소
    public void r_Board_likeDiscount(int rcp_b_num) throws Exception {
        logger.info(" DAO : board likeDiscount 시작");

        sqlSession.update(namespace + ".R_Board_likeDiscount", rcp_b_num);
    }

    // 게시물 댓글들 불러오기
    public List<replyVO> r_Board_listReply(String reply_b_type, int reply_b_main_num) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("reply_b_type", reply_b_type);
        map.put("reply_b_main_num", reply_b_main_num);

        logger.info(" DAO : board listReply 시작");

        List<replyVO> vo = sqlSession.selectList(namespace + ".R_Board_listReply", map);

        return vo;
    }

    // 댓글 불러오기
    public replyVO r_Board_reply(int rcp_b_num) throws Exception {
        logger.info(" DAO : board Reply 시작");

        replyVO vo = sqlSession.selectOne(namespace + ".R_Board_reply", rcp_b_num);

        return vo;
    }

    // 댓글 등록하기
    public void r_Board_addReply(replyVO reply) throws Exception {
        logger.info(" DAO : board addReply 시작");

        sqlSession.insert(namespace + ".R_Board_addReply", reply);
    }

    // 댓글 삭제하기
    public void r_Board_deleteReply(int reply_b_num) throws Exception {
        logger.info(" DAO : board deleteReply 시작");

        sqlSession.delete(namespace + ".R_Board_deleteReply", reply_b_num);
    }

    // 댓글 수정하기
    public void r_Board_modifyReply(String reply_b_content, int reply_b_num) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("reply_b_content", reply_b_content);
        map.put("reply_b_num", reply_b_num);

        logger.info(" DAO : board modifyReply 시작");

        sqlSession.delete(namespace + ".R_Board_modifyReply", reply_b_num);
    }

    // recipe_board 컬럼 이름 가져오기
    public List<String> r_Board_getColumn() throws Exception {
        List<String> vo = sqlSession.selectList(namespace + ".R_Board_getDBColumn");

        logger.info(" DAO : board columns " + vo);

        return vo;
    }

    // 가져온 컬럼 데이터로 데이터 검색하기
    @Override
    public List<Integer> r_Board_searchData(String column, String data) throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        map.put("column", column);
        map.put("data", ("%" + data + "%"));

        List<Integer> vo = sqlSession.selectList(namespace + ".R_Board_searchData", map);

        logger.info(" DAO : board columns " + vo);

        return vo;
    }

    // 멤버 리스트 페이징
    @Override
    public List<BoardMemberVO> bListCri(Criteria cri) throws Exception {
        logger.info("bListCri(Criteria cri) 호출 !");

        return sqlSession.selectList(namespace + ".bListCri", cri);
    }

    // 갯수 세기
    @Override
    public int countBoards(Criteria cri) throws Exception {
        return sqlSession.selectOne(namespace + ".countBoards", cri);
    }

    // 검색리스트 가져오기
    @Override
    public List<recipeBoardVO> r_Board_searchNum(List<Integer> rcp_b_nums) throws Exception {
        Map<String, List<Integer>> map = new HashMap<String, List<Integer>>();
        map.put("rcp_b_nums", rcp_b_nums);

        List<recipeBoardVO> vo = sqlSession.selectList(namespace + ".R_Board_searchNum", map);

        logger.info(" DAO : 검색 결과 제목 -> " + vo.size());

        return vo;
    }

    // 선택 테이블의 기본 키(PK) 불러오기
    public String total_getPrimaryKeyName(String table_name) throws Exception {
        String primaryKeyName = sqlSession.selectOne(namespace + ".Total_getPrimaryKeyName", table_name);
        return primaryKeyName;
    }

    public List<String> total_getDBColumn(String table_name) throws Exception {
        List<String> columns = sqlSession.selectList(namespace + ".Total_getDBColumn", table_name);

        // 검색결과에서 제외할 컬럼 설정
        if (table_name.equals("tbl_member")) {
            columns.remove(columns.indexOf("m_pw"));
        } else if (table_name.equals("recipe_board")) {
            columns.remove(columns.indexOf("rcp_b_img1"));
            columns.remove(columns.indexOf("rcp_b_img2"));
            columns.remove(columns.indexOf("rcp_b_img3"));
            columns.remove(columns.indexOf("rcp_b_thumbnail"));
        } else if (table_name.equals("salad_recipe")) {
            columns.remove(columns.indexOf("rcp_num"));
            columns.remove(columns.indexOf("rcp_img"));
            columns.remove(columns.indexOf("rcp_date"));
            columns.remove(columns.indexOf("rcp_like"));
            columns.remove(columns.indexOf("rcp_week_count"));
            columns.remove(columns.indexOf("rcp_total_count"));
        } else if (table_name.equals("")) {
            columns.remove(columns.indexOf(""));
        }

        return columns;
    }

    // 선택 테이블의 해당 컬럼을 검색하여 기본 키값 가져오기
    public List<Integer> total_searchPrimaryKey(String table_name, String primary_key, String column, String data) throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        map.put("table_name", table_name);
        map.put("primary_key", primary_key);
        map.put("column", column);
        map.put("data", ("%" + data + "%"));

        List<Integer> primaryKeys = sqlSession.selectList(namespace + ".Total_searchPrimaryKey", map);

        logger.info(" DAO : searchPrimaryKey 검색된 갯수(중복 포함) : " + primaryKeys.size());

        return primaryKeys;
    }

    // 검색한 기본키로 해당 테이블의 모든 정보 가져오기
    public Object total_searchTotal(String table_name, String primary_key, List<Integer> search_num) throws Exception {
        logger.info(" DAO : total_searchTotal 시작");

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("table_name", table_name);
        map.put("primary_key", primary_key);
        map.put("search_num", search_num);

        Object searchTotal = sqlSession.selectList(namespace + ".Total_search" + table_name, map);

        return searchTotal;
    }
}
