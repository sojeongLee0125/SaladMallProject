package com.teamsalad.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.cartVO;
import com.teamsalad.domain.customVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.recipeVO;

@Repository
public class R_CustomDAOImpl implements R_CustomDAO{

	// 디비연결처리
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(R_CustomDAOImpl.class);
	
	// Mapper 파일 구분값
	private static final String namespace = "com.teamsalad.mapper.R_CustomMapper";
	
	// 재료 리스트 불러오기
	@Override
	public List<ingredientVO> listCategory(int category) throws Exception {
		
		logger.info(" listAll(int category) 호출 ");
		
		// mapper에 동작호출
		return sqlSession.selectList(namespace+".listAll",category);
	}
	
	// 커스텀 확인
	@Override
	public String chkCustom(String m_id) throws Exception {
		// id에 해당하는 커스텀이 있는지 확인
		logger.info(" chkCustom(String m_id) 호출 ");
		
		// mapper에 동작 호출
		return sqlSession.selectOne(namespace+".chkcustom",m_id);
		
	}
	
	@Override
	public String chkCustomCmbnt(String m_id) throws Exception {
		// id에 해당하는 커스텀이 있는지 확인
		logger.info(" chkCustomCmbnt(String m_id) 호출 ");
		
		// mapper에 동작 호출
		return sqlSession.selectOne(namespace+".chkcustomcmbnt",m_id);
		
	}
	
	// 커스텀이 없을 경우
	@Override
	public void newCustom(String m_id) throws Exception {
		
		// id에 해당하는 커스텀이 없을경우 실행
		logger.info(" newCustom(String m_id) 호출 ");
		
		//mapper에 동작 호출
		sqlSession.insert(namespace+".newcustom", m_id);
		
	}
	
	// 커스텀이 있을 경우
	@Override
	public void resetCustom(String m_id) throws Exception {
		// id에 해당하는 커스텀이 있을경우 실행
		logger.info(" resetCustom(String id) 호출");
		
		//mapper에 동작 호출
		sqlSession.update(namespace+".resetcustom", m_id);
		
	}
	
	// 커스텀 불러오기
	@Override
	public String showCustom(String m_id) throws Exception {
		
		// id에 해당하는 커스텀 불러오기
		logger.info(" showCustom(int m_id) 호출");
		
		// mapper에 동작 호출
		return sqlSession.selectOne(namespace+".showcustom", m_id);
	}
	
	// 커스텀 등록 -1
	@Override
	public void addFirstCustom(customVO vo) throws Exception {
		
		logger.info(" addFirstCustom() 호출 ");
		
		// mapper에 동작 호출
		sqlSession.update(namespace+".addFirstcustom",vo);
		
	}
	
	// 커스텀 등록
	@Override
	public void addCustom(customVO vo) throws Exception {
		
		logger.info(" addCustom() 호출 ");
		
		// mapper에 동작 호출
		sqlSession.update(namespace+".addcustom", vo);
	}
	
	// 재료 리스트 불러오기
	@Override
	public List<ingredientVO> list(ArrayList<String> igdt_numList) throws Exception {
		
		logger.info(" list() 호출 ");
		
		logger.info(" igdt_numList값 확인 "+igdt_numList);
		
		// mapper에 mybatis foreach 준비
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("igdt_numList", igdt_numList);
		
		// mapper에 동작 호출
		return sqlSession.selectList(namespace+".listigdt_num",map);
	}
	
	// 레시피 체크
	@Override
	public recipeVO chkRecipe(String rcp_cmbnt) throws Exception {
		
		logger.info(" chkRecipe() 호출 ");
		
		// mapper에 동작 호출
		return sqlSession.selectOne(namespace+".findrecipe",rcp_cmbnt);
		
	}
	
	// 레시피 등록 및 가격 설정
	@Override
	public void addRecipe(recipeVO vo) throws Exception {
		
		logger.info(" addRecipe() 호출 ");
		
		// 레시피 가격 설정
		// mybatis foreach 사용 준비
		// mapper에 mybatis foreach 준비
		ArrayList<String> igdt_numList = new ArrayList<String>();
		String[] igdt_numArr = vo.getRcp_cmbnt().split(",");
		for(String item : igdt_numArr) {
			igdt_numList.add(item);
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("igdt_numList", igdt_numList);
		logger.info("가격은"+sqlSession.selectOne(namespace+".pricecustom",map));
		// String으로 하면 소수점을 받아와서 mapper에서 int로 받아와서 String형태로 넘김.
		vo.setRcp_price(sqlSession.selectOne(namespace+".pricecustom",map)+"");
		
		// mapper에 동작 호출
		sqlSession.insert(namespace+".addrecipe",vo);	
	}
	
	// 레시피 찾기
	@Override
	public recipeVO findRecipe(String rcp_cmbnt) throws Exception {
		
		logger.info(" findRecipe() 호출 ");
		
		if(sqlSession.selectOne(namespace+".findrecipe", rcp_cmbnt)==null) {
			recipeVO vo = new recipeVO();
			vo.setRcp_cmbnt(rcp_cmbnt);
			
			// 레시피 가격 설정
			
			// mybatis foreach 사용 준비
			// mapper에 mybatis foreach 준비
			ArrayList<String> igdt_numList = new ArrayList<String>();
			String[] igdt_numArr = rcp_cmbnt.split(",");
			for(String item : igdt_numArr) {
				igdt_numList.add(item);
			}

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("igdt_numList", igdt_numList);
			logger.info("가격은"+sqlSession.selectOne(namespace+".pricecustom",map));
			// String으로 하면 소수점을 받아와서 mapper에서 int로 받아와서 String형태로 넘김.
			vo.setRcp_price(sqlSession.selectOne(namespace+".pricecustom",map)+"");
			
			sqlSession.insert(namespace+".addrecipeby2",vo);
		}
		
		 return sqlSession.selectOne(namespace+".findrecipe", rcp_cmbnt);
	}
	
	// 장바구니 체크
	@Override
	public String chkCart(int rcp_num) throws Exception {
		
		logger.info( "chkCart() 호출" );
		
		// mapper에 동작 호출
		return sqlSession.selectOne(namespace+".chkcart", rcp_num);
		
	}
	
	// 수량 업데이트
	@Override
	public void updateCartAmount(int rcp_num) throws Exception {
		
		logger.info( " addCartAmount() 호출");
		
		// mapper에 동작 호출
		sqlSession.update(namespace+".updatecartamount", rcp_num);
		
	}
	
	// 카트 등록
	@Override
	public void addCart(cartVO vo) throws Exception {
		
		logger.info(" addCart() 호출 ");
		
		// mapper에 동작 호출
		sqlSession.insert(namespace+".addcart",vo);
		
	}
}
