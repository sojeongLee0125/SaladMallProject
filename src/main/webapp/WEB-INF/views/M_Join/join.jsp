<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="/resources/saladmall/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원가입</h2>
						<div class="breadcrumb__option">
							<a href="${pageContext.request.contextPath}/index">Home</a> <span>Join</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Contact Section Begin -->

<!-- 텡플릿  -->
<section class="checkout spad">
	<div class="container">
		<div class="checkout__form join__form">
			<form action="" method="post" name="joinform">
				<div class="row">
					<div class="col-lg-12">
						<div class="checkout__input">
							<p>아이디<span>*</span></p>
							<input type="text" class="pw_input" name="m_id" id="m_id">
							<p class="idCheck" style="margin-bottom:0;"><span class="idCheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
							<button type="button" class="btn btn-primary modalModBtn" style= "visibility: hidden;" id="id_dupli_use">사용 하기</button>
							<input type="hidden" id="idDuplication" value="false">
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input">
							<p>비밀번호<span>*</span></p>
							<input type="password" class="pw_input" name="m_pw" id="m_pw1">
							<p class="pw1Check" style="margin-bottom:0;"><span class="pw1CheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input">
							<p>비밀번호 확인<span>*</span></p>
							<input type="password" class="pwck_input" name="m_pw2" id="m_pw2">
							<p class="pw2Check" style="margin-bottom:0;"><span class="pw2CheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input">
							<p>이름<span>*</span></p>
							<input type="text" class="user_input" name="m_name" id="m_name">
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input">
							<p>전화번호<span>*</span></p>
							<input type="text" class="user_input" name="m_phone" id="m_phone" placeholder="010-0000-0000">
							<p class="phoneCheck" style="margin-bottom:0;"><span class="phoneCheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input ">
							<p>이메일<span>*</span></p>
							<div class="join_btn">
								<input type="text" class="mail_input" name="m_email" id="m_email">
								<p class="emailCheck" style="margin-bottom:0;"><span class="emailCheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
								<button type="button" class="site-btn" id="mail_check_button">인증번호 전송</button>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input" id="mail_check_input_box">
							<p>인증번호<span>*</span></p>
							<input type="text" name="checkNumber" id="checkNumber" disabled="disabled">
							<p class="cknumCheck" style="margin-bottom:0;"><span class="cknumCheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
							<input type="hidden" id="hiddenNumberCheck" value="false">
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input">
							<p>우편번호<span>*</span></p>
							<div class="join_btn">
								<input type="text" class="address_input_1" name="m_zip" id="m_zip" onclick="addrclick()" readonly="readonly">
								<button type="button" class="site-btn" onclick="addrclick()">주소 검색</button>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input">
							<p>주소</p>
							<input type="text" class="address_input_2" name="m_addr1" id="m_addr1" readonly="readonly">
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout__input">
							<p>상세 주소</p>
							<input type="text" class="address_input_2" name="m_addr2" id="m_addr2">
						</div>
					</div>
					<div class="col-lg-12 Btn_wide">
						<button type="button" class="site-btn" id="MJoin_submit_Btn">가입하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
    
<script type="text/javascript">

/* 인증번호 이메일 전송 */

//이메일전송 인증번호 저장위한 코드
var emailCKCode = "";

$("#mail_check_button").click(function(){
		
	// 입력한 이메일
	var email = $("#m_email").val();
	// 이메일 검증식
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
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
	} else{
		alert("이메일 인증메일이 발송되었습니다.");
	}
	
	// 인증번호 입력란
	var checkBox = $("#checkNumber");      
	
	 $.ajax({
	        type:"GET",
	        url:"mailCheck?email=" + email,	
	        success:function(data){
	        	console.log("data : " + data);
	        	checkBox.attr("disabled",false);
	        	code = data;
	        }		
	        			        		
	    });
});

 
/* 인증번호 비교 */
$("#checkNumber").keyup(function(){
	
	 var inputCode = $("#checkNumber").val();        // 입력코드    
	 
	 if(inputCode == code){                            
		    // 일치할 경우
		 $(".cknumCheck .cknumCheckMsg").css({
				visibility : 'visible',
				display : 'block',
				color : 'green'
			}).text("인증번호가 일치합니다.");
		    
		$('#hiddenNumberCheck').attr('value', true);
	    
	 } else {                         
	    	// 일치하지 않을 경우
	        $(".cknumCheck .cknumCheckMsg").css({
				visibility : 'visible',
				display : 'block',
				color : 'red'
			}).text("인증번호 일치하지 않습니다.");
	    }    
});
 

