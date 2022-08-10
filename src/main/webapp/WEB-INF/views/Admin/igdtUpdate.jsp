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
	
<h1 style="text-align: center; padding-top: 30px;">재료 재고 정보 수정</h1>
<c:set value="${ivo.igdt_category }" var="category"/>

<section style="padding: 30px 400px 30px 400px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">샐러드 재료 재고 정보</h3>
		</div>
		<form action="" method="post" name="fr">
			<div class="box-body">
				<div class="form-group">
					<label for="order_num">재료 번호</label> 
					<input type="text" class="form-control" id="igdt_num" name="igdt_num"  value=${ivo.igdt_num } disabled="disabled">
				</div>
				<div class="form-group">
					<label for="m_id">재료 카테고리</label>
					<select name="igdt_category" class="form-control">
						<option value="1" <%=pageContext.getAttribute("category").toString().equals("1")?" selected":""%>>야채</option>
						<option value="2" <%=pageContext.getAttribute("category").toString().equals("2")?" selected":""%>>고기</option>
						<option value="3" <%=pageContext.getAttribute("category").toString().equals("3")?" selected":""%>>해산물</option>
						<option value="4" <%=pageContext.getAttribute("category").toString().equals("4")?" selected":""%>>소스</option>
						<option value="5"<%=pageContext.getAttribute("category").toString().equals("5")?" selected":""%>>기타</option>
					</select> 
				</div>
				<div class="form-group">
					<label for="rcp_num">재료 이름</label> 
					<input type="text" class="form-control" id="igdt_name" name="igdt_name"  value=${ivo.igdt_name }>
				</div>
				<div class="form-group">
					<label for="coupon_id">재료 가격 </label> 
					<input type="text" class="form-control" id="igdt_price" name="igdt_price"  value=${ivo.igdt_price }>
					<input type="hidden" class="form-control" id="igdt_main_img" name="igdt_main_img"  value=${ivo.igdt_main_img }>
					<input type="hidden" class="form-control" id="igdt_sub_img" name="igdt_sub_img"  value=${ivo.igdt_sub_img }>
				</div>
				<div class="form-group">
					<label for="order_name">원산지</label> 
					<input type="text" class="form-control" id="igdt_country" name="igdt_country"  value=${ivo.igdt_country }>
				</div>
				<div class="form-group">
					<label for="order_date">재료 정보</label> 
					<input type="text" class="form-control" id="igdt_info" name="igdt_info"  value=${ivo.igdt_info }>
				</div>
				<div class="form-group">
					<label for="order_receive_name">재고</label> 
					<input type="text" class="form-control" id="igdt_count" name="igdt_count"  value=${ivo.igdt_count }>
				</div>
				<div class="form-group">
					<label for="order_receive_phone">재료 태그</label> 
					<input type="text" class="form-control" id="igdt_tag" name="igdt_tag"  value=${ivo.igdt_tag }>
				</div>
				<div class="form-group">
					<label for="order_receive_zip">재료 크기</label> 
					<input type="text" class="form-control" id="igdt_size" name="igdt_size"  value=${ivo.igdt_size }>
				</div>
				<div class="box-footer">
				<button type="button" class="btn btn-primary" id="registerBtn">수정하기</button>
				<button type="button" class="btn btn-success">목록으로</button>
				</div>
			</div>
		</form>
	</div>
</section>
	 <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	// 목록으로
	    	$(".btn-success").click(function(){
	    		location.href = "./igdtListAll?pageNum=${pageNum }"; 
	    	});	    	
	    	
	    });	    
	 </script>
	 
	<script type="text/javascript">

	/* 재료수정 유효성 검사 */

	// 서브밋 이벤트 발생
	$('#registerBtn').click(function() {
		Submit();
	});

	// 서브밋 함수
	function Submit() {
		
		// 변수
		var igdt_name = $('#igdt_name').val();
		var igdt_price = $('#igdt_price').val();
		var igdt_country = $('#igdt_country').val();
		var igdt_info = $('#igdt_info').val();
		var igdt_count = $('#igdt_count').val();
		var igdt_tag = $('#igdt_tag').val();
		var igdt_size = $('#igdt_size').val();	
		
		if (igdt_name == ""){
			alert("재료 이름을 입력해주세요.");
			$("#igdt_name").focus();
			return false;
		}
		
		if (igdt_price == ""){
			alert("재료 가격을 입력해주세요.");
			$("#igdt_price").focus();
			return false;
		}
		
		// 재료 숫자 검증
		if (isNaN(igdt_price)){
			alert("재료 가격을 숫자로 입력해주세요.");
			$("#igdt_price").focus();
			return false;
		}
		
		if (igdt_country == ""){
			alert("재료 원산지를 입력해주세요.");
			$("#igdt_country").focus();
			return false;
		}
		
		if (igdt_info == ""){
			alert("재료 정보를 입력해주세요.");
			$("#igdt_info").focus();
			return false;
		}
		
		if (igdt_count == ""){
			alert("재료 재고를 입력해주세요.");
			$("#igdt_count").focus();
			return false;
		}
		
		// 재고 숫자 검증
		if (isNaN(igdt_count)){
			alert("재료 재고을 숫자로 입력해주세요.");
			$("#igdt_count").focus();
			return false;
		}
		
		if (igdt_tag == ""){
			alert("재료 태그를 입력해주세요.");
			$("#igdt_tag").focus();
			return false;
		}
		
		if (igdt_size == ""){
			alert("재료 크기를 선택해주세요.");
			$("#igdt_size").focus();
			return false;
		} else{
			document.fr.submit();
		} 
		
	} // 재료 등록 유효성 검사 끝

</script>
 <%@ include file="footer.jsp"%>