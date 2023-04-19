package com.teamsalad.service;

import com.teamsalad.domain.*;
import com.teamsalad.persistence.AdminDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Inject
    private AdminDAO adao;

    ///////////////////////////////////// 관리자 메인 화면 ///////////////////////////////////////////////////////////////

    // 최근 주목 목록 7개 조회
    @Override
    public List<orderVO> getRecentOrder() throws Exception {
        List<orderVO> recentOList = adao.getRecentOrder();
        return recentOList;
    }

    // 레시피 게시판 인기 레시피 7개 조회
    @Override
    public List<recipeBoardVO> getPopularRecipe() throws Exception {
        List<recipeBoardVO> popularRList = adao.getPopularRecipe();
        return popularRList;
    }

    ///////////////////////////////////// 회원 관리 ///////////////////////////////////////////////////////////////

    // 전체 회원 목록 조회
    @Override
    public List<memberVO> getMListAll(String m_id) throws Exception {
        List<memberVO> mListAll = adao.getMListAll(m_id);
        return mListAll;
    }

    // 전체 회원 목록 페이징 조회
    @Override
    public List<memberVO> mListCri(Criteria cri) throws Exception {
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
        memberVO mvo = adao.getMInfo(m_id);
        return mvo;
    }

    // 검색용 회원 정보 조회
    @Override
    public memberVO getMInfoSeq(Integer m_seq) throws Exception {
        memberVO mvo = adao.getMInfoSeq(m_seq);
        return mvo;
    }

    // 개별 회원 정보 수정
    @Override
    public void updateMember(memberVO uvo) throws Exception {
        adao.updateMember(uvo);
    }

    // 개별 회원 정보 삭제
    @Override
    public void deleteMember(String m_id) throws Exception {
        adao.deleteMember(m_id);
    }

    ///////////////////////////////////// 주문 관리 ///////////////////////////////////////////////////////////////

    // 전체 주문 정보 조회
    @Override
    public List<orderVO> getOListAll() throws Exception {
        List<orderVO> oListAll = adao.getOListAll();
        return oListAll;
    }

    // 전체 주문 목록 페이징 조회
    @Override
    public List<orderVO> oListCri(Criteria cri) throws Exception {
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
        orderVO ovo = adao.getOInfo(order_num);
        return ovo;
    }

    // 개별 주문 정보 수정
    @Override
    public void updateOrder(orderVO ovo) throws Exception {
        adao.updateOrder(ovo);
    }

    // 개별 주문 정보 삭제
    @Override
    public void deleteOrder(Integer order_num) throws Exception {
        adao.deleteOrder(order_num);
    }

    ///////////////////////////////////// 재료 관리 ///////////////////////////////////////////////////////////////

    // 재료 목록 페이징 조회
    @Override
    public List<ingredientVO> igdtListCri(Criteria cri) throws Exception {
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
        adao.igdtRegister(ivo);
    }

    // 재료 개별 조회
    @Override
    public ingredientVO getIgdtInfo(Integer igdt_num) throws Exception {
        ingredientVO ivo = adao.getIgdtInfo(igdt_num);
        return ivo;
    }

    // 재료 개별 정보 수정
    @Override
    public void updateIngredient(ingredientVO ivo) throws Exception {
        adao.updateIngredient(ivo);
    }

    // 재료 개별 정보 삭제
    @Override
    public void deleteIngredient(Integer igdt_num) throws Exception {
        adao.deleteIngredient(igdt_num);
    }

    ///////////////////////////////////// 쿠폰 관리 ///////////////////////////////////////////////////////////////

    // 쿠폰 목록 페이징 조회
    @Override
    public List<couponVO> couponListCri(Criteria cri) throws Exception {
        return adao.couponListCri(cri);
    }

    // 쿠폰 전체 갯수 조회
    @Override
    public int countCoupons(Criteria cri) throws Exception {
        return adao.countCoupons(cri);
    }

    // 쿠폰 발급 회원 목록 조회
    @Override
    public List<memberVO> getCouponMList(Integer coupon_id) throws Exception {
        return adao.getCouponMList(coupon_id);
    }

    // 쿠폰 등록
    @Override
    public void couponRegister(couponVO cvo) throws Exception {
        adao.couponRegister(cvo);
    }

    // 쿠폰 개별 정보 조회
    @Override
    public couponVO getCouponInfo(Integer coupon_id) throws Exception {
        couponVO cvo = adao.getCouponInfo(coupon_id);
        return cvo;
    }

    // 쿠폰 개별 정보 수정
    @Override
    public void updateCoupon(couponVO cvo) throws Exception {
        adao.updateCoupon(cvo);
    }

    // 쿠폰 개별 정보 삭제
    @Override
    public void deleteCoupon(Integer coupon_id) throws Exception {
        adao.deleteCoupon(coupon_id);
    }

    // 쿠폰 개별 회원 발급
    @Override
    public void memberInsertCoupon(memberVO mvo) throws Exception {
        adao.memberInsertCoupon(mvo);
    }

////////////////////////////////////////////////////////////판매 성향 정보 관련////////////////////////////////////////////////////////////////////

    // 인기 레시피 게시판 탑텐 조회
    @Override
    public List<recipeBoardVO> getR_Board_TopList() throws Exception {
        return adao.getR_Board_TopList();
    }

    // 샐러드 주간 판매량 탑텐 조회
    @Override
    public List<recipeVO> getSalad_TopList() throws Exception {
        return adao.getSalad_TopList();
    }


}
