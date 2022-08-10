<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


  <!-- 네이버 Talk Talk Banner Script start -->
  <script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
  <!-- Talk Talk Banner Script end -->
  
<%--   <%
	String id = (String)session.getAttribute("m_id");
	
	if(id.equals( "admin")) { 
		response.sendRedirect("${pageContext.request.contextPath }/Admin/main");
	}
  
  %> --%>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="${pageContext.request.contextPath}/resources/saladmall/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>MY PAGE</h2>
					<div class="breadcrumb__option">
						<a href="../index.html">MEMBER</a> <span>INFO</span>
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
			<h4>${mvo.m_id }님 환영합니다.</h4>

			<section class="contact spad">
				<!--마이페이지 템플릿 메뉴 적용  -->
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-6 text-center">
							<div class="contact__widget">
								<span class="fa fa-user"></span>
								<h4><a href="${pageContext.request.contextPath }/M_Main/memberInfo">회원정보 조회</a></h4>
								<p>Member-Information</p>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 text-center">
							<div class="contact__widget">
								<span class="icon_clipboard"></span>
								<h4><a href="${pageContext.request.contextPath }/M_Main/orderList">주문정보 조회</a></h4>
								<p>Order-Information</p>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 text-center">
							<div class="contact__widget">
								<span class="icon_clock_alt"></span>
								<h4><a href="${pageContext.request.contextPath }/CS/listAll">고객센터</a></h4>
								<p>Customer-Service</p>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 text-center">
							<div class="contact__widget">
								<span class="icon_mail_alt"></span>
								<h4>실시간 문의</h4>
								<div class="talk_banner_div" data-id="105383"></div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>
<!-- Checkout Section End -->

<%@ include file="../include/footer.jsp"%>
