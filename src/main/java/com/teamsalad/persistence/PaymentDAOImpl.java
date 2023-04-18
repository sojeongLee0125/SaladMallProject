package com.teamsalad.persistence;

import com.teamsalad.domain.SaladCartVO;
import com.teamsalad.domain.cartVO;
import com.teamsalad.domain.orderVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

    @Inject
    //@Autowired
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(PaymentDAOImpl.class);

    // Mapper 파일을 구분하기위한 사용자 지정 고유값
    private static final String namespace = "com.teamsalad.mapper.PaymentMapper";

    // 주문 정보
    @Override
    public cartVO cartInfo(int cart_num) throws Exception {
        cartVO pdao = sqlSession.selectOne(namespace + ".orderInfo", cart_num);
        return pdao;
    }

    // 아이디로 카트정보, 멤버 정보, 레시피 정보 가져오기
    @Override
    public List<SaladCartVO> getOrderInfo(String m_id) throws Exception {
        List<SaladCartVO> vo = sqlSession.selectList(namespace + ".getOrderInfo", m_id);
        return vo;
    }

    // 주문 정보 저장하기
    public void orderInfo(orderVO vo) throws Exception {
        sqlSession.insert(namespace + ".orderInfo", vo);
    }

    // 주문 번호 가져오기
    public int getOrderPayNum() throws Exception {
        Integer i = sqlSession.selectOne(namespace + ".getOrderPayNum");

        if (i == null) i = 0;

        return i + 1;
    }

    // 주문정보 삭제하기
    @Override
    public void deleteCart(int cart_num) throws Exception {
        sqlSession.delete(namespace + ".cartDelete", cart_num);
    }


}
