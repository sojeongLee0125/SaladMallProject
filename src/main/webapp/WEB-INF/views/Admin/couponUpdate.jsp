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
 
<h1 style="text-align: center; padding-top: 30px;">쿠폰 정보 수정</h1>

<section style="padding: 30px 400px 300px 400px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">쿠폰정보</h3>
		</div>
		<form role="form" action="" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="coupon_id">쿠폰 아이디</label> 
					<input type="text" class="form-control" id="coupon_id" name="coupon_id" value=${cvo.coupon_id } disabled="disabled">
				</div>
				<div class="form-group">
					<label for="coupon_name">쿠폰 명</label> 
					<input type="text" class="form-control" id="coupon_name" name="coupon_name" value=${cvo.coupon_name }>
				</div>
				<div class="form-group">
					<label for="coupon_disc_rate">할인율</label> 
					<input type="text" class="form-control" id="coupon_disc_rate" name="coupon_disc_rate" value=${cvo.coupon_disc_rate }>
				</div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">수정하기</button>
				<button type="button" class="btn btn-success">돌아가기</button>
			</div>
		</form>
	</div>
</section>
<!-- 제이쿼리 -->
	 <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	// 1)  목록으로
	    	$(".btn-success").click(function(){
	    		history.back(); 
	    	});	    	
	    	
	    });	    
</script>
<%@ include file="footer.jsp"%>