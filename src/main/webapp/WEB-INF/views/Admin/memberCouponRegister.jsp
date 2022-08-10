<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	
<h1 style="text-align: center; padding-top: 30px;">개별 회원 쿠폰 발급</h1>

<section style="padding: 50px 50px 350px 50px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">쿠폰 정보</h3>
		</div>
		<form action="" method="post" name="couponform">
			<div class="box-body">
				<div class="form-group">
					<label for="coupon_id">쿠폰 아이디</label>
					<select class="form-control" name="m_coupon" id="m_coupon" >
						<c:forEach var="cvo" items="${couponListAll }">
						 <option value="${cvo.coupon_id }">${cvo.coupon_id }</option>
						</c:forEach>
                			</select> 
				</div>
				<div class="form-group">
					<label for="coupon_name">해당 아이디</label> 
					<input type="text" class="form-control" id="m_id" name="m_id">
					<p class="idCheck" style="margin-bottom:0;"><span class="idCheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
					<input type="hidden" id="checkok">
				</div>
			</div>
			<div class="box-footer">
				<button type="button" class="btn btn-primary" onclick="couponSubmit();">등록하기</button>
			</div>
		</form>
	</div>
</section>

<script type="text/javascript">

//아이디 입력 값 검증
$('#m_id').keyup(function() {
	
	if ($('#m_id').val() == "") {
		$(".idCheck .idCheckMsg").css({
			visibility : 'visible',
			display : 'block',
			color : 'red'
		}).text("아이디를 입력해 주세요.");
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
						color : 'red'
					}).text("올바르지 않은 아이디 입니다.");	
					
					$("#checkok").val("nosuccess");
					
				} else {
					$(".idCheck .idCheckMsg").css({
						visibility : 'visible',
						display : 'block',
						color : 'green'
					}).text("올바른 회원 아이디 입니다.");
					
					$("#checkok").val("success");
					
				}//if 종료
		    }// success 종료
		});// ajax 종료
	}// else종료
});


//서브밋 함수
function couponSubmit() {
	
	// 변수
	var m_id = $('#m_id').val();	
	var check_msg = $('#checkok').val();
		
	//아이디 공백 확인 
	if ($("#m_id").val() == "") {
		alert("아이디를 입력해 주세요");
		$("#id").focus();
		return false;
	} 
	
	if (check_msg !== "success") {
		alert("올바른 회원 아이디를 입력해 주세요");
		$("#id").focus();
		return false;
	} else{
		alert("쿠폰 발급에 성공했습니다.");
		document.couponform.submit();
	} 
	
} // 쿠폰 발급 데이터 유효성 검사 끝

</script>
 <%@ include file="footer.jsp"%>
