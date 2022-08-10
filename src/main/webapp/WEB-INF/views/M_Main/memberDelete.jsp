<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="${pageContext.request.contextPath}/resources/saladmall/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Member-Information</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">회원정보</a> <span>수정페이지</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="common__form">
			<h4>${mvo.m_id }님 정말로 탈퇴하시겠습니까?</h4>
			<form action="" method="post" name="deleteform">
				<div class="common__input">
					<p>비밀번호를 입력해주세요</p>
					<input type="password" name="m_pw1" id="m_pw1">
					<input type="hidden" id="m_pw2" value="${mvo.m_pw }">
					<input type="hidden" name="m_id" value="${mvo.m_id }">
				</div>
			</form>
		</div>
	</div>
	
	<!-- button -->
	<div class="d-flex justify-content-center">
		<button type="button" id="BtnMypage" class="site-btn_green">마이페이지</button>
		<button type="button" id="BtnDelete" class="site-btn_gray">회원탈퇴</button>
	</div>
</section>
<!-- Checkout Section End -->

<!-- 자바스크립트 영역 -->

<script type="text/javascript">


	$(document).ready(function() {

		// 버튼 제어
		// 마이페이지
		$("#BtnMypage").click(function() {
			location.href = "./mypage";
		});

		// 삭제하기
		$("#BtnDelete").click(function() {
			DeleteSubmit();
		});

	});

	/* 탈퇴하기 유효성 제어   */

	// 서브밋 함수
	function DeleteSubmit() {
		
		// 변수
		var m_pw1 = $('#m_pw1').val();
		var m_pw2 = $('#m_pw2').val();
		
		//비밀번호 공백 확인 
		if ($("#m_pw1").val() == "") {
			alert("패스워드를 입력해주세요");
			$("#m_pw1").focus();
			return false;
		}

		//비밀번호 서로확인 
		if ($("#m_pw1").val() != $("#m_pw2").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#m_pw1").val("");
			return false;
		}else{
			alert("회원탈퇴에 성공했습니다.");
			document.deleteform.submit();
		} 
		
	} // 삭제하기 유효성 검사 끝

	</script>

<%@ include file="../include/footer.jsp"%>
