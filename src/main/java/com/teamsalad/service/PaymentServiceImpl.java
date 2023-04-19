package com.teamsalad.service;

import com.teamsalad.domain.SaladCartVO;
import com.teamsalad.domain.cartVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.persistence.PaymentDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(PaymentService.class);

    @Inject
    private PaymentDAO pdao;

    // 주문정보
    @Override
    public void orderInfo(orderVO order) throws Exception {
        pdao.orderInfo(order);
    }

    // 장바구니정보
    @Override
    public cartVO cartInfo(int cart_num) throws Exception {
        cartVO cartInfo = pdao.cartInfo(cart_num);
        return cartInfo;
    }

    // 아이디로 카트정보, 멤버 정보, 레시피 정보 가져오기
    @Override
    public List<SaladCartVO> getOrderInfo(String m_id) throws Exception {
        List<SaladCartVO> vo = pdao.getOrderInfo(m_id);
        return vo;
    }

    // 주문 번호 가져오기
    public int getOrderPayNum() throws Exception {
        return pdao.getOrderPayNum();
    }

    // 카트정보 삭제
    @Override
    public void deleteCart(int cart_num) throws Exception {
        pdao.deleteCart(cart_num);
    }


}