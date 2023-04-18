<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>


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

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="common__form">
            <h4>총 ${pm.totalCount }개의 글</h4>
            <div class="product__discount">
                <div class="section-title product__discount__title">
                    <h2>문의글 목록</h2>
                </div>
                <!-- 테이블  -->
                <div class="col-lg-12">
                    <table class="table table-bordered table-hover dataTable">
                        <thead>
                        <tr role="row">
                            <th class="sorting_asc" rowspan="1" colspan="1">글번호</th>
                            <th class="sorting_asc" rowspan="1" colspan="1">문의유형</th>
                            <th class="sorting_asc" rowspan="1" colspan="1">글제목</th>
                            <th class="sorting_asc" rowspan="1" colspan="1">회원아이디</th>
                            <th class="sorting_asc" rowspan="1" colspan="1">작성일자</th>
                            <th class="sorting_asc" rowspan="1" colspan="1">답변상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="csvo" items="${listAll }">
                            <tr role="row" class="odd">
                                <td class="sorting_1">${csvo.customer_b_num }</td>
                                <c:choose>
                                    <c:when test="${csvo.customer_b_type == 1}">
                                        <td><span class="label label-success">상품 관련 문의</span></td>
                                    </c:when>
                                    <c:when test="${csvo.customer_b_type == 2}">
                                        <td><span class="label label-warning">주문 관련 문의</span></td>
                                    </c:when>
                                    <c:when test="${csvo.customer_b_type == 3}">
                                        <td><span class="label label-primary">서비스 관련 문의</span></td>
                                    </c:when>
                                    <c:when test="${csvo.customer_b_type == 4}">
                                        <td><span class="label label-danger">고객 의견</span></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><span class="label label-danger">기타 문의</span></td>
                                    </c:otherwise>
                                </c:choose>
                                <td><a
                                        href="${pageContext.request.contextPath }/CS/read?customer_b_num=${csvo.customer_b_num }&pageNum=${pm.cri.pageNum }">${csvo.customer_b_title }</a>
                                </td>
                                <td>${csvo.m_id }</td>
                                <td>${csvo.customer_b_date }</td>
                                <c:choose>
                                    <c:when test="${csvo.customer_b_status == 0}">
                                        <td><span class="label label-success">답변대기중</span></td>
                                    </c:when>
                                    <c:when test="${csvo.customer_b_status == 1}">
                                        <td><span class="label label-warning">답변완료</span></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><span class="label label-success">답변 처리중</span></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- 테이블  -->
                <!-- 페이징 구역 -->
                <div class=" d-flex justify-content-center">
                    <div class="product__pagination">
                        <c:if test="${pm.prev }">
                            <a href="listAll?pageNum=${pm.startPage-1 }"><i
                                    class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
                            <a <c:out value="${pm.cri.pageNum == idx? 'class = active ':''}"/>
                                    href="listAll?pageNum=${idx }">${idx }</a>
                        </c:forEach>
                        <c:if test="${pm.next && pm.endPage > 0 }">
                            <a href="listAll?pageNum=${pm.endPage + 1}"><i
                                    class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                    </div>
                </div>
                <!--페이징 구역  -->
            </div>
            <div class="d-flex justify-content-center">
                <button type="button" class="site-btn_green" onclick="CS_Board_Register();" id="BtnMypage">글쓰기</button>
            </div>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<!-- 자바스크립트 영역 -->

<script type="text/javascript">

    /** 게시판 - 작성 페이지 이동 */
    function CS_Board_Register() {
        location.href = "${pageContext.request.contextPath }/CS/register";
    }
</script>
<%@ include file="../include/footer.jsp" %>