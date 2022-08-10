package com.teamsalad.persistence;

import java.util.ArrayList;
import java.util.List;

import com.teamsalad.domain.cartVO;
import com.teamsalad.domain.customVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.recipeVO;

public interface R_CustomDAO {

	// 재료 목록 불러오기
	public List<ingredientVO> listCategory(int category) throws Exception;
	
	// 새로운 레시피 만들기
	public void newCustom(String m_id) throws Exception;
	
	// 신규 커스텀 확인
	public String chkCustom(String m_id) throws Exception;
	
	// 커스텀 조합 확인
	public String chkCustomCmbnt(String m_id) throws Exception;
	
	// 기존 레시피 초기화
	public void resetCustom(String m_id) throws Exception;
	
	// 레시피에 최초로 재료 추가
	public void addFirstCustom(customVO vo) throws Exception;
	
	// 레시피에 재료 추가
	public void addCustom(customVO vo) throws Exception;
	
	// 커스텀한 샐러드 불러오기 
	public String showCustom(String m_id) throws Exception;
	
	// 재료 불러오기
	public List<ingredientVO> list(ArrayList<String> igdt_numList) throws Exception;
	
	// 레시피 중복 검사
	public recipeVO chkRecipe(String rcp_cmbnt) throws Exception;
	
	// 레시피 추가
	public void addRecipe(recipeVO vo) throws Exception;
	
	// 레시피 찾기
	public recipeVO findRecipe(String rcp_cmbnt) throws Exception;
	
	// 장바구니 중복 검사
	public String chkCart(int rcp_num) throws Exception;
	
	// 장바구니 수량 +1
	public void updateCartAmount(int rcp_num) throws Exception;
	
	// 장바구니에 넣기
	public void addCart(cartVO vo) throws Exception;
	
	
}
