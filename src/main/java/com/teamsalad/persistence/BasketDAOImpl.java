package com.teamsalad.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.cartVO;

@Repository
public class BasketDAOImpl implements BasketDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(BasketDAOImpl.class);
	
	// BasketMapper.xml 파일에 접근가능한 이름(주소)
	private static final String namespace = "com.teamsalad.mapper.BasketMapper";
	
	///////////////////////////////////// 장바구니 화면 ///////////////////////////////////////////////////////////////
	// 장바구니 정보
	@Override
	public List<cartVO> Basket(String m_id) throws Exception {
		
		logger.info("  S : basket 호출 ");
		
		return sqlSession.selectList(namespace + ".basket", m_id);
	}
	
	// 장바구니 삭제
	@Override
	public void deleteCart(int cart_num) throws Exception{
		
		logger.info(" DAO : deleteCart(cart_num) 호출");
		
		sqlSession.delete(namespace + ".basket_delete", cart_num);
	}




}
