<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>

<h1 style="text-align: center; padding-top: 30px;">쿠폰 정보 조회</h1>

<section class="content" style="padding-top: 50px; padding-bottom: 50px;">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">발급된 쿠폰 총 ${pm.totalCount }개</h3>
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
												aria-label="Rendering engine: activate to sort column descending">쿠폰 ID</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">쿠폰명</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">할인율</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cvo" items="${couponListAll }">
											<tr role="row" class="odd">
												<td class="sorting_1">
												<a href="${pageContext.request.contextPath }/Admin/couponInfo?coupon_id=${cvo.coupon_id }&pageNum=${pm.cri.pageNum}">${cvo.coupon_id }</a></td>
												<td>${cvo.coupon_name }</td>
												<td>${cvo.coupon_disc_rate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="dataTables_info" id="example2_info" role="status"
									aria-live="polite">Showing ${pm.cri.pageNum } to ${pm.endPage }</div>
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
	<div class="btn-group" role="group"
		style="text-align: center; padding: 0px 0px 50px 0px;" aria-label="Basic mixed styles example">
		<button type="button" class="btn btn-info" name="couponRegister" id="couponRegister">신규 쿠폰 등록</button>
	</div>
	<div class="btn-group" role="group"
		style="text-align: center; padding: 0px 0px 50px 0px;" aria-label="Basic mixed styles example">
		<button type="button" class="btn btn-primary" name="memberCouponEnroll" id="memberCouponEnroll">회원 쿠폰 발급</button>
	</div>
</section>

<div class="text-center">
	<ul class="pagination">	
		<!-- 이전 -->
		<c:if test="${pm.prev }">
			<li><a href="${pageContext.request.contextPath }/Admin/couponListAll?pageNum=${pm.startPage-1 }"> &laquo;</a></li>
		</c:if>
		<!-- 페이지 번호 -->
		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
			<li <c:out value="${pm.cri.pageNum == idx? 'class = active ':''}"/>>
				<a href="${pageContext.request.contextPath }/Admin/couponListAll?pageNum=${idx }">${idx }</a>
			</li>
		</c:forEach>
		<!-- 다음 -->
		<c:if test="${pm.next && pm.endPage > 0 }">
			<li><a href="${pageContext.request.contextPath }/Admin/couponListAll?pageNum=${pm.endPage + 1}"> &raquo;</a></li>
		</c:if>
	</ul>
</div>

<script>

/* 쿠폰 등록 버튼 */
$('#couponRegister').on("click",function(e){
	
	e.preventDefault();
	
	let popUrl = "/Admin/couponRegister";
	let popOption = "width = 700px, height=700px, top=100px, left=700px, scrollbars=yes";
	
	window.open(popUrl,"쿠폰 등록",popOption);
	
});

/* 회원 쿠폰 발급 버튼 */
$('#memberCouponEnroll').on("click",function(e){
	
	e.preventDefault();
	
	let popUrl = "/Admin/memberCouponRegister";
	let popOption = "width = 700px, height=700px, top=100px, left=700px, scrollbars=yes";
	
	window.open(popUrl,"회원 쿠폰 발급",popOption);
	
});

</script>

<%@ include file="footer.jsp"%>