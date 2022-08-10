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
						<a href="./index.html">주문정보</a> <span>상세페이지</span>
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
			<h4>${mvo.m_id }님 주문번호 ${ovo.order_num}번 상세페이지</h4>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>주문번호</p>
						<input type="text" value="${ovo.order_num }" readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>결제번호</p>
						<input type="text" value="${ovo.order_pay_num }"
							readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>아이디</p>
						<input type="text" value="${ovo.m_id }" readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>레시피 이름</p>
						<input type="text" value="${ovo.rcp_name }" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>주문수량</p>
						<input type="text" value="${ovo.order_amount }"
							readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>거래 방법</p>
						<input type="text" value="${ovo.order_type }" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>배송비</p>
						<input type="text" value="${ovo.order_ship_price }"
							readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>결제가격</p>
						<input type="text" value="${ovo.order_total_price }"
							readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>주문자</p>
						<input type="text" value="${ovo.order_name }" readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>주문날짜</p>
						<input type="text" value="${ovo.order_date }" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>수취인</p>
						<input type="text" value="${ovo.order_receive_name }"
							readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>수취인 전화번호</p>
						<input type="text" value="${ovo.order_receive_phone }"
							readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>수취인 우편번호</p>
						<input type="text" value="${ovo.order_receive_zip }"
							readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>수취인 주소</p>
						<input type="text" value="${ovo.order_receive_addr1 }"
							readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="common__input">
						<p>수취인 상세주소</p>
						<input type="text" value="${ovo.order_receive_addr2 }"
							readonly="readonly">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="common__input">
						<p>주문 상태</p>
						<c:choose>
							<c:when test="${ovo.order_status == 0}">
								<input type="text" value="결제대기중" readonly="readonly">
							</c:when>
							<c:when test="${ovo.order_status == 1}">
								<input type="text" value="결제완료" readonly="readonly">
							</c:when>
							<c:when test="${ovo.order_status == 2}">
								<input type="text" value="배송중" readonly="readonly">
							</c:when>
							<c:when test="${ovo.order_status == 3}">
								<input type="text" value="배송완료" readonly="readonly">
							</c:when>
							<c:when test="${ovo.order_status == 4}">
								<input type="text" value="구매확정" readonly="readonly">
							</c:when>
							<c:when test="${ovo.order_status == 5}">
								<input type="text" value="거래완료" readonly="readonly">
							</c:when>
							<c:otherwise>
								<input type="text" value="확인불가" readonly="readonly">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<button type="button" id="BtnList" class="site-btn_green">주문 전체 목록</button>
			<c:if test="${ovo.order_status == 0 || ovo.order_status == 1}">
				<button type="button" id="BtnDelete" class="site-btn_gray">주문 취소</button>
			</c:if>
		</div>

	</div>
</section>
<!-- Checkout Section End -->


<!-- 자바스크립트 영역 -->

<script type="text/javascript">
	$(document).ready(function() {

		// 버튼 제어
		// 마이페이지
		$("#BtnList").click(function() {
			location.href = "./orderList";
		});

		// 삭제하기
		$("#BtnDelete").click(function() {
			location.href = "./orderDelete?order_num=${ovo.order_num}";
		});

	});
</script>



<%@ include file="../include/footer.jsp"%>
