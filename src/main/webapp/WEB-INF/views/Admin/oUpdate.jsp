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
	
<h1 style="text-align: center; padding-top: 30px;">주문 정보 수정</h1>

<section style="padding: 30px 400px 30px 400px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">주문정보</h3>
		</div>
		<form action="" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="order_num">주문번호</label> 
					<input type="text" class="form-control" id="order_num" name="order_num"  value=${ovo.order_num } disabled="disabled">
				</div>
				<div class="form-group">
					<label for="m_id">회원 아이디</label> 
					<input type="text" class="form-control" id="m_id" name="m_id"  value=${ovo.m_id }>
				</div>
				<div class="form-group">
					<label for="rcp_num">레시피 번호 </label> 
					<input type="text" class="form-control" id="rcp_num" name="rcp_num"  value=${ovo.rcp_num }>
				</div>
				<div class="form-group">
					<label for="coupon_id">적용 쿠폰 아이디 </label> 
					<input type="text"  readonly="readonly" class="form-control" id="coupon_id" name="coupon_id"  value=${ovo.coupon_id }>
				</div>
				<div class="form-group">
					<label for="order_pay_num">결제번호</label> 
					<input type="text" class="form-control" id="order_pay_num" name="order_pay_num"  value=${ovo.order_pay_num }>
				</div>
				<div class="form-group">
					<label for="rcp_name">레시피 이름</label> 
					<input type="text" class="form-control" id="rcp_name" name="rcp_name"  value=${ovo.rcp_name }>
				</div>
				<div class="form-group">
					<label for="order_name">주문자 이름</label> 
					<input type="text" class="form-control" id="order_name" name="order_name"  value=${ovo.order_name }>
				</div>
				<div class="form-group">
					<label for="order_date">주문날짜</label> 
					<input type="text" class="form-control" id="order_date" name="order_date"  value=${ovo.order_date } disabled="disabled">
				</div>
				<div class="form-group">
					<label for="order_receive_name">수취인 이름</label> 
					<input type="text" class="form-control" id="order_receive_name" name="order_receive_name"  value=${ovo.order_receive_name }>
				</div>
				<div class="form-group">
					<label for="order_receive_phone">수취인 전화번호</label> 
					<input type="text" class="form-control" id="order_receive_phone" name="order_receive_phone"  value=${ovo.order_receive_phone }>
				</div>
				<div class="form-group">
					<label for="order_receive_zip">수취인 우편번호</label> 
					<input type="text" class="form-control" id="order_receive_zip" name="order_receive_zip"  value=${ovo.order_receive_zip }>
				</div>
				<div class="form-group">
					<label for="order_receive_addr1">수취인 주소</label> 
					<input type="text" class="form-control" id="order_receive_addr1" name="order_receive_addr1"  value=${ovo.order_receive_addr1 }>
				</div>
				<div class="form-group">
					<label for="order_receive_addr2">수취인 상세주소</label> 
					<input type="text" class="form-control" id="order_receive_addr2" name="order_receive_addr2"  value=${ovo.order_receive_addr2 }>
				</div>
				<div class="form-group">
					<label for="order_type">거래 방법</label> 
					<input type="text" class="form-control" id="order_type" name="order_type"  value=${ovo.order_type }>
				</div>
				<div class="form-group">
					<label for="order_amount">주문 수량</label> 
					<input type="text" class="form-control" id="order_amount" name="order_amount"  value=${ovo.order_amount }>
				</div>
				<div class="form-group">
					<label for="order_ship_price">배송비</label> 
					<input type="text" class="form-control" id="order_ship_price" name="order_ship_price"  value=${ovo.order_ship_price }>
				</div>
				<div class="form-group">
					<label for="order_total_price">결제 금액</label> 
					<input type="text" class="form-control" id="order_total_price" name="order_total_price"  value=${ovo.order_total_price }>
				</div>
				<div class="form-group">
					<label for="order_status">주문 상태</label> 
					<input type="text" class="form-control" id="order_status" name="order_status"  value=${ovo.order_status }>
				</div>
				<div class="box-footer">
				<button type="submit" class="btn btn-primary">수정하기</button>
				<button type="button" class="btn btn-success">돌아가기</button>
				</div>
			</div>
		</form>
	</div>
</section>
<!-- 제이쿼리 -->
	 <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	// 돌아가기
	    	$(".btn-success").click(function(){
	    		history.back(); 
	    	});	    	
	    	
	    });	    
</script>
 <%@ include file="footer.jsp"%>