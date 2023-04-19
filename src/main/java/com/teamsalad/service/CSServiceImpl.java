package com.teamsalad.service;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.customerBoardVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.domain.replyVO;
import com.teamsalad.persistence.CSDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CSServiceImpl implements CSService {

    private static final Logger logger = LoggerFactory.getLogger(CSService.class);

    @Inject
    private CSDAO csdao;

    // 게시판 전체 글 불러오기
    @Override
    public List<customerBoardVO> listALL() throws Exception {
        logger.info(" S : listALL() 호출 -> DAO-");
        return csdao.listALL();
    }

    // 게시판 페이징 리스트
    @Override
    public List<customerBoardVO> listCri(Criteria cri) throws Exception {
        logger.info(" S : listCri() 호출 -> DAO-");
        List<customerBoardVO> listCri = csdao.listCri(cri);
        return listCri;
    }

    // 게시판 총 글 수 계산
    @Override
    public int countCSBoard(Criteria cri) throws Exception {
        logger.info(" S : countCSBoard() 호출 -> DAO-");
        int countCSBoard = csdao.countCSBoard(cri);
        return countCSBoard;
    }

    // 게시판 글쓰기
    @Override
    public void create(customerBoardVO CS_vo) throws Exception {
        logger.info(" S : regist(customerBoardVO CS_vo) 호출 ");
        csdao.create(CS_vo);
        logger.info(" 글쓰기 완료 -> 컨트롤러 페이지로 이동");
    }

    // 게시판 특정 글 읽기
    @Override
    public customerBoardVO read(Integer customer_b_num) throws Exception {
        logger.info(" S : read(Integer customer_b_num) 호출 ");
        customerBoardVO CS_vo = csdao.read(customer_b_num);
        return CS_vo;
    }

    // 게시판 특정 글 수정
    @Override
    public void modify(customerBoardVO CS_vo) throws Exception {
        logger.info(" S : modify(customerBoardVO CS_vo) 호출 ");
        csdao.modify(CS_vo);
    }

    // 게시판 특정 글 삭제
    @Override
    public void delete(Integer customer_b_num) throws Exception {
        logger.info("  S : delete (Integer customer_b_num) 호출 ");
        csdao.delete(customer_b_num);
    }

    // 특정 회원 주문정보 불러오기
    @Override
    public List<orderVO> memberOrderInfo(String m_id) throws Exception {
        logger.info("  S : memberOrderInfo (m_id) 호출 ");
        List<orderVO> m_orderList = csdao.memberOrderInfo(m_id);
        return m_orderList;
    }

    // 댓글 정보 불러오기
    @Override
    public List<replyVO> replyInfo(String reply_m_id, Integer reply_b_main_num) throws Exception {
        logger.info(" S : replyInfo (m_id,reply_b_main_num) 호출 ");
        List<replyVO> replyList = csdao.replyInfo(reply_m_id, reply_b_main_num);
        return replyList;
    }


}