/* 회원가입 유효성 제어   */
$(function() {	
	
		var getCheck = RegExp(/^[a-zA-Z0-9]{6,12}$/);
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getPhone = RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);
		
		// 첫 화면 도움말 아이디
		$(".idCheck .idCheckMsg").css({
			visibility : 'visible',
			display : 'block',
			color : 'red'
		}).text("아이디는 6-12자의 영문 대소문자 및 숫자로 입력해 주세요.");

		// 첫 화면 도움말 비밀번호
		$(".pw1Check .pw1CheckMsg").css({
			visibility : 'visible',
			display : 'block',
			color : 'red'
		}).text("비밀번호는 6-12자의 영문 대소문자 및 숫자로 입력해 주세요.");

		// 아이디 입력 값 검증
		$('#m_id').keyup(function() {
			
			if ($('#m_id').val() == "") {
				$(".idCheck .idCheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("아이디를 입력해 주세요.");
			} else if (!getCheck.test($("#m_id").val())) {
				$(".idCheck .idCheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("아이디를 6-12자의 영문 대소문자 및 숫자로 입력해 주세요.");
			} else {
				
				var m_id = $('#m_id').val(); // 입력되는 값
				var data = {
					m_id : m_id
				} 
				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

				$.ajax({
					type : "post",
					url : "/M_Join/memberIdCk",
					data : data,
					success : function(result) {
			
						if (result == 'success') {					
							
							$(".idCheck .idCheckMsg").css({
								visibility : 'visible',
								display : 'block',
								color : 'green'
							}).text("사용 가능한 아이디 입니다.");
							
							$('#id_dupli_use').css({
								visibility : 'visible'
							});							
									
						} else {
							$(".idCheck .idCheckMsg").css({
								visibility : 'visible',
								display : 'block',
								color : 'red'
							}).text("중복된 아이디 입니다.");
							
							$('#id_dupli_use').css({
								visibility : 'hidden'
							});	
						}
				    } // success 종료
				}); // ajax 종료
			} // else종료
		});
		// 아이디 입력 값 검증
		
		// 중복 아이디 체크 사용하기 버튼
		$('#id_dupli_use').click(function() {
			$("#m_id").attr('readonly', true);
			$('#idDuplication').attr('value', true);
		});

		// 비밀번호 입력 값 검증
		$('#m_pw1').keyup(function() {
			if ($('#m_pw1').val() == "") {
				$(".pw1Check .pw1CheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("비밀번호를 입력해 주세요.");
			} else if (!getCheck.test($("#m_pw1").val())) {
				$(".pw1Check .pw1CheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("비밀번호를 6-12자의 영문 대소문자 및 숫자로 입력해 주세요.");
			} else {
				$(".pw1Check .pw1CheckMsg").css({
					visibility : 'hidden',
					display : 'block',
					color : 'red'
				}).text("");
			}
		});// 비밀번호 입력값 검증

		// 비밀번호 일치 확인 도움말
		$('#m_pw2').keyup(function() {
			if ($('#m_pw1').val() != $('#m_pw2').val()) {
				$(".pw2Check .pw2CheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("비밀번호가 일치하지 않습니다.");
			} else {
				$(".pw2Check .pw2CheckMsg").css({
					visibility : 'hidden',
					display : 'block',
					color : 'red'
				}).text("");
			}
		});// 비밀번호 일치 확인
		
		// 전화번호 입력 값 검증
		$('#m_phone').keyup(function() {
			if (!getPhone.test($("#m_phone").val())) {
				$(".phoneCheck .phoneCheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("전화번호 형식이 올바르지 않습니다.");
			} else {
				$(".phoneCheck .phoneCheckMsg").css({
					visibility : 'hidden',
					display : 'block',
					color : 'red'
				}).text("");
			}
		});// 비밀번호 입력 값 검증
		
		// 이메일 입력 값 검증
		$('#m_email').keyup(function() {
			if (!getMail.test($("#m_email").val())) {
				$(".emailCheck .emailCheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("이메일 형식이 올바르지 않습니다.");
			} else {
				$(".emailCheck .emailCheckMsg").css({
					visibility : 'hidden',
					display : 'block',
					color : 'red'
				}).text("");
			}
		});// 이메일 입력 값 검증
		
		// 서브밋 이벤트 발생
		$('#MJoin_submit_Btn').click(function() {
			JoinSubmit();
		});

	}); 
	//회원가입 유효성 제어종료

	// 서브밋 함수
	function JoinSubmit() {
		
		// 변수
		var m_id = $('#m_id').val();
		var m_pw = $('#m_pw1').val();
		var m_pw2 = $('#m_pw2').val();
		var m_name = $('#m_name').val();
		var m_phone = $('#m_phone').val();
		var m_email = $('#m_email').val();
		var checkNumber = $('#checkNumber').val();
		var m_addr1 = $('#m_addr1').val();
		var m_addr2 = $('#m_addr2').val();
		var m_zip = 1;
		var idCheck = $('#idDuplication').val();
		var numCheck = $('#hiddenNumberCheck').val();		
		
		
		// 형식 설정
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getCheck = RegExp(/^[a-zA-Z0-9]{6,12}$/);
		var getName = RegExp(/^[가-힣]+$/);
		var fmt = RegExp(/^\d{6}[1234]\d{6}$/);
		var getPhone = RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);
		
		//아이디 공백 확인 
		if ($("#m_id").val() == "") {
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return false;
		}

		//아이디 유효성검사 
		if (!getCheck.test($("#m_id").val())) {
			alert("아이디를 형식에 맞게 입력해주세요");
			$("#m_id").val("");
			$("#m_id").focus();
			return false;
		}
		
		//아이디 중복 확인 검사 유무 
		if (idCheck == "false"){
			alert("아이디 중복 검사 후 사용하기를 눌러주세요.");
			$("#m_id").focus();
			return false;
		}

		//비밀번호 공백 확인 
		if ($("#m_pw1").val() == "") {
			alert("패스워드를 입력해주세요");
			$("#m_pw1").focus();
			return false;
		}

		//비밀번호 유효성검사 
		if (!getCheck.test($("#m_pw1").val())) {
			alert("비밀번호를 형식에 맞게 입력해주세요");
			$("#m_pw1").focus();
			return false;
		}

		//비밀번호 확인란 공백 확인 
		if ($("#m_pw2").val() == "") {
			alert("패스워드 확인란을 입력해주세요");
			$("#m_pw2").focus();
			return false;
		}

		//비밀번호 서로확인 
		if ($("#m_pw1").val() != $("#m_pw2").val()) {
			alert("비밀번호 확인이 일치하지 않습니다");
			$("#m_pw2").val("");
			$("#m_pw2").focus();
			return false;
		}
		
		//이름 공백 검사 
		if ($("#m_name").val() == "") {
			alert("이름을 입력해주세요");
			$("#m_name").focus();
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
			$("#m_phone").focus();
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
		
		//인증번호 공백 확인 
		if ($("#checkNumber").val() == "") {
			alert("이메일 인증을 실시해주세요");
			$("#checkNumber").focus();
			return false;
		}
		
		// 인증번호 일치 유무 
		if (numCheck == "false"){
			alert("인증번호가 일치하지 않습니다.");
			$("#checkNumber").focus();
			return false;
		}
		
		//주소 공백 검사 
		if ($("#m_zip").val() == "" || $("#m_addr1").val() == "" || $("#m_addr2").val() == "") {
			alert("주소 정보를 입력해주세요");
			$("#m_zip").focus();
			$("#m_addr1").focus();
			$("#m_addr2").focus();
			return false;
		} else{
			alert("회원가입에 성공했습니다.");
			document.joinform.submit();
		} 
		
		
	} // 회원가입 입력 데이터 유효성 검사 끝

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

<%@ include file="../include/footer.jsp" %>