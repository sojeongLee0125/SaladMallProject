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
						<a href="./index.html">회원정보</a> <span>상세페이지</span>
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
			<h4>${mvo.m_id }님 회원정보</h4>
			<div class="common__input">
				<p>Name</p>
				<input type="text" value="${mvo.m_id }" readonly="readonly">
			</div>
			<div class="common__input">
				<p>E-mail</p>
				<input type="text" value="${mvo.m_email }" readonly="readonly">
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>우편번호</p>
						<input type="text" value="${mvo.m_zip }" readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>주소</p>
						<input type="text" value="${mvo.m_addr1 }" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="common__input">
				<p>상세주소</p>
				<input type="text" value="${mvo.m_addr2 }" readonly="readonly">
			</div>
			<div class="common__input">
				<p>전화번호</p>
				<input type="text" value="${mvo.m_phone }" readonly="readonly">
			</div>
			<div class="common__input">
				<p>가입일자</p>
				<input type="text" value="${mvo.m_regdate }" readonly="readonly">
			</div>
			<div class="common__input">
				<p>회원등급</p>
				<c:choose>
					<c:when test="${ mvo.m_grade == 1 }">
						<input type="text" value="Silver" readonly="readonly">
					</c:when>
					<c:when test="${ mvo.m_grade == 2 }">
						<input type="text" value="Gold" readonly="readonly">
					</c:when>
					<c:when test="${ mvo.m_grade == 3 }">
						<input type="text" value="VIP" readonly="readonly">
					</c:when>
					<c:when test="${ mvo.m_grade == 4 }">
						<input type="text" value="VVIP" readonly="readonly">
					</c:when>
					<c:otherwise>
						<input type="text" value="Basic" readonly="readonly">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="common__input">
				<p>쿠폰정보</p>
				<c:choose>
					<c:when test="${ mvo.m_coupon == null }">
						<input type="text" value="앗! 아직 쿠폰이 없어요ㅜ" readonly="readonly">
					</c:when>
					<c:otherwise>
						<input type="text" value="${ mvo.m_coupon}" readonly="readonly">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		
		<!-- button -->
		<div class="d-flex justify-content-center">
			<button type="button" id="BtnMypage" class="site-btn_green">마이페이지</button>
			<button type="button" id="BtnUpdate" class="site-btn_white">정보수정</button>
			<button type="button" id="BtnDelete" class="site-btn_gray">회원탈퇴</button>
		</div>
		
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
			location.href = "./memberUpdate";
		});
		
		// 삭제하기
		$("#BtnDelete").click(function() {
			location.href = "./memberDelete";
		});

	});
</script>



<%@ include file="../include/footer.jsp"%>
