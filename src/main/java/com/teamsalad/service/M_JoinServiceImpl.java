package com.teamsalad.service;

import com.teamsalad.domain.memberVO;
import com.teamsalad.persistence.M_JoinDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class M_JoinServiceImpl implements M_JoinService {

    @Inject
    private M_JoinDAO mdao;

    // 회원가입
    @Override
    public void joinMember(memberVO vo) {
        mdao.joinMember(vo);
    }

    // 아이디 중복 검사
    @Override
    public int idCheck(String m_id) throws Exception {
        return mdao.idCheck(m_id);
    }


}
