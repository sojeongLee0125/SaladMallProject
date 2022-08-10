package com.teamsalad.service;

import java.util.List;

import com.teamsalad.domain.cartVO;
import com.teamsalad.domain.customVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.recipeVO;

public interface R_CustomService {
		
	// 재료 목록 불러오기
	public List<ingredientVO> igdtList(int category) throws Exception;

	// 새로운 샐러드 만들기
	public void newCustom(String m_id) throws Exception;
	
	// 커스텀에 재료 추가
	public void addCustom(customVO vo) throws Exception;
	
	// 현재 샐러드 보여주기
	public List<ingredientVO> customList(String m_id) throws Exception;
	
	// 샐러드 조합 받아오기
	public String custom(String m_id) throws Exception;
	
	// 샐러드 조합 있는지 체크
	public String chkcustom(String m_id) throws Exception;
	
	// 레시피 추가
	public void addRecipe(recipeVO vo) throws Exception;
	
	// 재료 조합에 맞는 rcp_num 받아오기
	public recipeVO findRecipe(String rcp_cmbnt) throws Exception;
	
	// 장바구니 추가
	public void addCart(cartVO vo) throws Exception;
	
	
}
