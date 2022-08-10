package com.teamsalad.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.customerBoardVO;
import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.domain.replyVO;

@Repository
public class CSDAOImpl implements CSDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger
		= LoggerFactory.getLogger(CSDAOImpl.class);
	
	// Mapper 파일을 구분하기 위한 사용자 지정 고유값
	private static final String namespace = "com.teamsalad.mapper.CSMapper";
	
	// 게시판 전체 글 불러오기
	@Override
	public List<customerBoardVO> listALL() throws Exception {

		System.out.println(" DAO : listALL() -> mapper 호출");	
		
		return sqlSession.selectList(namespace+".listALL");
	}
	
	// 게시판 리스트 페이징
	@Override
	public List<customerBoardVO> listCri(Criteria cri) throws Exception {
		
		logger.info("mListCri(Criteria cri) 호출 !");

		return sqlSession.selectList(namespace + ".listCri", cri);
	}
	
	// 게시판 글 총 갯수 불러오기
	@Override
	public int countCSBoard(Criteria cri) throws Exception {
		
		logger.info("countCSBoard(Criteria cri) 호출 !");
		
		return sqlSession.selectOne(namespace+".countCSBoard", cri);
	}
	
	// 게시판 글쓰기
	@Override
	public void create(customerBoardVO CS_vo) throws Exception {

		logger.info(" DAO : create(customerBoardVO CS_vo) 호출 ");
		
		sqlSession.insert(namespace+".create", CS_vo);
		
	}
	
	// 게시판 특정 글 읽기
	@Override
	public customerBoardVO read(Integer customer_b_num) throws Exception {
		
		logger.info(" DAO : read(customer_b_num) 호출");
		
		customerBoardVO CS_vo = sqlSession.selectOne(namespace+".read", customer_b_num);
		
		return CS_vo;
	}
	
	// 게시판 특정 글 수정
	@Override
	public void modify(customerBoardVO CS_vo) throws Exception {
		
		logger.info(" DAO : modify(CS_vo) 호출 ");
		
	    	sqlSession.update(namespace+".modify", CS_vo);
	    		
	}

	// 게시판 특정 글 삭제
	@Override
	public void delete(Integer customer_b_num) throws Exception {
		
		logger.info(" DAO : delete(customer_b_num) 호출");
		
		sqlSession.delete(namespace+".delete", customer_b_num);		
		
	}
	
	// 회원 주문정보 불러오기
	@Override
	public List<orderVO> memberOrderInfo(String m_id) throws Exception {
		
		logger.info(" DAO : memberOrderInfo(m_id) 호출");
		
		List<orderVO> m_orderList = sqlSession.selectList(namespace+".selectOrder", m_id);	
		
		return m_orderList;
	}
	
	// 댓글 정보 가져오기
	@Override
	public List<replyVO> replyInfo(String reply_m_id, Integer reply_b_main_num) throws Exception {
		
		logger.info(" DAO : replyInfo(m_id,reply_b_main_num) 호출");		

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reply_m_id", reply_m_id);
		map.put("reply_b_main_num", reply_b_main_num);
		
		List<replyVO> replyList = sqlSession.selectList(namespace+".selectOrder", map);	
		
		return replyList;
	}

	
	
	
	
}
