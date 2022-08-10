<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>
   
   <div class="col-xs-12" style="padding-top: 70px;">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"> 주문 정보 출력 </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table class="table table-hover table-bordered">
                <tbody><tr>
                  <th>주문번호</th>
                  <th>회원아이디</th>
                  <th>레시피번호</th>
                  <th>쿠폰명</th>
                  <th>결제번호</th>
                  <th>레시피이름</th>
                  <th>주문자이름</th>
                  <th>주문날짜</th>
                  <th>수취인 이름</th>
                </tr>
		<tr>
		<td>${ovo.order_num }</td>
		<td>${ovo.m_id }</td>
		<td>${ovo.rcp_num }</td>
		<c:if test="${cvo.coupon_name != null}">
		<td>${cvo.coupon_name }</td>
		</c:if>
		<c:if test="${cvo.coupon_name == null}">
		<td>해당 주문에 적용된 쿠폰이 없습니다.</td>
		</c:if>
		<td>${ovo.order_pay_num }</td>
		<td>${ovo.rcp_name }</td>
		<td>${ovo.order_name }</td>
		<td>${ovo.order_date }</td>
		<td>${ovo.order_receive_name }</td>
		</tr>
		<tr>
		  <th>수취인 전화번호</th>
                  <th>수취인 우편번호</th>
                  <th>수취인 주소</th>
                  <th>수취인 상세주소</th>
                  <th>거래방법</th>
                  <th>주문 수량</th>
                  <th>배송비</th>
                  <th>결제 금액</th>
                  <th>주문 상태</th>
                </tr>
		<tr>	
		<td>${ovo.order_receive_phone }</td>
		<td>${ovo.order_receive_zip }</td>
		<td>${ovo.order_receive_addr1 }</td>
		<td>${ovo.order_receive_addr2 }</td>
		<td>${ovo.order_type }</td>
		<td>${ovo.order_amount }</td>
		<td>${ovo.order_ship_price }</td>
		<td>${ovo.order_total_price }</td>
		<c:choose>
			<c:when test="${ovo.order_status == 0}">
					<td><span class="label label-primary">결제 대기중</span></td>
			</c:when>
			<c:when test="${ovo.order_status == 1}">
					<td><span class="label label-success">결제 완료</span></td>
			</c:when>
			<c:when test="${ovo.order_status == 2}">
					<td><span class="label label-warning">배송중</span></td>
			</c:when>
			<c:when test="${ovo.order_status == 3}">
					<td><span class="label label-primary">배송 완료</span></td>
			</c:when>
			<c:when test="${ovo.order_status == 4}">
					<td><span class="label label-danger">구매 확정</span></td>
			</c:when>
			<c:when test="${ovo.order_status == 5}">
					<td><span class="label label-success">거래 완료</span></td>
			</c:when>
			<c:otherwise>
					<td><span class="label label-danger">확인 불가</span></td>
			</c:otherwise>
		</c:choose>      						
		</tr> 		  		
              </tbody>
             </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
	<div class="btn-group" role="group" style="text-align:center; padding: 0px 0px 560px 15px; " aria-label="Basic mixed styles example">
		<button type="button" class="btn btn-primary">수정하기</button>
		<button type="button" class="btn btn-danger">삭제하기</button>
		<button type="button" class="btn btn-success">목록으로</button>
    	</div>
	    
<!-- 제이쿼리 -->
 <script type="text/javascript">
    $(document).ready(function(){

	// 1) 수정하기 버튼 제어
	$(".btn-primary").click(function(){
		location.href="${pageContext.request.contextPath }/oUpdate?order_num=${ovo.order_num}";   

	});

	// 2) 삭제하기
	$(".btn-danger").click(function(){	    		
		location.href="${pageContext.request.contextPath }/oDelete?order_num=${ovo.order_num}";
	});	    	

	// 3) 목록으로
	$(".btn-success").click(function(){
		location.href = "./oListAll?pageNum=${pageNum }"; 
	});	    	

    });	    
 </script>
   
 <%@ include file="footer.jsp"%>
   
</body>
</html>
