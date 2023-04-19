package com.teamsalad.service;

import com.teamsalad.domain.cartVO;

import java.util.List;

public interface BasketService {

    // 장바구니 목록
    public List<cartVO> Basket(String m_id) throws Exception;

    // 장바구니 삭제
    public void deleteCart(int cart_num) throws Exception;
}