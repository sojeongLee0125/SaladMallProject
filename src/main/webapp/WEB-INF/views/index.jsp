<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>

    
	<!-- visual s -->
	<section class="visual">
		<div class="inner">
			<div class="tit fade-in">
				<img src="${pageContext.request.contextPath }/resources/saladmall/img/visual_title.png" alt="" />
			</div>
			
			<div class="v1 fade-in">
				<img src="${pageContext.request.contextPath }/resources/saladmall/img/visual_1.png" alt="그림자" />
			</div>
			
			<div class="v2 fade-in">
				<img src="${pageContext.request.contextPath }/resources/saladmall/img/visual_2.gif" alt="샐러드 사진" />
			</div>

			<div class="v3 fade-in">
				<a href="${pageContext.request.contextPath }/R_Custom/main" class="primary-btn fade-in">SHOP NOW</a>
			</div>

		</div>
		
	</section>
	<!-- visual e -->
	
	<script type="text/javascript">
	var fadeEls = document.querySelectorAll('.visual .fade-in');
	fadeEls.forEach(function (fadeEl, index) {
	  gsap.to(fadeEl, 1, {
	    delay: (index + 1) * .4,
	    opacity: 1
	  });
	});
</script>
   
<%@ include file="./include/footer.jsp" %>   