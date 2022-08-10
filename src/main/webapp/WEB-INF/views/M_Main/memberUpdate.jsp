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
			<h4>${mvo.m_id }님 정보수정</h4>
			<form action="./memberUpdate" method="post" name="updateform">
				<div class="common__input">
					<p>이름<span>*</span></p>
					<input type="text" name="m_name" id="m_name" value="${mvo.m_name }">
					<input type="hidden" name="m_id" value="${mvo.m_id }">
				</div>
				<div class="common__input">
					<p>기존 비밀번호<span>*</span></p>
					<input type="password" id="m_pw1" placeholder="기존 비밀번호를 입력해주세요.">
					<input type="hidden" id="m_pw2" value="${mvo.m_pw }">
				</div>
				<div class="common__input">
					<p>새 비밀번호<span>*</span></p>
					<input type="password" id="new_pw1" name="m_pw" placeholder="6-12자의 영문 대소문자 및 숫자로 입력해주세요.">
				</div>
				<div class="common__input">
					<p>새 비밀번호 확인<span>*</span></p>
					<input type="password" id="new_pw2" placeholder="새 비밀번호 확인을 입력해주세요.">
				</div>
				<div class="common__input">
					<p>E-mail<span>*</span></p>
					<input type="text" name="m_email" id="m_email" value="${mvo.m_email }">
				</div>
				<div class="common__input">
					<p>전화번호<span>*</span></p>
					<input type="text" name="m_phone" id="m_phone" value="${mvo.m_phone }">
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="common__input">
							<p>우편번호<span>*</span></p>
							<input type="text" name="m_zip" id="m_zip" value="${mvo.m_zip }" readonly="readonly" onclick="addrclick()">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="common__input">
							<p>주소<span>*</span></p>
							<input type="text" name="m_addr1" id="m_addr1" value="${mvo.m_addr1 }" readonly="readonly" onclick="addrclick()">
						</div>
					</div>
				</div>
				<div class="common__input">
					<p>상세주소<span>*</span></p>
					<input type="text" name="m_addr2" id="m_addr2" value="${mvo.m_addr2 }">
				</div>
			</form>
		</div>
	</div>
	
	<!-- button -->
	<div class="d-flex justify-content-center">
		<button type="button" id="BtnMypage" class="site-btn_green">마이페이지</button>
		<button type="button" id="BtnUpdate" class="site-btn_white">정보수정</button>
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

		// 수정하기
		$("#BtnUpdate").click(function() {
			UpdateSubmit();
		});

		// 삭제하기
		$("#BtnDelete").click(function() {
			location.href = "./memberDelete";
		});

	});

	/* 수정하기 유효성 제어   */

	// 서브밋 함수
	function UpdateSubmit() {
		
		// 변수
		var m_pw1 = $('#m_pw1').val();
		var m_pw2 = $('#m_pw2').val();
		var m_name = $('#m_name').val();
		var m_phone = $('#m_phone').val();
		var m_email = $('#m_email').val();
		var m_zip = $('#m_zip').val();
		var m_addr1 = $('#m_addr1').val();
		var m_addr2 = $('#m_addr2').val();		
		
		// 형식 설정
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getName = RegExp(/^[가-힣]+$/);
		var getPhone = RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);
		var getCheck = RegExp(/^[a-zA-Z0-9]{6,12}$/);
		
		//이름 공백 검사 
		if ($("#m_name").val() == "") {
			alert("이름을 입력해주세요");
			$("#m_name").focus();
			return false;
		}
		
		//비밀번호 공백 확인 
		if ($("#m_pw1").val() == "") {
			alert("패스워드를 입력해주세요");
			$("#m_pw1").focus();
			return false;
		}

		//비밀번호 서로확인 
		if ($("#m_pw1").val() != $("#m_pw2").val()) {
			alert("기존 비밀번호와 일치하지 않습니다");
			$("#m_pw1").val("");
			return false;
		}
		
		// 새 비밀번호 공백 확인 
		if ($("#new_pw1").val() == "") {
			alert("새로운 패스워드를 입력해주세요");
			$("#m_pw1").focus();
			return false;
		}

		//비밀번호 유효성검사 
		if (!getCheck.test($("#new_pw1").val())) {
			alert("비밀번호를 형식에 맞게 입력해주세요");
			$("#new_pw1").focus();
			return false;
		}
		
		//비밀번호 서로확인 
		if ($("#new_pw1").val() != $("#new_pw2").val()) {
			alert("새 비밀번호가 서로 일치하지 않습니다");
			$("#new_pw2").val("");
			return false;
		}
		
		
		//이메일 공백 확인 
		if ($("#m_email").val() == "") {
			alert("이메일을 입력해주세요");
			$("#m_email").focus();
			return false;
		}

		//이메일 유효성 검사 
		if (!getMail.test($("#m_email").val())) {
			alert("이메일형식에 맞게 입력해주세요");
			$("#m_email").focus();
			return false;
		}
		
		//전화번호 공백 검사 
		if ($("#m_phone").val() == "") {
			alert("전화번호를 입력해주세요");
			$("#m_phone").focus();
			return false;
		}
		
		//전화번호 유효성 검사 
		if (!getPhone.test($("#m_phone").val())) {
			alert("전화번호 형식에 맞게 입력해주세요");
			$("#m_phone").val("");
			$("#m_phone").focus();
			return false;
		}		
				
		//주소 공백 검사 
		if ($("#m_zip").val() == "" || $("#m_addr1").val() == "" || $("#m_addr2").val() == "") {
			alert("주소 정보를 입력해주세요");
			$("#m_zip").focus();
			return false;
		} else{
			alert("회원정보 수정에 성공했습니다.");
			document.updateform.submit();
		} 
		
	} // 수정하기 유효성 검사 끝

	</script>
	
	<!-- 우편주소 api 불러오기  -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		// 주소 검색 버튼 클릭
		function addrclick() {	
			new daum.Postcode({
				oncomplete : function(data) {
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
		
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
		
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("m_addr1").value = extraAddr;
		
					} else {
						document.getElementById("m_addr1").value = '';
					}
		
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("m_zip").value = data.zonecode;
					document.getElementById("m_addr1").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("m_addr2").focus();
				}
			}).open();
		}
	</script>
	<!-- 카카오 우편번호 api -->



<%@ include file="../include/footer.jsp"%>
