<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	
	<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>
	
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${path}img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Order</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Order</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<br>
	
	<!-- 샐러드 커스텀 DB에서 지금 세션에 있는 id 있으면 삭제 -> 새로 만들기, 없으면 새로 만들기 -->
	<form role="form" action="" method="post">
		<button type="submit" class="btn1">새로운 샐러드 만들기</button>
	</form>


	<script>
		$(document).ready(function() {
			// 폼태그 정보 가져오기
			var fr1 = $("form[role='form']");
			fr1.submit();
		});
	</script>

<%@ include file="../include/footer.jsp" %>
