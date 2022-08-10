<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>

   <div class="col-xs-12" style="padding-top: 70px;">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"> 샐러드 재료 상세 정보 </h3>
              <div class="box-tools">
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table class="table table-hover table-bordered">
                <tbody><tr>
                  <th>재료번호</th>
                  <th>재료 카테고리</th>
                  <th>재료이름</th>
                  <th>재료가격</th>
                  <th>대표사진</th>
                  <th>보조사진</th>
                  <th>원산지</th>
                  <th>재료정보</th>
                  <th>재고</th>
                  <th>재료태그</th>
                  <th>재료크기</th>
                </tr>
		<tr>
		<td>${ivo.igdt_num }</td>
			<c:choose>
				<c:when test="${ivo.igdt_category == 1}">
					<td>야채</td>
				</c:when>
				<c:when test="${ivo.igdt_category == 2}">
					<td>고기</td>
				</c:when><c:when test="${ivo.igdt_category == 3}">
					<td>해산물</td>
				</c:when>
				<c:when test="${ivo.igdt_category == 4}">
					<td>소스</td>
				</c:when>
				<c:otherwise>
					<td>기타</td>
				</c:otherwise>
			</c:choose>
		 <td>${ivo.igdt_name }</td>
		 <td>${ivo.igdt_price }</td>
		 <!-- 메인 이미지 파일  -->
		 <td><img style = "width: 70px; height: 35px;" src="${pageContext.request.contextPath}/resources/upload/${ivo.igdt_main_img}"/></td>
		 <!-- 보조 이미지 파일 -->
		 <td><img style = "width: 70px; height: 35px;" src="${pageContext.request.contextPath}/resources/upload/${ivo.igdt_sub_img}"/></td>
		 <td>${ivo.igdt_country }</td>
		 <td>${ivo.igdt_info }</td>
		 <td>${ivo.igdt_count }</td>
		 <td>${ivo.igdt_tag }</td>
		 <td>${ivo.igdt_size }</td>
		</tr> 		  		
	     </tbody>
	  </table>
         </div>
        <!-- /.box-body -->
        </div>
       <!-- /.box -->
       </div>
       <div class="btn-group" role="group" style="text-align:center; padding: 0px 0px 560px 15px;" aria-label="Basic mixed styles example">
	<button type="button" class="btn btn-primary">수정하기</button>
	<button type="button" class="btn btn-danger">삭제하기</button>
	<button type="button" class="btn btn-success">목록으로</button>
       </div>
	    
<!-- 제이쿼리 -->
 <script type="text/javascript">
    $(document).ready(function(){

	// 1) 수정하기
	$(".btn-primary").click(function(){
		location.href = "./igdtUpdate?igdt_num=${ivo.igdt_num}&pageNum=${pageNum }";   

	});

	// 2) 삭제하기
	$(".btn-danger").click(function(){	    		
		location.href="${pageContext.request.contextPath }/igdtDelete?igdt_num=${ivo.igdt_num}";
	});	    	

	// 3) 목록으로
	$(".btn-success").click(function(){
		location.href = "./igdtListAll?pageNum=${pageNum }"; 
	});	    	

    });	    
 </script>

 <%@ include file="footer.jsp"%>
