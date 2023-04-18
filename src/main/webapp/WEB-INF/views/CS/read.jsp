<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<style>

    li {
        list-style: none;
    }

</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
         data-setbg="${pageContext.request.contextPath}/resources/saladmall/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Customer-Service</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">고객센터</a> <span>게시판</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Main content -->
<section class="content">
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="contact__form__title">
                        <h2>고객센터 게시판</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <label>문의유형</label>
                        <c:choose>
                            <c:when test="${CS_vo.customer_b_type == 1}">
                                <input type="text" value="상품 관련 문의" readonly="readonly">
                            </c:when>
                            <c:when test="${CS_vo.customer_b_type == 2}">
                                <input type="text" value="주문 관련 문의" readonly="readonly">
                            </c:when>
                            <c:when test="${CS_vo.customer_b_type == 3}">
                                <input type="text" value="서비스 관련 문의" readonly="readonly">
                            </c:when>
                            <c:when test="${CS_vo.customer_b_type == 4}">
                                <input type="text" value="고객 의견" readonly="readonly">
                            </c:when>
                            <c:otherwise>
                                <input type="text" value="기타 문의" readonly="readonly">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <label>글쓴이</label>
                        <input type="text" value="${CS_vo.m_id }" readonly="readonly">
                        <input type="hidden" value="${m_id }" id="session_id">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <label>제목</label>
                        <input type="text" value="${CS_vo.customer_b_title }" readonly="readonly">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <label>날짜</label>
                        <input type="text" value="${CS_vo.customer_b_date }" readonly="readonly">
                    </div>
                    <div class="col-lg-12 text-center">
                        <label>문의내용</label>
                        <textarea readonly="readonly">${CS_vo.customer_b_content }</textarea>
                    </div>
                </div>
            </form>
            <!-- 게시글 버튼 제어 영역 ------------------------------------------------------------------------>
            <div class="d-flex justify-content-center">
                <!-- 본인 글에만 수정하기 삭제하기 활성화 -->
                <button type="button" class="site-btn_green" id="CSB_btn_list">목록으로</button>
                <c:if test="${m_id == CS_vo.m_id || m_id == 'admin' }">
                    <button type="button" class="site-btn_white" id="CSB_btn_modify">수정하기</button>
                    <button type="button" class="site-btn_gray" id="CSB_btn_delete">삭제하기</button>
                </c:if>
            </div>
        </div>
    </div>
    <!-- 댓글 작성 구역 ------------------------------------------------------------------------>
    <div class="col-sm-10" style="padding: 20px 60px 80px 350px;">
        <div class="card">
            <!-- 댓글 작성 구역 ------------------------------------------------------------------------>
            <div class="card-header with-border">
                <h5 class="card-title">댓글 작성</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="form-group col-sm-8">
                        <input class="form-control input-sm" id="new_reply_b_content" type="text" placeholder="댓글 입력">
                    </div>
                    <div class="form-group col-sm-2">
                        <input class="form-control input-sm" id="new_reply_m_id" type="text" value="${m_id }"
                               readonly="readonly">
                    </div>
                    <div class="form-group col-sm-2">
                        <button type="button" class="btn btn-primary btn-block btn-site" id="replyAddBtn">
                            <i class="fa fa-save"></i> 글쓰기
                        </button>
                    </div>
                </div>
            </div>
            <!-- 댓글 작성 구역 ------------------------------------------------------------------------>
            <!-- 댓글 목록 구역 ------------------------------------------------------------------------>
            <div class="card-footer">
                <ul id="replies"></ul>
            </div>
        </div>
    </div>
    <!-- 댓글 목록 구역 ------------------------------------------------------------------------>
    <!-- 댓글 수정 구역 ------------------------------------------------------------------------>
    <div class="modal fade" id="modifyModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title">댓글 수정창</h6>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="reply_b_num">댓글 번호</label>
                        <input class="form-control" id="reply_b_num" name="reply_b_num" readonly>
                    </div>
                    <div class="form-group">
                        <label for="reply_b_content">댓글 내용</label>
                        <input class="form-control" id="reply_b_content" name="reply_b_content"
                               placeholder="댓글 내용을 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="reply_m_id">댓글 작성자</label>
                        <input class="form-control" id="reply_m_id" name="reply_m_id" readonly>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-success modalModBtn">수정</button>
                    <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 댓글 수정 구역 ------------------------------------------------------------------------>
</section>
<!-- /.content -->

<form role="form" action="" method="post">
    <!-- 글 번호를 저장 -->
    <input type="hidden" name="customer_b_num"
           value="${CS_vo.customer_b_num }">
</form>

<!-- 자바스크립트 구문 -->

