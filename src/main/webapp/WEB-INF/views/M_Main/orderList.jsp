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
					<h2>Order-Information</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">주문정보</a> <span>조회페이지</span>
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
			<h4>${mvo.m_id }님</h4>
			<div class="product__discount">
				<div class="section-title product__discount__title">
					<h2>나의 주문 내역</h2>
				</div>
				<!-- 테이블  -->
				<div class="row">
					<div class="col-lg-12">
						<table class="table table-bordered table-hover dataTable">
							<thead>
								<tr role="row">
									<th class="sorting_asc" rowspan="1" colspan="1">주문번호</th>
									<th class="sorting_asc" rowspan="1" colspan="1">결제번호</th>
									<th class="sorting_asc" rowspan="1" colspan="1">결제방법</th>
									<th class="sorting_asc" rowspan="1" colspan="1">주문일자</th>
									<th class="sorting_asc" rowspan="1" colspan="1">주문수량</th>
									<th class="sorting_asc" rowspan="1" colspan="1">결제가격</th>
									<th class="sorting_asc" rowspan="1" colspan="1">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ovo" items="${orderList }">
									<tr role="row" class="odd">
										<td class="sorting_1"><a
											href="${pageContext.request.contextPath }/M_Main/orderInfo?order_num=${ovo.order_num }">${ovo.order_num }</a></td>
										<td>${ovo.order_pay_num }</td>
										<td>${ovo.order_type }</td>
										<td>${ovo.order_date }</td>
										<td>${ovo.order_amount }</td>
										<td>${ovo.order_total_price }</td>
										<c:choose>
											<c:when test="${ovo.order_status == 0}">
												<td><span class="label label-primary">결제 대기중</span></td>
											</c:when>
											<c:when test="${ovo.order_status == 1}">
												<td><span class="label label-success">결제 완료</span></td>
											</c:when>
											<c:when test="${ovo.order_status == 2}">
												<td><span class="label label-warning">배송중</span></td>
											</c:when>
											<c:when test="${ovo.order_status == 3}">
												<td><span class="label label-primary">배송 완료</span></td>
											</c:when>
											<c:when test="${ovo.order_status == 4}">
												<td><span class="label label-danger">구매 확정</span></td>
											</c:when>
											<c:when test="${ovo.order_status == 5}">
												<td><span class="label label-success">거래 완료</span></td>
											</c:when>
											<c:otherwise>
												<td><span class="label label-danger">확인 불가</span></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<button type="button" class="site-btn_green" id="BtnMypage">마이페이지</button>
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

	});
</script>
<%@ include file="../include/footer.jsp"%>