<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="lockscreen-wrapper" style="padding-bottom: 350px;">
	<div class="lockscreen-logo">
		<b>등록 성공</b>
	</div>
	<!-- User name -->
	<div class="lockscreen-name">Chunsik</div>
	<!-- START LOCK SCREEN ITEM -->
	<div class="lockscreen-item">
		<!-- lockscreen image -->
		<div class="lockscreen-image">
			<img src="${pageContext.request.contextPath }/resources/admin/dist/img/CS_good.png" alt="User Image">
		</div>
		<!-- lockscreen credentials (contains the form) -->
		<form class="lockscreen-credentials">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="성공적으로 등록완료." disabled="disabled">
			</div>
		</form>
		<!-- /.lockscreen credentials -->
	</div>
	<!-- /.lockscreen-item -->
	<div class="help-block text-center"> Register Success </div>
	<div class="text-center">
		<a href="${pageContext.request.contextPath }/main"> Return to Admin Main</a>
	</div>
	<div class="lockscreen-footer text-center">
		Copyright © 2021-2021 <b class="text-black">TeamSalad</b><br> All rights reserved
	</div>
</div>

<!--자바 스크립트 제어  -->
<script type="text/javascript">
	
	opener.document.location.href="${pageContext.request.contextPath }/Admin/couponListAll"

	self.close();

</script>


<%@ include file="footer.jsp"%>