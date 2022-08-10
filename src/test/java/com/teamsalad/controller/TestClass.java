package com.teamsalad.controller;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.customerBoardVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.persistence.AdminDAO;
import com.teamsalad.persistence.CSDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class TestClass {
	
	    // 로그
		private static final Logger logger = LoggerFactory.getLogger(TestClass.class);
		
		@Inject
		AdminDAO adao;
		
		@Inject
		CSDAO csdao;
		
		// 멤버 데이터 삽입
		//@Test
		public void MembertestCreate() throws Exception{
			
			for (int i=100 ; i<= 999 ; i++) {
				
				memberVO mvo = new memberVO();
				mvo.setM_id("member"+i);
				mvo.setM_pw("123456");
				mvo.setM_name("샐러드몰 회원"+i);
				mvo.setM_email("member"+i+"@naver.com");
				mvo.setM_zip("47245");
				mvo.setM_addr1("부산 부산진구 중앙대로 지하 서면역");
				mvo.setM_addr2(i+"번출구");
				mvo.setM_phone("010-1223-5678");
				mvo.setM_grade(((int)(Math.random()*4)+1));
				mvo.setM_totalAmount("100000");
				mvo.setM_attendance(1);
				mvo.setM_warning(1);
				//mvo.setM_coupon(i);
				
				adao.insertMember(mvo);
			}
			
		}
		
	// 페이징 테스트	
	//@Test
	public void testCriteria() throws Exception{
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(2);
		
		List<memberVO> mvo = adao.mListCri(cri);
		
		
		for(memberVO vo : mvo) {
			logger.info(vo.getM_id()+":"+vo.getM_name());
		}
	}
	
	// 주문 데이터 삽입
	@Test
	public void OrdertestCreate() throws Exception{
		
		Random random = new Random();
		
		for (int i=100 ; i<= 500 ; i++) {
			
			orderVO ovo = new orderVO();
			
			ovo.setM_id("member"+i);
			ovo.setRcp_num(i);
			ovo.setOrder_pay_num((random.nextInt(888888) + 111111)+"");
			ovo.setRcp_name("모냐의 레시피");
			ovo.setOrder_name("monya");
			ovo.setOrder_receive_name("monya");
			ovo.setOrder_receive_phone("010-1234-5678");
			ovo.setOrder_receive_zip("01010");
			ovo.setOrder_receive_addr1("부산시 모냐네");
			ovo.setOrder_receive_addr2("지하에 놔둬주세요:)");
			ovo.setOrder_type("1");
			ovo.setOrder_amount(1);
			ovo.setOrder_ship_price("2000");
			ovo.setOrder_total_price("30000");
			ovo.setOrder_status(((int)(Math.random()*6)));
			
			adao.insertOrder(ovo);
		}
		
	}
	
	// 재료 데이터 삽입
	//@Test
	public void IngredienttestCreate() throws Exception{
		
		for (int i=100 ; i<= 999 ; i++) {
			
			ingredientVO ivo = new ingredientVO();
			
			ivo.setIgdt_num(i);
			ivo.setIgdt_category(""+i);
			ivo.setIgdt_name("재료"+i);
			ivo.setIgdt_price("20000");
			ivo.setIgdt_main_img("defaultimg.jpg");
			ivo.setIgdt_country("국산");
			ivo.setIgdt_info("좋음");
			ivo.setIgdt_count(i);
			ivo.setIgdt_tag("재료");
			ivo.setIgdt_size("20g");
						
			adao.insertIngredient(ivo);
		}
		
	}
	
	// 고객센터 데이터 삽입
	//@Test
	public void CSBoardCreate() throws Exception{
		
		Random random = new Random();
		
		for (int i=11 ; i< 100 ; i++) {
			
			customerBoardVO cvo = new customerBoardVO();
			
			cvo.setM_id("customer0"+i);
			cvo.setCustomer_b_content("문의사항 내용.");
			cvo.setCustomer_b_file("default");
			cvo.setCustomer_b_status((int)(Math.random()));
			cvo.setCustomer_b_title("문의사항 입니다");
			cvo.setCustomer_b_type(((int)(Math.random()*5)+1) + "");
			cvo.setOrder_num(random.nextInt(888888) + 111111);
						
			csdao.create(cvo);
		}
		
	}

		
	

}
