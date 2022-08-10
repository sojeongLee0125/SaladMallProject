<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
th, td {
text-align: center;
}
</style>
 
<h1 style="text-align: center; padding-top: 30px;">주간 인기 레시피 TOP10</h1>

<section class="content" style="padding-top: 50px; padding-bottom: 200px;">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">주간 레시피 게시판 좋아요 탑텐</h3>
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
												aria-label="Rendering engine: activate to sort column descending">글번호</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">글제목</th>
											<th class="sorting_asc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1" aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending">회원아이디</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">레시피번호</th>

											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피명
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="rbvo" items="${RBoard_TopList }">
											<tr role="row" class="odd">
												<td>${rbvo.rcp_b_num }</td>
												<td><a href="${pageContext.request.contextPath }/R_Board/board_detail?rcp_b_num=${rbvo.rcp_b_num }">${rbvo.rcp_b_title }</a></td>
												<td>${rbvo.m_id }</td>
												<td>${rbvo.rcp_num }</td>
												<td>${rbvo.rcp_b_like_count }</td>
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
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>

<%@ include file="footer.jsp"%>
