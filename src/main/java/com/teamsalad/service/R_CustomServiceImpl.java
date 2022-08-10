package com.teamsalad.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.teamsalad.domain.cartVO;
import com.teamsalad.domain.customVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.recipeVO;
import com.teamsalad.persistence.R_CustomDAO;

@Service
public class R_CustomServiceImpl implements R_CustomService{
	
	private static final Logger logger = LoggerFactory.getLogger(R_CustomService.class);
	
	@Inject
	private R_CustomDAO rcdao;
	
	// 재료 목록 불러오기
	@Override
	public List<ingredientVO> igdtList(int category) throws Exception {
		
		System.out.println(" S : igdtList() 호출 -> DAO");
		
		return rcdao.listCategory(category);
	}
	
	// 새로운 샐러드 만들기
	@Override
	public void newCustom(String m_id) throws Exception {
		
		System.out.println(" S : newCustom() 호출 -> DAO");
		
		// 값이 없으면 생성
		if(rcdao.chkCustom(m_id)==null) {
			rcdao.newCustom(m_id);
		} else {
			// 값이 있으면 초기화만
			rcdao.resetCustom(m_id);
		}
		
		System.out.println(" S : DAO 처리 완료 ");
	}
	
	// 커스텀에 재료 추가
	@Override
	public void addCustom(customVO vo) throws Exception {
		
		System.out.println(" S : addCustom() 호출 -> DAO");
		
		// 첫번째 재료는 그냥 추가
		if(rcdao.showCustom(vo.getM_id())==null) {
			
			rcdao.addFirstCustom(vo);
		}
		// 두번째 이후 재료는 ,를 붙여서 추가
		else {
			rcdao.addCustom(vo);
		}
		
	}
	
	// 현재 샐러드 보여주기
	@Override
	public List<ingredientVO> customList(String m_id) throws Exception {
		
		System.out.println(" S : customList() 호출 -> DAO");
		
		// id에 해당하는 샐러드 조합 가져오기
		// rcp_cmbnt가 null이면 실행하지않기
		if(rcdao.showCustom(m_id)==null) {
			return null;
		}
		
		String igdt_nums = rcdao.showCustom(m_id);
		
		System.out.println(" S : str 값 확인 "+igdt_nums);
		// igdt_num 이 1,2,3 와 같이 int + String + int + … 와 같이 저장되어서 첫번쨰값 이후를 못읽는다
		// rcdao.list(igdt_nums);
		
		// mybatis foreach 사용 준비
		ArrayList<String> igdt_numList = new ArrayList<String>();
		
		String[] igdt_numArr = igdt_nums.split(",");
		
		for(String item : igdt_numArr) {
			igdt_numList.add(item);
		}
		
		// List<ingredientVO> 리턴 
		return rcdao.list(igdt_numList);
	}
	
	// 샐러드 조합 받아오기
	@Override
	public String custom(String m_id) throws Exception {
		
		String[] dup_rcp_cmbnt = rcdao.showCustom(m_id).split(",");
		
		// 중복제거, 정렬
		TreeSet<Integer> set = new TreeSet<Integer>();
		
		for(int i=0 ; i<dup_rcp_cmbnt.length ; i++) {
			set.add(Integer.parseInt(dup_rcp_cmbnt[i]));
		}
		
		TreeSet<String> set2 = new TreeSet<String>();
		
		for(Integer integer : set) {
			set2.add(integer.toString());
		}
		
		String rcp_cmbnt = String.join(",", set2);
		
		return rcp_cmbnt;
	}	
	
	// 샐러드 조합 체크
	@Override
	public String chkcustom(String m_id) throws Exception {
		
		// m_id에 맞는 salad_custom의 rcp_cmbnt 값 확
		return rcdao.chkCustomCmbnt(m_id);
	}
	
	// 레시피 추가
	@Override
	public void addRecipe(recipeVO vo) throws Exception {
		
		// 중복확인
		if(rcdao.chkRecipe(vo.getRcp_cmbnt())==null) {
			// 레시피에 추가
			rcdao.addRecipe(vo);
		}

	}
	
	// 재료 조합 rcp_num 받아오기
	@Override
	public recipeVO findRecipe(String rcp_cmbnt) throws Exception {
		
		// 조합 검색
		return rcdao.findRecipe(rcp_cmbnt);
	}
	
	// 장바구니 추가
	@Override
	public void addCart(cartVO vo) throws Exception {
		
		// 중복 검사
		if(rcdao.chkCart(vo.getRcp_num())==null) {
			// 장바구니에 추가
			rcdao.addCart(vo);
		} else {
			// 중복시 수량만 +1
			rcdao.updateCartAmount(vo.getRcp_num());
		}
		
	}
	
}
