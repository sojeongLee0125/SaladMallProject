package com.teamsalad.service;

import com.teamsalad.domain.cartVO;
import com.teamsalad.persistence.BasketDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class BasketServiceImpl implements BasketService {

    private static final Logger logger = LoggerFactory.getLogger(BasketService.class);

    @Inject
    private BasketDAO bdao;

    // 장바구니 목록
    @Override
    public List<cartVO> Basket(String m_id) throws Exception {
        logger.info("  S : basket 호출 ");
        return bdao.Basket(m_id);
    }

    // 장바구니 삭제
    @Override
    public void deleteCart(int cart_num) throws Exception {
        logger.info("  S : deleteCart(int cart_num) 호출 ");
        bdao.deleteCart(cart_num);
    }
}