<script type="text/javascript">

    /* 게시글 버튼 제어 영역 */
    $(document).ready(function () {

        // form태그 정보 가져오기
        var fr = $("form[role='form']"); //id값 없이 속성값으로 접근

        // 1) 수정하기
        $("#CSB_btn_modify").click(function () {
            fr.attr("action", "${pageContext.request.contextPath }/CS/modify");
            fr.attr("method", "get");
            fr.submit();
        });

        // 2) 삭제하기
        $("#CSB_btn_delete").click(function () {
            var result = confirm('정말로 글을 삭제하시겠습니까?');
            if (result) {
                alert("글이 성공적으로 삭제되었습니다.");
                fr.attr("action", "${pageContext.request.contextPath }/CS/delete");
                fr.submit();
            } else {
                alert("글 삭제가 취소되었습니다.");
                return false;
            }

        });

        // 3) 목록으로
        $("#CSB_btn_list").click(function () {
            location.href = "${pageContext.request.contextPath }/CS/listAll?pageNum=${pageNum }";
        });
    });

    /*  댓글 제어 영역 */
    $(document).ready(function () {

        var reply_b_main_num = ${CS_vo.customer_b_num };

        getReplies();

        // 댓글 목록 출력 함수
        function getReplies() {

            $.getJSON("${pageContext.request.contextPath }/Reply/list/" + reply_b_main_num, function (data) {

                var str = "";

                $(data).each(function () {

                    str += "<li reply_b_num='" + this.reply_b_num + "'class='replyLi'>"
                        + "<b>글내용:</b>&nbsp&nbsp<p class='reply_b_content'>"
                        + this.reply_b_content
                        + "</p>"
                        + "<b>아이디:&nbsp&nbsp</b><p class='reply_m_id' id='reply_orgin_id'>"
                        + this.reply_m_id
                        + "</p>"
                        + "<button id='modalBtn' onclick='javascript:modifyCk();' type='button' class='site-btn_re' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                        + "</li>"
                        + "<hr/>";

                });

                $("#replies").html(str);

            });
        }

        $("#replyAddBtn").on("click", function () {

            var reply_b_content = $("#new_reply_b_content");
            var reply_m_id = $("#new_reply_m_id");
            var reply_b_contentVal = reply_b_content.val();
            var reply_m_idVal = reply_m_id.val();

            if (reply_m_idVal == "") {
                alert("로그인 후 이용해 주세요");
                return false;
            }

            // AJAX 통신 : POST
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath }/Reply/register",
                headers: {
                    "Content-type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: "text",
                data: JSON.stringify({
                    reply_b_main_num: reply_b_main_num,
                    reply_b_content: reply_b_contentVal,
                    reply_m_id: reply_m_idVal
                }),
                success: function (result) {

                    // 성공적인 댓글 등록 처리 알림
                    if (result == "registerSuccess") {
                        alert("댓글 등록 완료!");
                    }

                    // 댓글 목록 출력 함수 호출
                    getReplies();

                    // 댓글 내용 초기화
                    reply_b_content.val("");

                }
            });

        });

        $("#replies").on("click", ".replyLi button", function () {

            var reply = $(this).parent();

            var reply_b_num = reply.attr("reply_b_num");
            var reply_b_content = reply.find(".reply_b_content").text();
            var reply_m_id = reply.find(".reply_m_id").text();

            $("#reply_b_num").val(reply_b_num);
            $("#reply_b_content").val(reply_b_content);
            $("#reply_m_id").val(reply_m_id);
        });

        // 삭제하기
        $(".modalDelBtn").on("click", function () {

            // 댓글 번호
            var reply_b_num = $(this).parent().parent().find("#reply_b_num").val();

            var session_id = $('#session_id').val();
            var reply_id = $('#reply_m_id').val();

            if (session_id != reply_id && session_id !== "admin") {
                alert("본인 댓글만 삭제할 수 있습니다.");
                return false;
            }

            // AJAX통신 : DELETE

            $.ajax({
                type: "delete",
                url: "${pageContext.request.contextPath }/Reply/" + reply_b_num,
                headers: {
                    "Content-type": "application/json",
                    "X-HTTP-Method-Override": "DELETE"
                },
                dataType: "text",
                success: function (result) {

                    if (result == "deleteSuccess") {
                        alert("댓글 삭제 완료!");

                        $("#modifyModal").modal("hide");
                        // Modal 닫기

                        // 댓글 목록 출력 함수 호출
                        getReplies();
                    }

                }

            });

        });

        // 댓글 수정
        $(".modalModBtn").on("click", function () {

            var session_id = $('#session_id').val();
            var reply_id = $('#reply_m_id').val();

            if (session_id != reply_id && session_id !== "admin") {
                alert("본인 댓글만 수정할 수 있습니다.");
                return false;
            }

            // 댓글 선택자
            var reply = $(this).parent().parent();

            // 댓글번호
            var reply_b_num = reply.find("#reply_b_num").val();
            // 수정한 댓글내용
            var reply_b_content = reply.find("#reply_b_content").val();

            // AJAX통신 : PUT
            $.ajax({
                type: "put",
                url: "${pageContext.request.contextPath }/Reply/" + reply_b_num,
                headers: {
                    "Content-type": "application/json",
                    "X-HTTP-Method-Override": "PUT"
                },
                data: JSON.stringify({
                    reply_b_content: reply_b_content
                }),
                dataType: "text",
                success: function (result) {

                    if (result == "modifySuccess") {
                        alert("댓글 수정 완료!");

                        $("#modifyModal").modal("hide");
                        // Modal 닫기

                        // 댓글 목록 출력 함수 호출
                        getReplies();

                    }

                }

            });

        });

    });// 댓글제어영역
</script>
<%@ include file="../include/footer.jsp" %>
