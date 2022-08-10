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
					<h2>Customer-Service</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">고객문의</a> <span>글 수정하기</span>
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
			<h4>글 수정하기 페이지</h4>
			<form action="" method="post" name="registerform">
			<div class="row">
				<div class="col-lg-6">
					<input type="hidden" name="customer_b_num" class="form-control" id="CS_Board6" value="${cvo.customer_b_num }">
					<div class="common__input">
						<p>문의유형</p>
						<select name="customer_b_type" >
							<option value="1">상품 관련 문의</option>
							<option value="2">주문 관련 문의</option>
							<option value="3">서비스 관련 문의</option>
							<option value="4">고객 의견</option>
							<option value="5">기타 문의</option>
						</select>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>주문번호</p>
						<c:choose>
							<c:when test="${m_orderList != null}">
								<select name="order_num" id="order_num">
								<option value="0">==주문번호를 선택해주세요==</option>
								<c:forEach var="ovo" items="${m_orderList }">
									<option value="${ovo.order_num }">${ovo.order_num }</option>
								</c:forEach>
								    <option value="99">주문 내역이 없습니다(선택)</option>
								</select>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="common__input">
				<p>ID</p>
				<input name="m_id" type="text" value="${m_id }" readonly="readonly">
			</div>
			<div class="common__input">
				<p>글제목</p>
				<input name="customer_b_title" value="${cvo.customer_b_title }" id="title" type="text">
			</div>
			<div class="common__input">
				<p>글내용</p>
				<textarea name="customer_b_content" id="content" rows="15" cols="155" name="customer_b_content" style="resize: none;">${cvo.customer_b_content }" </textarea>
			</div>
			</form>
		</div>	
		<div class="d-flex justify-content-center">
			<button type="button" class="site-btn_green" id="BtnList">목록으로</button>
			<button type="button" class="site-btn_white" id="BtnSubmit">수정하기</button>
			<button type="button" class="site-btn_gray" id="BtnDelete">삭제하기</button>
		</div>
	</div>
</section>
<!-- Checkout Section End -->

<!-- 자바스크립트 영역 -->

<script type="text/javascript">
	
	$(document).ready(function() {

		// 버튼 제어
		// 글쓰기 버튼
		$("#BtnSubmit").click(function() {
			submitCheck();
		});
		
		// 목록으로
		$("#BtnList").click(function() {
			location.href = "./listAll";
		});
		
		
		// 삭제하기
		$("#BtnDelete").click(function() {

			var result = confirm('정말로 글을 삭제하시겠습니까?');

			if (result) {
				location.href = "./delete?${cvo.customer_b_num }";
			} else {
				alert("글 삭제가 취소되었습니다.");
			}
		});

	});

	// 서브밋 함수
	function submitCheck() {

		// 주문번호 공백 확인 
		if ($("#order_num").val() == 0) {
			alert("주문번호를 선택해 주세요");
			$("#order_num").focus();
			return false;
		}

		// 제목 공백 확인 
		if ($("#title").val() == "") {
			alert("제목을 입력해 주세요");
			$("#title").focus();
			return false;
		}

		// 내용 공백 확인 
		if ($("#content").val() == "") {
			alert("내용을 입력해 주세요");
			$("#content").focus();
			return false;
		} else {
			alert("성공적으로 글이 수정되었습니다.")
			document.registerform.submit();
		}

	} // 글쓰기 검사 끝
</script>

<%@ include file="../include/footer.jsp"%>
