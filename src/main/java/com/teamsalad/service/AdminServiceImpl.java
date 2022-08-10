package com.teamsalad.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.couponVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.domain.recipeBoardVO;
import com.teamsalad.domain.recipeVO;
import com.teamsalad.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO adao;
	
	///////////////////////////////////// 관리자 메인 화면 ///////////////////////////////////////////////////////////////
	
	// 최근 주목 목록 7개 조회
	@Override
	public List<orderVO> getRecentOrder() throws Exception {
		
		System.out.println(" S : getRecentOrder() 호출");
		
		List<orderVO> recentOList = adao.getRecentOrder();
		
		return recentOList;
	}
	
	// 레시피 게시판 인기 레시피 7개 조회
	@Override
	public List<recipeBoardVO> getPopularRecipe() throws Exception {
		
		System.out.println(" S : getPopularRecipe() 호출");
		
		List<recipeBoardVO> popularRList = adao.getPopularRecipe();
		
		return popularRList;
	}
	
	///////////////////////////////////// 회원 관리 ///////////////////////////////////////////////////////////////
	
	// 전체 회원 목록 조회
	@Override
	public List<memberVO> getMListAll(String m_id) throws Exception {

		System.out.println(" S : getMListAll(String m_id) 호출");

		List<memberVO> mListAll = adao.getMListAll(m_id);

		return mListAll;
	}
	
	// 전체 회원 목록 페이징 조회
	@Override
	public List<memberVO> mListCri(Criteria cri) throws Exception {

		System.out.println("mListCri(Criteria cri) 호출! ");
			
		return adao.mListCri(cri);
		
	}
	
	// 멤버 전체 갯수 조회
	@Override
	public int countMembers(Criteria cri) throws Exception {
		
		return adao.countMembers(cri);
	}
	
	 
    // 개별 회원 정보 조회
	@Override
	public memberVO getMInfo(String m_id) throws Exception {
		
		System.out.println(" S : getMInfo(String id) 호출");
		
		memberVO mvo = adao.getMInfo(m_id);
		
		return mvo;
	}
	
	// 검색용 회원 정보 조회
	@Override
	public memberVO getMInfoSeq(Integer m_seq) throws Exception {
		
		System.out.println(" S : getMInfoSeq(Integer m_seq) 호출");
		
		memberVO mvo = adao.getMInfoSeq(m_seq);
		
		return mvo;
	}

	// 개별 회원 정보 수정
	@Override
	public void updateMember(memberVO uvo) throws Exception {
		
		System.out.println(" S : updateMember(memberVO uvo) 호출");
		System.out.println("서비스" + uvo);
		
		adao.updateMember(uvo);
	}
	
	// 개별 회원 정보 삭제
	@Override
	public void deleteMember(String m_id) throws Exception {
		
		System.out.println(" S : deleteMember(m_id) 호출");
		
		adao.deleteMember(m_id);
	}
	
	///////////////////////////////////// 주문 관리 ///////////////////////////////////////////////////////////////
	
	// 전체 주문 정보 조회
	@Override
	public List<orderVO> getOListAll() throws Exception {
		
		System.out.println(" S : getOListAll() 호출");
		
		List<orderVO> oListAll = adao.getOListAll();
		
		return oListAll;
	}
	
	// 전체 주문 목록 페이징 조회
	@Override
	public List<orderVO> oListCri(Criteria cri) throws Exception {

		System.out.println("oListCri(Criteria cri) 호출! ");
			
		return adao.oListCri(cri);
		
	}
	
	// 주문 전체 갯수 조회
	@Override
	public int countOrders(Criteria cri) throws Exception {
		
		return adao.countOrders(cri);
	}

	// 개별 주문 정보 조회
	@Override
	public orderVO getOInfo(Integer order_num) throws Exception {
		
		System.out.println(" S : getOInfo(order_num) 호출");
		
		orderVO ovo = adao.getOInfo(order_num);
		
		return ovo;
	}

	// 개별 주문 정보 수정
	@Override
	public void updateOrder(orderVO ovo) throws Exception {
		
		System.out.println(" S : updateOrder(orderVO ovo) 호출");
		
		adao.updateOrder(ovo);
		
	}

	// 개별 주문 정보 삭제
	@Override
	public void deleteOrder(Integer order_num) throws Exception {

		System.out.println(" S : deleteOrder(Integer order_num) 호출");

		adao.deleteOrder(order_num);

	}
	
	///////////////////////////////////// 재료 관리 ///////////////////////////////////////////////////////////////
	
	// 재료 목록 페이징 조회
	@Override
	public List<ingredientVO> igdtListCri(Criteria cri) throws Exception {
		
		System.out.println("igdtListCri(Criteria cri) 호출! ");
		
		return adao.igdtListCri(cri);
	}
	
	// 재료 갯수 조회
	@Override
	public int countIngredients(Criteria cri) throws Exception {
		
		return adao.countIngredients(cri);
	}

	// 재료 등록
	@Override
	public void igdtRegister(ingredientVO ivo) throws Exception {
		
		System.out.println("S : igdtRegister(ingredientVO ivo) 호출! ");
		
		adao.igdtRegister(ivo);
		
		System.out.println("S : igdtRegister(ingredientVO ivo) 등록완료 ");
		
	}
	
	// 재료 개별 조회
	@Override
	public ingredientVO getIgdtInfo(Integer igdt_num) throws Exception {
		
		System.out.println(" S : getIgdtInfo(String igdt_num) 호출");
		
		ingredientVO ivo = adao.getIgdtInfo(igdt_num);
		
		return ivo;
	}
	
	// 재료 개별 정보 수정
	@Override
	public void updateIngredient(ingredientVO ivo) throws Exception {
		
		System.out.println("S : updateIngredient(ingredientVO ivo) 호출! ");
		
		adao.updateIngredient(ivo);
		
	}
	
	// 재료 개별 정보 삭제
	@Override
	public void deleteIngredient(Integer igdt_num) throws Exception {
		
		System.out.println("S : deleteIngredient(Integer igdt_num) 호출! ");
		
		adao.deleteIngredient(igdt_num);
		
		
 	}
	
	
	///////////////////////////////////// 쿠폰 관리 ///////////////////////////////////////////////////////////////
	
	
	// 쿠폰 목록 페이징 조회
	@Override
	public List<couponVO> couponListCri(Criteria cri) throws Exception {
		
		System.out.println("couponListCri(Criteria cri) 호출! ");
		
		return adao.couponListCri(cri);
	}
	
	// 쿠폰 전체 갯수 조회
	@Override
	public int countCoupons(Criteria cri) throws Exception {
		
		System.out.println("countCoupons(Criteria cri) 호출! ");
		
		return adao.countCoupons(cri);
	}
	
	// 쿠폰 발급 회원 목록 조회
	@Override
	public List<memberVO> getCouponMList(Integer coupon_id) throws Exception {
		
		System.out.println("getCouponMList(Integer coupon_id) 호출! ");
		
		return adao.getCouponMList(coupon_id);
	}

	// 쿠폰 등록
	@Override
	public void couponRegister(couponVO cvo) throws Exception {
		
		System.out.println("S : couponRegister(couponVO cvo) 호출! ");
		
		adao.couponRegister(cvo);
		
	}
	
	// 쿠폰 개별 정보 조회
	@Override
	public couponVO getCouponInfo(Integer coupon_id) throws Exception {
		
		System.out.println(" S : getCouponInfo(Integer coupon_id) 호출");
		
		couponVO cvo = adao.getCouponInfo(coupon_id);
		
		return cvo;
	}
	
	// 쿠폰 개별 정보 수정
	@Override
	public void updateCoupon(couponVO cvo) throws Exception {
		
		System.out.println("S : updateCoupon(couponVO cvo) 호출! ");
		
		adao.updateCoupon(cvo);
		
	}
	
	// 쿠폰 개별 정보 삭제
	@Override
	public void deleteCoupon(Integer coupon_id) throws Exception {
		
		System.out.println("S : deleteCoupon(Integer coupon_id) 호출! ");
		
		adao.deleteCoupon(coupon_id);
		
 	}

	// 쿠폰 개별 회원 발급
	@Override
	public void memberInsertCoupon(memberVO mvo) throws Exception {
		
		System.out.println("S : memberInsertCoupon(memberVO mvo) 호출! ");
		
		adao.memberInsertCoupon(mvo);
		
	}
	
////////////////////////////////////////////////////////////판매 성향 정보 관련////////////////////////////////////////////////////////////////////

	// 인기 레시피 게시판 탑텐 조회
	@Override
	public List<recipeBoardVO> getR_Board_TopList() throws Exception {
		
		System.out.println("S : getR_Board_TopList() 호출! ");
		
		return adao.getR_Board_TopList();
		
	}
	
	// 샐러드 주간 판매량 탑텐 조회
	@Override
	public List<recipeVO> getSalad_TopList() throws Exception {
		
		System.out.println("S : getSalad_TopList() 호출! ");
		
		return adao.getSalad_TopList();

	}

	

}
