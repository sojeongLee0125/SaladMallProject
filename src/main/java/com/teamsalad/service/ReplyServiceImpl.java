package com.teamsalad.service;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.replyVO;
import com.teamsalad.persistence.ReplyDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Inject
    private ReplyDAO rdao;

    // 댓글 리스트
    @Override
    public List<replyVO> list(Integer reply_b_main_num) throws Exception {
        return rdao.list(reply_b_main_num);
    }

    // 댓글 쓰기
    @Override
    public void create(replyVO rvo) throws Exception {
        rdao.create(rvo);
    }

    // 댓글 수정
    @Override
    public void update(replyVO rvo) throws Exception {
        rdao.update(rvo);
    }

    // 관리자 댓글시 상태 업데이트
    @Override
    public void adminUpdate(replyVO rvo) throws Exception {
        rdao.adminUpdate(rvo);
    }

    // 댓글 삭제
    @Override
    public void delete(Integer reply_b_num) throws Exception {
        rdao.delete(reply_b_num);
    }

    // 댓글 페이징 처리
    @Override
    public List<replyVO> listPaging(Integer reply_b_main_num, Criteria criteria) throws Exception {
        return rdao.listPaging(reply_b_main_num, criteria);
    }

    // 댓글 갯수
    @Override
    public int countReplies(Integer reply_b_main_num) throws Exception {
        return rdao.countReplies(reply_b_main_num);
    }


}
