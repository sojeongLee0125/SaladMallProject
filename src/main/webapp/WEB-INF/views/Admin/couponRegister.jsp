<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>
	
<h1 style="text-align: center; padding-top: 30px;">쿠폰 등록</h1>

<section style="padding: 30px 50px 30px 50px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">쿠폰 정보</h3>
		</div>
		<form action="" method="post" name="registerform">
			<div class="box-body">
				<div class="form-group">
					<label for="coupon_id">쿠폰 아이디</label> 
					<input type="text" class="form-control" id="coupon_id" name="coupon_id" placeholder="쿠폰아이디는 랜덤 부여 됩니다." disabled="disabled">
				</div>
				<div class="form-group">
					<label for="coupon_name">쿠폰 이름</label> 
					<input type="text" class="form-control" id="coupon_name" name="coupon_name">
				</div>
				<div class="form-group">
					<label for="coupon_disc_rate">쿠폰 할인율</label> 
					<input type="text" class="form-control" id="coupon_disc_rate" name="coupon_disc_rate">
				</div>
			</div>
			<div class="box-footer">
				<button type="button" class="btn btn-primary" onclick="registerCheck()">등록하기</button>
			</div>
		</form>
	</div>
</section>
<script>

//서브밋 함수
function registerCheck() {
		
	//쿠폰명 공백 확인 
	if ($("#coupon_name").val() == "") {
		alert("쿠폰 이름 입력해 주세요");
		$("#coupon_name").focus();
		return false;
	} else if ($("#coupon_disc_rate").val() == "") {
		alert("쿠폰 할인율을 입력해 주세요");
		$("#coupon_disc_rate").focus();
		return false;
	} else{
		alert("쿠폰 신규 등록에 성공했습니다.");
		document.registerform.submit();
	} 
	
} // 쿠폰 발급 데이터 유효성 검사 끝

</script>

 <%@ include file="footer.jsp"%>