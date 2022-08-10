<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="../resources/saladmall/"/>

<%@ include file="../include/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<select id="selectCategory" >
		<option value="customer_board">고객센터</option>
		<option value="recipe_board" selected>레시피 게시판</option>
		<option value="review_board">리뷰</option>
		<option value="salad_ingredient">재료</option>
		<option value="salad_recipe">샐러드 레시피</option>
		<option value="tbl_member" >회원</option>
		<option value="tbl_order">주문</option>
	</select>
	<input id="searchText" type="text" placeholder="Search...">
   	<div>
       	<h4>Search By</h4>
       <%-- 	${path }js/jquery-3.3.1.min.js --%>
       	<ul id="autoText">
       	</ul>
   </div>
	
	<script src="${path}js/jquery-3.3.1.min.js"></script>
    <script src="${path}js/bootstrap.min.js"></script>
    <script src="${path}js/jquery.nice-select.min.js"></script>
    <script src="${path}js/jquery-ui.min.js"></script>
    <script src="${path}js/jquery.slicknav.js"></script>
    <script src="${path}js/mixitup.min.js"></script>
    <script src="${path}js/owl.carousel.min.js"></script>
    <script src="${path}js/main.js"></script>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			alert("시작");
			$("#searchText").keyup(function(){
				$("#autoText").empty();
				var selectOption = document.getElementById("selectCategory");
				selectOption = selectOption.options[selectOption.selectedIndex].value;
				$.getJSON('searchTotal/' + selectOption, {searchData:$("#searchText").val()}, function(data){
					$.each(data, function(index, title){
						console.log(index);
						$("#autoText").append('<li>'+title.address + '<br>' + title.title + '</li>');
					});
				});
			});
		});
	</script>
	
<%@ include file="../include/footer.jsp" %>