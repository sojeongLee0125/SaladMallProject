<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<style>
    th, td {
        text-align: center;
    }
</style>

<div class="col-xs-12" style="padding-top: 70px; ">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title"> 쿠폰 정보 출력 </h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body table-responsive">
            <table class="table table-hover table-bordered">
                <tbody>
                <tr>
                    <th>쿠폰 아이디</th>
                    <th>쿠폰 명</th>
                    <th>할인율</th>
                    <th>해당 회원 조회</th>
                    <th>수정하기</th>
                    <th>삭제하기</th>
                </tr>
                <tr>
                    <td>${cvo.coupon_id }</td>
                    <td>${cvo.coupon_name }</td>
                    <td>${cvo.coupon_disc_rate }</td>
                    <td>
                        <button type="button" class="btn btn-primary">발급 회원 목록</button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-success">수정하기</button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger">삭제하기</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
</div>
<div class="btn-group" role="group" style="text-align:center; padding: 0px 0px 560px 15px; "
     aria-label="Basic mixed styles example">
    <button type="button" class="btn btn-info">목록으로</button>
</div>

<!-- 제이쿼리 -->
<script type="text/javascript">

    $(document).ready(function () {

        // 1) 발급 회원 목록 조회
        $(".btn-primary").click(function () {
            location.href = "${pageContext.request.contextPath }/Admin/couponMList?coupon_id=${cvo.coupon_id }";
        });

        // 2) 수정하기
        $(".btn-success").click(function () {
            location.href = "${pageContext.request.contextPath }/Admin/couponUpdate?coupon_id=${cvo.coupon_id }&pageNum=${pageNum }";
        });

        // 2) 삭제하기
        $(".btn-danger").click(function () {
            location.href = "${pageContext.request.contextPath }/Admin/couponDelete?coupon_id=${cvo.coupon_id }&pageNum=${pageNum }";
        });

        // 3) 목록으로
        $(".btn-info").click(function () {
            location.href = "${pageContext.request.contextPath }/Admin/couponListAll?pageNum=${pageNum }";
        });
    });
</script>

<%@ include file="footer.jsp" %>
</body>
</html>