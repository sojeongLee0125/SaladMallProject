package com.teamsalad.persistence;

import com.teamsalad.domain.cartVO;

import java.util.List;

public interface BasketDAO {

    // 장바구니 정보
    public List<cartVO> Basket(String m_id) throws Exception;

    // 장바구니 삭제
    public void deleteCart(int cart_num) throws Exception;
}