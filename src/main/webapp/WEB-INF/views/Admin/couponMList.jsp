<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>

<h1 style="text-align: center; padding-top: 30px;">발급된 회원 전체 목록 조회</h1>

<section class="content" style="padding-top: 50px; padding-bottom: 130px;">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">해당 쿠폰 발급 목록</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example2_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-12"></div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<table id="example2"
									class="table table-bordered table-hover dataTable" role="grid"
									aria-describedby="example2_info">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1" aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending">회원 ID</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">회원명</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">회원등급</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cmvo" items="${couponMList }">
											<tr role="row" class="odd">
												<td class="sorting_1"><a href="${pageContext.request.contextPath }/Admin/mInfo?m_id=${cmvo.m_id }&pageNum=1">${cmvo.m_id }</a></td>
												<td>${cmvo.m_name }</td>
												<c:choose>
					    							<c:when test="${cmvo.m_grade == 1}">
					        							<td><span class="label label-success">Silver</span></td>
					   					 			</c:when>
					   					 			<c:when test="${cmvo.m_grade == 2}">
					        							<td><span class="label label-warning">Gold</span></td>
					   					 			</c:when>
					   					 			<c:when test="${cmvo.m_grade == 3}">
					        							<td><span class="label label-primary">VIP</span></td>
					   					 			</c:when>
					   					 			<c:when test="${cmvo.m_grade == 4}">
					        							<td><span class="label label-danger">VVIP</span></td>
					   					 			</c:when>
												</c:choose>   	
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<div class="btn-group" role="group" style="text-align:center; padding: 0px 0px 350px 15px;" aria-label="Basic mixed styles example">
			<button type="button" class="btn btn-success">돌아가기</button>
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