package com.teamsalad.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.couponVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.domain.recipeBoardVO;
import com.teamsalad.domain.recipeVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	// AdminMapper.xml 파일에 접근가능한 이름(주소)
	private static final String namespace = "com.teamsalad.mapper.AdminMapper";
	
	///////////////////////////////////// 관리자 메인 화면 ///////////////////////////////////////////////////////////////
	

	// 최근 주문 목록 7개 조회
	@Override
	public List<orderVO> getRecentOrder() {
		
		logger.info(" DAO : getRecentOrder() 호출 " );
		
		List<orderVO> recentOList = sqlSession.selectList(namespace+".recentOList");
				
		return recentOList;
	
	}
	
	// 레시피 게시판 인기 레시피 7개 조회
	@Override
	public List<recipeBoardVO> getPopularRecipe() throws Exception {
		
		logger.info(" DAO : getPopularRecipe() 호출 " );
		
		List<recipeBoardVO> popularRList = sqlSession.selectList(namespace+".popularRList");
				
		return popularRList;
	}
	
	
	///////////////////////////////////// 회원 관리 ///////////////////////////////////////////////////////////////
	
	// 멤버 더미 데이터 삽입
	@Override
	public void insertMember(memberVO mvo) {
		
		logger.info(" DAO : insertMember(mvo) 호출 ");

		sqlSession.insert(namespace + ".insertMember", mvo);

		logger.info(" DAO : 멤버 더미데이터 입력완료");
		
	}

	// 멤버 리스트 페이징
	@Override
	public List<memberVO> mListCri(Criteria cri) throws Exception {

		logger.info("mListCri(Criteria cri) 호출 !");

		return sqlSession.selectList(namespace + ".mListCri", cri);
	}
	
	// 전체 회원 목록 갯수 조회
	@Override
	public int countMembers(Criteria cri) throws Exception {
		
		return sqlSession.selectOne(namespace+".countMembers", cri);
	}
	
	
	// 전체 회원 목록 조회
	@Override
	public List<memberVO> getMListAll(String m_id) {
		
		logger.info(" DAO : getMListAll(m_id) 호출 " );
		
		List<memberVO> mListAll = sqlSession.selectList(namespace+".mListAll", m_id);
				
		return mListAll;
	}
	
	// 개별 회원 정보 조회
	@Override
	public memberVO getMInfo(String m_id) {
		
		logger.info(" DAO : getMInfo(m_id) 호출 ");
		
		memberVO mvo = sqlSession.selectOne(namespace+".mInfo", m_id);
		
		return mvo;
	}
	
	// 검색용 회원 정보 조회
	@Override
	public memberVO getMInfoSeq(Integer m_seq) throws Exception {
		
		logger.info(" getMInfoSeq(Integer m_seq) 호출 ");
		
		memberVO mvo = sqlSession.selectOne(namespace+".mInfoSeq", m_seq);
		
		return mvo;
	}
	
	// 개별 회원 정보 수정
	@Override
	public void updateMember(memberVO uvo) {
		
		logger.info(" DAO : updateMember(uvo) 호출 ");
		
		sqlSession.update(namespace+".mUpdate", uvo);
		
		logger.info(" DAO : 회원정보 수정 완료 ");
		
	}
	
	// 개별 회원 정보 삭제
	@Override
	public void deleteMember(String m_id) {
		
		logger.info(" DAO : deleteMember(m_id) 호출 ");
		
		sqlSession.delete(namespace+".mDelete", m_id);
		
		logger.info(" DAO : 회원정보 삭제 완료 ");
	}
	
	///////////////////////////////////// 주문 관리 ///////////////////////////////////////////////////////////////
	
	//주문 더미 데이터 삽입
	@Override
	public void insertOrder(orderVO ovo) throws Exception {
		
		logger.info(" DAO : insertOrder(ovo) 호출 ");

		sqlSession.insert(namespace + ".insertOrder", ovo);

		logger.info(" DAO : 주문 더미데이터 입력완료");
		
	}
	
	// 주문 리스트 페이징
	@Override
	public List<orderVO> oListCri(Criteria cri) throws Exception {
		
		logger.info("oListCri(Criteria cri) 호출 !");

		return sqlSession.selectList(namespace + ".oListCri", cri);
		
	}
		
	// 전체 주문 목록 갯수 조회
	@Override
	public int countOrders(Criteria cri) throws Exception {
			
		return sqlSession.selectOne(namespace+".countOrders", cri);
	}
	
	// 전체 주문 목록 조회
	@Override
	public List<orderVO> getOListAll() {
		
		logger.info(" DAO : getOListAll() 호출 " );
		
		List<orderVO> oListAll = sqlSession.selectList(namespace+".oListAll");
				
		return oListAll;
	}

	// 개별 주문 정보 조회
	@Override
	public orderVO getOInfo(Integer order_num) {
		
		logger.info(" DAO : getOInfo() 호출 " );
		
		orderVO ovo = sqlSession.selectOne(namespace+".oInfo", order_num);
						
		return ovo;
	}

	// 개별 주문 정보 수정
	@Override
	public void updateOrder(orderVO ovo) {

		logger.info(" DAO : updateOrder(orderVO ovo) 호출 ");

		sqlSession.update(namespace+".oUpdate", ovo);
		
	}

	// 개별 주문 정보 삭제
	@Override
	public void deleteOrder(Integer order_num) {
		
		logger.info(" DAO : deleteOrder(order_num) 호출 ");

		sqlSession.delete(namespace + ".oDelete", order_num);

		logger.info(" DAO : 주문정보 삭제 완료 ");

	}
	
	///////////////////////////////////// 재료 관리 ///////////////////////////////////////////////////////////////
	
	// 레시피 더미 데이터 삽입
	@Override
	public void insertIngredient(ingredientVO ivo) throws Exception {
		
		logger.info(" DAO : insertIngredient(ingredientVO ivo) 호출 ");

		sqlSession.insert(namespace + ".insertIngredient", ivo);

		logger.info(" DAO : 재료 더미데이터 입력완료");
		
	}
	
	// 재료 리스트 페이징
	@Override
	public List<ingredientVO> igdtListCri(Criteria cri) throws Exception {
		
		logger.info("igdtListCri(Criteria cri) 호출 ");

		return sqlSession.selectList(namespace + ".igdtListCri", cri);
	}
	
	// 재료 전체 갯수 계산
	@Override
	public int countIngredients(Criteria cri) throws Exception {
		
		return sqlSession.selectOne(namespace+".countIngredients", cri);
	}
	
	// 레시피 재료 등록
	@Override
	public void igdtRegister(ingredientVO ivo) throws Exception {
		
		logger.info("igdtRegister(ingredientVO ivo) 호출 ");

		sqlSession.insert(namespace + ".igdtRegister", ivo);
		
		logger.info("igdtRegister(ingredientVO ivo) 등록 완료 ");
	}
	
	// 레시피 개별 정보 조회
	@Override
	public ingredientVO getIgdtInfo(Integer igdt_num) throws Exception {
		
		logger.info(" DAO : getIgdtInfo() 호출 " );
		
		ingredientVO ivo = sqlSession.selectOne(namespace+".igdtInfo", igdt_num);
						
		return ivo;
	}
	
	// 재료 개별 정보 수정
	@Override
	public void updateIngredient(ingredientVO ivo) throws Exception {
		
		logger.info(" DAO : updateIngredient(ingredientVO ivo) 호출 " );
		
		sqlSession.update(namespace+".igdtUpdate", ivo);
		
	}
	
	// 재료 개별 정보 삭제
	@Override
	public void deleteIngredient(Integer igdt_num) throws Exception {
		
		logger.info(" DAO : deleteIngredient(Integer igdt_num) 호출 " );
		
		sqlSession.delete(namespace+".igdtDelete",igdt_num);
		
	}
	///////////////////////////////////// 쿠폰 관리 ///////////////////////////////////////////////////////////////
	
	// 쿠폰 리스트 페이징
	@Override
	public List<couponVO> couponListCri(Criteria cri) throws Exception {
		
		logger.info("couponListCri(Criteria cri) 호출 ");

		return sqlSession.selectList(namespace + ".cListCri", cri);
	}
	
	// 쿠폰 전체 갯수 계산
	@Override
	public int countCoupons(Criteria cri) throws Exception {
		
		return sqlSession.selectOne(namespace+".countCoupons", cri);
	}
	
	// 쿠폰 발급 회원 조회
	@Override
	public List<memberVO> getCouponMList(Integer coupon_id) throws Exception {
		
		return sqlSession.selectList(namespace+".couponMList", coupon_id);
	}
	
	// 쿠폰 등록
	@Override
	public void couponRegister(couponVO cvo) throws Exception {
		
		logger.info("couponRegister(couponVO cvo) 호출 ");

		sqlSession.insert(namespace + ".couponRegister", cvo);
		
		logger.info("igdtRegister(ingredientVO ivo) 등록 완료 ");
	}
	
	// 쿠폰 개별 정보 조회
	@Override
	public couponVO getCouponInfo(Integer coupon_id) throws Exception {
		
		logger.info(" DAO : getIgdtInfo() 호출 " );
		
		couponVO cvo = sqlSession.selectOne(namespace+".couponInfo", coupon_id);
						
		return cvo;
	}
	
	// 쿠폰 개별 정보 수정
	@Override
	public void updateCoupon(couponVO cvo) throws Exception {
		
		logger.info(" DAO : updateCoupon(couponVO cvo) 호출 " );
		
		sqlSession.update(namespace+".couponUpdate", cvo);
		
	}
	
	// 쿠폰 개별 정보 삭제
	@Override
	public void deleteCoupon(Integer coupon_id) throws Exception {
		
		logger.info(" DAO : deleteCoupon(Integer coupon_id) 호출 " );
		
		sqlSession.delete(namespace+".couponDelete", coupon_id);
		
	}
	
	// 개별 회원 쿠폰 발급
	@Override
	public void memberInsertCoupon(memberVO mvo) throws Exception {
		
		logger.info(" DAO : memberInsertCoupon(memberVO mvo) 호출 " );
		
		sqlSession.update(namespace+".memberInsertCoupon", mvo);
		
	}

////////////////////////////////////////////////////////////판매 성향 정보 관련////////////////////////////////////////////////////////////////////

	// 인기 레시피 게시판 탑텐 조회
	@Override
	public List<recipeBoardVO> getR_Board_TopList() throws Exception {
		
		logger.info("getR_Board_TopList() 호출 ");

		return sqlSession.selectList(namespace + ".rBoardTopList");
			
	}
	
	// 인기 샐러드 순위
	@Override
	public List<recipeVO> getSalad_TopList() throws Exception {
		
		logger.info("getSalad_TopList() 호출 ");

		return sqlSession.selectList(namespace + ".saladTopList");				
	}
	




	




}
