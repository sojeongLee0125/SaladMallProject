<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>
<c:set var="filePath" value="${pageContext.request.contextPath }/resources/upload/"/>

<!DOCTYPE html>
	<%@ include file="../include/header.jsp" %> 

    <!-- Blog Details Hero Begin -->
    <section class="blog-details-hero set-bg" data-setbg="${path}img/blog/details/details-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>${board.board.rcp_b_title }</h2>
                        <ul>
                            <li>${board.member.m_name }</li>
                            <li><fmt:formatDate value="${board.board.rcp_b_date }" pattern="yyyy년 MM월 dd일"/> </li>
                            <li>${fn:length(comments) } Comments</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
               	<%@ include file="../include/side.jsp" %>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                    	<c:if test="${not empty board.board.rcp_b_img1 }">
                    		<img src="${filePath}${board.board.rcp_b_img1}" alt="" height="631" width="750">
                    	</c:if>
                    	<c:if test="${not empty board.board.rcp_b_img2 }">
                    		<img src="${filePath}${board.board.rcp_b_img2}" alt="" height="631" width="750">
                    	</c:if>
                    	<c:if test="${not empty board.board.rcp_b_img3 }">
                    		<img src="${filePath}${board.board.rcp_b_img3}" alt="" height="631" width="750">
                    	</c:if>
<%-- 					<img src="${path}img/blog/details/details-pic.jpg" alt=""> --%>
                        
                        <p>${board.board.rcp_b_content }</p>
                        <h3>${board.recipe.rcp_cmbnt }</h3>
                    </div>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__text">
                                        <h6>${board.member.m_name }</h6>
                                        <span>${board.member.m_email }</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="blog__details__widget">
                                    <ul>
                                        <li><span>Categories:</span> Food</li>
                                        <li><span>Tags:</span> All, Trending, Cooking, Healthy Food, Life Style</li>
                                    </ul>
                                    <div class="blog__details__social">
<%--                                     ${board.like }로 좋아요 한지 안한지 true, false로 체크 가능 이걸로 색깔 지정해야함 --%>
                                        <a href="./likeCheck?rcp_b_num=${board.board.rcp_b_num }"><i class="fa fa-heart"></i></a>
                                        <input id="likeCheck" type="hidden" value="${like }">
                                    </div>
                                    <div class="checkout__input__radio" id="controll_btn">
                                    	<input class="site-btn" type="button" value="수정하기" onclick="location.href='./boardModify?rcp_b_num=${board.board.rcp_b_num}'">
                                    	<input class="site-btn" type="button" value="삭제하기" onclick="location.href='../R_Board/boardDelete?rcp_b_num=${board.board.rcp_b_num}'">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

   

    <%@ include file="../include/footer.jsp" %>

	<script type="text/javascript">
		$(document).ready(function(){
			var login_id = '<%=(String)session.getAttribute("m_id")%>';
			var board_id = "<c:out value='${board.member.m_id}'/>";
			
			$("#searchText").keyup(function(){
				if($("#searchText").val() == ""){
					$("#autoText").empty();
				}
				else{
					$("#autoText").empty();
					$.getJSON('searchData', {searchData:$("#searchText").val()}, function(data){
						$.each(data, function(index, title){
							console.log(index);
							$("#autoText").append('<li><a href="../R_Board/board_detail?rcp_b_num=' + title.rcp_b_num + '">'+title.rcp_b_title+'</a></li>');
						});
					});
				}
			});
			
			if(login_id != board_id){
				$("#controll_btn").css("display", "none");
			}
			
			console.log($('#likeCheck').val());
			
			if($('#likeCheck').val() == 'true'){
				$(".blog__details__social a").css("color", "#7fad39");
				$(".blog__details__social a").hover(function(){
					$(this).css("color", "#6f6f6f");
					console.log("hover");
				}, function(){
					$(this).css("color", "#7fad39");
					console.log("hover out");
				});
			}
			
		});
	</script>

</body>

</html>