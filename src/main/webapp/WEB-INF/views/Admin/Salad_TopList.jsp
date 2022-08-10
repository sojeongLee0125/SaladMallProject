<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>
 
<h1 style="text-align: center; padding-top: 30px;">주간 샐러드 판매량 TOP10</h1>

<section class="content" style="padding-top: 50px; padding-bottom: 130px;">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">샐러드 판매량 탑텐 레시피 목록</h3>
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
												aria-label="Rendering engine: activate to sort column descending">레시피번호</th>
											<th class="sorting_asc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1" aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending">레시피조합</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">레시피이름</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">레시피내용</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피 작성 날짜
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">좋아요 갯수
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피 가격
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">주간 판매량
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">총 판매량
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="srvo" items="${Salad_TopList }">
											<tr role="row" class="odd">
												<td>${srvo.rcp_num }</td>
												<td>${srvo.rcp_cmbnt }</td>
												<td>${srvo.rcp_name }</td>
												<td>${srvo.rcp_content }</td>
												<td>${srvo.rcp_date }</td>
												<td>${srvo.rcp_like }</td>
												<td>${srvo.rcp_price }</td>
												<td>${srvo.rcp_week_count }</td>
												<td>${srvo.rcp_total_count }</td>
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