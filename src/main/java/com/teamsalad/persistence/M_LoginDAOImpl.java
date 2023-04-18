package com.teamsalad.persistence;

import com.teamsalad.domain.memberVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class M_LoginDAOImpl implements M_LoginDAO {

    @Inject
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(M_LoginDAOImpl.class);

    // AdminMapper.xml 파일에 접근가능한 이름(주소)
    private static final String namespace = "com.teamsalad.mapper.M_LoginMapper";

    // 일반 로그인
    @Override
    public memberVO memberLogin(memberVO mvo) throws Exception {
        logger.info(" DAO : memberLogin(memberVO mvo) 호출 ");

        memberVO loginResultMVO = sqlSession.selectOne(namespace + ".memberLogin", mvo);

        return loginResultMVO;
    }

    // 구글 로그인
    @Override
    public memberVO googleLogin(memberVO mvo) throws Exception {
        logger.info(" DAO : googleLogin(memberVO mvo) 호출 ");

        memberVO googleLoginResultMVO = sqlSession.selectOne(namespace + ".googleLogin", mvo);

        return googleLoginResultMVO;
    }

    // 구글 회원가입
    @Override
    public void googleJoin(memberVO mvo) throws Exception {
        logger.info(" DAO : googleJoin(memberVO mvo) 호출 ");

        sqlSession.insert(namespace + ".googleJoin", mvo);
    }

    //비밀번호변경
    @Override
    public int updatePw(memberVO vo) throws Exception {
        return sqlSession.update(namespace + ".updatePw", vo);
    }

    // 회원정보 조회
    @Override
    public memberVO readMember(String m_id) {
        return sqlSession.selectOne(namespace + ".readMember", m_id);
    }


}
