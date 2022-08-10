<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<script type="text/javascript">
	</script>
	<h1>장바구니 담기</h1>
	
	<form role="form" action="" method="post">
		<input type="hidden" name="m_id" value="${m_id }">
		<input type="hidden" name="rcp_cmbnt" value="${rcp_cmbnt }">
		<input type="submit">
	</form>
	
	<script>
		$(document).ready(function() {
			// 폼태그 정보 가져오기
			var fr1 = $("form[role='form']");
			fr1.submit();
		});
	</script>

<%@ include file="../include/footer.jsp" %>