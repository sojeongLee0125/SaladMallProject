package com.teamsalad.persistence;

import com.teamsalad.domain.memberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class M_JoinDAOImpl implements M_JoinDAO {

    @Inject
    private SqlSession sqlSession;

    // M_JoinMapper.xml 파일에 접근가능한 이름(주소)
    private static final String namespace = "com.teamsalad.mapper.M_JoinMapper";

    @Override
    public void joinMember(memberVO vo) {
        sqlSession.insert(namespace + ".joinMember", vo);
    }


    @Override
    public int idCheck(String m_id) {
        return sqlSession.selectOne(namespace + ".idCheck", m_id);
    }


}
