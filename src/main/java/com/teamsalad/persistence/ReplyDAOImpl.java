package com.teamsalad.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.replyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);
	
	private static final String namespace = "com.teamsalad.mapper.ReplyMapper";
	
	
	// 댓글 목록
	@Override
	public List<replyVO> list(Integer reply_b_main_num) throws Exception {
		
		logger.info(" DAO : replyList(Integer reply_b_main_num) 호출 " );
		
		return sqlSession.selectList(namespace + ".list", reply_b_main_num) ;
	}
	
	// 댓글 등록
	@Override
	public void create(replyVO rvo) throws Exception {
		
		logger.info(" DAO : create(replyVO rvo) 호출 " );
		
		sqlSession.insert(namespace + ".create", rvo) ;
		
	}
	
	// 댓글 수정
	@Override
	public void update(replyVO rvo) throws Exception {
		
		logger.info(" DAO : update(replyVO rvo) 호출 " );
		
		sqlSession.insert(namespace + ".update", rvo) ;
		
	}
	
	// 관리자 댓글 시 정보 업데이트
	@Override
	public void adminUpdate(replyVO rvo) throws Exception {
		
		logger.info(" DAO : adminUpdate(replyVO rvo) 호출 " );
		
		sqlSession.update(namespace + ".adminupdate", rvo) ;
		
		
	}

	
	// 댓글 삭제
	@Override
	public void delete(Integer reply_b_num) throws Exception {
		
		logger.info(" DAO : delete(Integer reply_b_num) 호출 " );
		
		sqlSession.delete(namespace + ".delete", reply_b_num) ;
		
	}
	
	
	// 댓글 페이징 처리
	@Override
	public List<replyVO> listPaging(Integer reply_b_main_num, Criteria criteria) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>(); 
		paramMap.put("reply_b_main_num", reply_b_main_num); 
		paramMap.put("criteria", criteria);
		
		return sqlSession.selectList(namespace +  ".listPaging", paramMap);
	}
	
	
	// 댓글 총 갯수 계산
	@Override
	public int countReplies(Integer reply_b_main_num) throws Exception {
		return sqlSession.selectOne(namespace + ".countReplies", reply_b_main_num);
	}
	

}