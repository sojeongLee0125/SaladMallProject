<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="header.jsp"%>
 
 <style>

th, td {
text-align: center;
}
</style>
 
<h1 style="text-align: center; padding-top: 30px;">회원 정보 수정</h1>

<section style="padding: 30px 400px 30px 400px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">회원정보</h3>
		</div>
		<form role="form" action="" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="m_id">아이디</label> 
					<input type="text" class="form-control" id="m_id" name="m_id" value=${mvo.m_id } disabled="disabled">
				</div>
				<div class="form-group">
					<label for="m_pw">비밀번호</label> 
					<input type="text" class="form-control" id="m_pw" name="m_pw" value=${mvo.m_pw }>
				</div>
				<div class="form-group">
					<label for="m_name">이름</label> 
					<input type="text" class="form-control" id="m_name" name="m_name" value=${mvo.m_name }>
				</div>
				<div class="form-group">
					<label for="m_email">이메일</label> 
					<input type="text" class="form-control" id="m_email" name="m_email" value=${mvo.m_email }>
				</div>
				<div class="form-group">
					<label for="m_zip">우편번호</label> 
					<input type="text" class="form-control" id="m_zip" name="m_zip" value=${mvo.m_zip }>
				</div>
				<div class="form-group">
					<label for="m_addr1">주소</label> 
					<input type="text" class="form-control" id="m_addr1" name="m_addr1" value=${mvo.m_addr1 }>
				</div>
				<div class="form-group">
					<label for="m_addr2">상세주소</label> 
					<input type="text" class="form-control" id="m_addr2" name="m_addr2" value=${mvo.m_addr2 }>
				</div>
				<div class="form-group">
					<label for="m_phone">전화번호</label> 
					<input type="text" class="form-control" id="m_phone" name="m_phone" value=${mvo.m_phone }>
				</div>
				<div class="form-group">
					<label for="m_grade">회원등급</label> 
					<input type="text" class="form-control" id="m_grade" name="m_grade" value=${mvo.m_grade }>
				</div>
				<div class="form-group">
					<label for="m_totalAmount">누적구매액</label> 
					<input type="text" class="form-control" id="m_totalAmount" name="m_totalAmount" value=${mvo.m_totalAmount }>
				</div>
				<div class="form-group">
					<label for="m_attendance">출석일수</label> 
					<input type="text" class="form-control" id="m_attendance" name="m_attendance" value=${mvo.m_attendance }>
				</div>
				<div class="form-group">
					<label for="m_warning">경고횟수</label> 
					<input type="text" class="form-control" id="m_warning" name="m_warning" value=${mvo.m_warning }>
				</div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">수정하기</button>
				<button type="button" class="btn btn-success">뒤로가기</button>
			</div>
		</form>
	</div>
</section>

<!-- 제이쿼리 -->
	 <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	// 뒤로가기
	    	$(".btn-success").click(function(){
	    		history.back(); 
	    	});	    	
	    	
	    });	    
</script>
<%@ include file="footer.jsp"%>