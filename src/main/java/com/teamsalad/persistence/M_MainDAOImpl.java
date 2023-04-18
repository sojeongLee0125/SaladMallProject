package com.teamsalad.persistence;

import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class M_MainDAOImpl implements M_MainDAO {

    @Inject
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(M_MainDAOImpl.class);

    private static final String namespace = "com.teamsalad.mapper.M_MainMapper";

    // 회원정보조회
    @Override
    public memberVO getMemberInfo(String m_id) throws Exception {
        memberVO mvo = sqlSession.selectOne(namespace + ".getMemberInfo", m_id);
        return mvo;
    }

    // 회원정보수정
    @Override
    public void updateMember(memberVO mvo) throws Exception {
        logger.info("DAO : updateMember 호출");
        sqlSession.update(namespace + ".updateMember", mvo);
    }

    // 회원정보삭제
    @Override
    public void deleteMember(memberVO mvo) throws Exception {
        logger.info("DAO : deleteMember(memberVO mvo) 호출");
        sqlSession.delete(namespace + ".deleteMember", mvo);
    }

    // 주문 목록 조회
    @Override
    public List<orderVO> orderList(String m_id) throws Exception {
        logger.info("DAO : orderList(String m_id) 호출");
        return sqlSession.selectList(namespace + ".orderList", m_id);
    }

    // 특정 주문 조회
    @Override
    public orderVO orderInfo(Integer order_num) throws Exception {
        logger.info("DAO : orderInfo(Integer order_num) 호출");
        orderVO ovo = sqlSession.selectOne(namespace + ".orderInfo", order_num);
        return ovo;
    }

    // 특정 주문 수정
    @Override
    public void orderUpdate(orderVO ovo) throws Exception {
        logger.info(" DAO : orderUpdate(orderVO ovo) 호출");
        sqlSession.update(namespace + ".orderUpdate", ovo);
    }

    // 특정 주문 삭제
    @Override
    public void orderDelete(Integer order_num) throws Exception {
        logger.info(" DAO : orderDelete(order_num) 호출");
        sqlSession.delete(namespace + ".orderDelete", order_num);
    }

}
