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
	
<h1 style="text-align: center; padding-top: 30px;">샐러드 재료 등록</h1>

<section style="padding: 30px 400px 30px 400px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">재료 정보</h3>
		</div>
		<form action="" method="post" id="igdtRegisterForm" name="igdtRegisterForm">
			<div class="box-body">
				<div class="form-group">
					<label for="igdt_category">재료 카테고리</label>
					<select class="form-control" name="igdt_category" id="igdt_category" >
					 	<option selected value="0">=== 선택 ===</option>
						<option value="1">야채</option>
						<option value="2">고기</option>
						<option value="3">해산물</option>
						<option value="4">소스</option>
						<option value="5">기타</option>
					</select> 
				</div>
				<div class="form-group">
					<label for="igdt_name">재료 이름</label> 
					<input type="text" class="form-control" id="igdt_name" name="igdt_name">
				</div>
				<div class="form-group">
					<label for="igdt_price">재료 가격</label> 
					<input type="text" class="form-control" id="igdt_price" name="igdt_price" >
				</div>
				<div class="form-group">
				  <label for="igdt_main_img">대표사진</label>
				  <input type="file" id="igdt_main_img" name="igdt_main_img">
				  <p class="help-block">재료 대표 이미지를 등록해주세요.</p>
				</div>
				<div class="form-group">
				  <label for="igdt_sub_img">보조이미지</label>
				  <input type="file" id="igdt_sub_img" name="igdt_sub_img">
				  <p class="help-block">재료 보조 이미지를 등록해주세요.</p>
				</div>
				<div class="form-group">
					<label for="igdt_country">원산지</label> 
					<input type="text" class="form-control" id="igdt_country" name="igdt_country" >
				</div>
				<div class="form-group">
					<label for="igdt_info">재료 정보</label> 
					<input type="text" class="form-control" id="igdt_info" name="igdt_info">
				</div>
				<div class="form-group">
					<label for="igdt_count">재고</label> 
					<input type="text" class="form-control" id="igdt_count" name="igdt_count" >
				</div>
				<div class="form-group">
					<label for="igdt_tag">재료 태그</label> 
					<input type="text" class="form-control" id="igdt_tag" name="igdt_tag" >
				</div>
				<div class="form-group">
					<label for="igdt_size">재료 크기</label> 
					<input type="text" class="form-control" id="igdt_size" name="igdt_size" >
				</div>
				<div class="box-footer">
				<button type="button" class="btn btn-primary" id="registerBtn">등록하기</button>
				<button type="button" class="btn btn-primary" onclick="location.href='./igdtListAll';">목록으로</button>
				</div>
			</div>
		</form>
	</div>
</section>

<script type="text/javascript">
	
	/* 메인 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		let formData = new FormData();
		let fileInput1 = $("input[name='igdt_main_img']");
		let fileList1 = fileInput1[0].files;
		let fileObj1 = fileList1[0];
		
		if(!fileCheck(fileObj1.name, fileObj1.size)){	
			return false;
		}		

		formData.append("igdt_main_img", fileObj1);
		
		$.ajax({
			url: '/Admin/igdtImgRegister',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json'
		});	
	});
	
	/* 보조 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		let formData = new FormData();
		let fileInput2 = $("input[name='igdt_sub_img']");
		let fileList2 = fileInput2[0].files;
		let fileObj2 = fileList2[0];
		
		if(!fileCheck(fileObj2.name, fileObj2.size)){	
			return false;
		}		

		formData.append("igdt_main_img", fileObj2);
		
		$.ajax({
			url: '/Admin/igdtImgRegister',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json'
		});	
				
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 5048576; //50MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}		
		return true;		
	}
	
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
		var igdt_category = $('#igdt_category').val();
		var igdt_name = $('#igdt_name').val();
		var igdt_price = $('#igdt_price').val();
		var igdt_country = $('#igdt_country').val();
		var igdt_info = $('#igdt_info').val();
		var igdt_count = $('#igdt_count').val();
		var igdt_tag = $('#igdt_tag').val();
		var igdt_size = $('#igdt_size').val();	
		
		//이미지
		var igdt_main_img = $('#igdt_main_img').val();
		var igdt_sub_img = $('#igdt_sub_img').val();
		
		if (igdt_category == "0"){
			alert("재료 카테고리를 선택해주세요.");
			$("#igdt_category").focus();
			return false;
		}
		
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
		
		if (igdt_main_img == ""){
			alert("재료 메인 사진을 입력해주세요.");
			$("#igdt_main_img").focus();
			return false;
		}
		
		if (igdt_sub_img == ""){
			alert("재료 보조 사진을 입력해주세요.");
			$("#igdt_sub_img").focus();
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
			document.igdtRegisterForm.submit();
		} 
		
	} // 재료 등록 유효성 검사 끝

</script>
 <%@ include file="footer.jsp"%>
