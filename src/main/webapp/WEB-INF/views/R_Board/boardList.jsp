<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>
<c:set var="filePath" value="${pageContext.request.contextPath }/resources/upload/"/>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %> 

   <!-- Breadcrumb Section Begin -->
   <section class="breadcrumb-section set-bg" data-setbg="${path}img/breadcrumb.jpg">
       <div class="container">
           <div class="row">
               <div class="col-lg-12 text-center">
                   <div class="breadcrumb__text">
                       <h2>Recipe_Board</h2>
                       <div class="breadcrumb__option">
                           <a>레시피 게시판</a>
                           <span>목록</span>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </section>
   <!-- Breadcrumb Section End -->

   <!-- Blog Section Begin -->
   <section class="blog spad">
       <div class="container">
           <div class="row">
               <%@ include file="../include/side.jsp" %>
               <div class="col-lg-8 col-md-7">
                   <div class="row">
                       <c:forEach var="page" items="${pages }">
                       	<div class="col-lg-6 col-md-6 col-sm-6" 
                       	onclick="location.href='./board_detail?rcp_b_num=${page.board.rcp_b_num}'">
                           <div class="blog__item">
                               <div class="blog__item__pic">
                                   <img src="${filePath}${page.board.rcp_b_thumbnail}" alt="">
                               </div>
                               <div class="blog__item__text">
                                   <ul>
                                       <li><i class="fa fa-calendar-o"></i> ${page.member.m_regdate }</li>
                                       <li><i class="fa fa-comment-o"></i> ${page.board.rcp_b_like_count }</li>
                                   </ul>
                                   <h5><a href="#">${page.board.rcp_b_title }</a></h5>
                                   <p>${page.board.rcp_b_content } </p>
                                   <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                               </div>
                           	</div>
                       	</div>
                       </c:forEach>
                       <div class="col-lg-12">
                           <div class="product__pagination blog__pagination">
                           		<c:if test="${pm.prev }">
									<a href="boardList?pageNum=${pm.startPage-1 }"> &laquo;</a>
								</c:if>
								<!-- 페이지 번호 -->
								<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
									<a href="boardList?pageNum=${idx }">${idx }</a>
								</c:forEach>
								<!-- 다음 -->
								<c:if test="${pm.next && pm.endPage > 0 }">
									<a href="boardList?pageNum=${pm.endPage + 1}"> &raquo;</a>
								</c:if>
                           	<button class="site-btn" id="board_write" style="float: right;">글 쓰기</button>
                               
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </section>
   <!-- Blog Section End -->

    <%@ include file="../include/footer.jsp" %>
    <script type="text/javascript">
    	$(document).ready(function() {
    		var id = '<%=(String)session.getAttribute("m_id")%>';
    		
    		if(id == "null"){
				$("#board_write").click(function () {
					alert("로그인 해주세요");
				});
			}else{
				$("#board_write").click(function () {
					location.href="../R_Board/regist";
				});
			}
    		
    		$("#searchText").keyup(function(){
				if($("#searchText").val() == ""){
					$("#autoText").empty();
				}
				else{
					$("#autoText").empty();
					$.getJSON('searchData', {searchData:$("#searchText").val()}, function(data){
						$.each(data, function(index, title){
							$("#autoText").append('<li><a href="../R_Board/board_detail?rcp_b_num=' + title.rcp_b_num + '">'+title.rcp_b_title+'</a></li>');
						});
					});
				}
			});
		});
    </script>