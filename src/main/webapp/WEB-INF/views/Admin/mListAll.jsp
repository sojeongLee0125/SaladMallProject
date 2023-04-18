<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<style>

    th, td {
        text-align: center;
    }

    #member_search li {

        border: 0.2px solid black;
        font-size: 16px;
        background-color: white;
        color: gray;
        margin-left: 685px;
        list-style: none;
        height: 1.8em;
        width: 163px;
        text-align: center;
        display: block;
    }
</style>

<h1 style="text-align: center; padding-top: 30px;">회원 전체 목록 조회</h1>

<section class="content" style="padding-top: 50px;">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">회원 목록 총 ${pm.totalCount }명</h3>
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
                                            aria-label="Rendering engine: activate to sort column descending">회원 ID
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Browser: activate to sort column ascending">회원명
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Platform(s): activate to sort column ascending">회원등급
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Platform(s): activate to sort column ascending">가입일자
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Platform(s): activate to sort column ascending">누적구매액
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Engine version: activate to sort column ascending">출석일수
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="CSS grade: activate to sort column ascending">경고횟수
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="mvo" items="${mListAll }">
                                        <tr role="row" class="odd">
                                            <td class="sorting_1"><a
                                                    href="${pageContext.request.contextPath }/Admin/mInfo?m_id=${mvo.m_id }&pageNum=${pm.cri.pageNum }">${mvo.m_id }</a>
                                            </td>
                                            <td>${mvo.m_name }</td>
                                            <c:choose>
                                                <c:when test="${mvo.m_grade == 1}">
                                                    <td><span class="label label-success">Silver</span></td>
                                                </c:when>
                                                <c:when test="${mvo.m_grade == 2}">
                                                    <td><span class="label label-warning">Gold</span></td>
                                                </c:when>
                                                <c:when test="${mvo.m_grade == 3}">
                                                    <td><span class="label label-primary">VIP</span></td>
                                                </c:when>
                                                <c:when test="${mvo.m_grade == 4}">
                                                    <td><span class="label label-danger">VVIP</span></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td><span class="label label-danger">잘못된 등급</span></td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td>${mvo.m_regdate }</td>
                                            <td>${mvo.m_totalAmount }</td>
                                            <td>${mvo.m_attendance }</td>
                                            <td>${mvo.m_warning }</td>
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
</section>

<!-- 검색창 -->
<div class="text-center" style="padding-bottom: 30px;">
    <div class="hero__search__form text-center">
        <input id="member_num" type="hidden">
        <input id="member_name" type="text" placeholder="Who Are U Looking for?">
        <input id="member_btn" type="button" class="site-btn" value="search">
        <ul id="member_search"></ul>
    </div>
    <ul class="pagination">
        <!-- 이전 -->
        <c:if test="${pm.prev }">
            <li><a href="mListAll?pageNum=${pm.startPage-1 }"> &laquo;</a></li>
        </c:if>
        <!-- 페이지 번호 -->
        <c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
            <li <c:out value="${pm.cri.pageNum == idx? 'class = active ':''}"/>>
                <a href="mListAll?pageNum=${idx }">${idx }</a>
            </li>
        </c:forEach>
        <!-- 다음 -->
        <c:if test="${pm.next && pm.endPage > 0 }">
            <li><a href="mListAll?pageNum=${pm.endPage + 1}"> &raquo;</a></li>
        </c:if>
    </ul>
</div>

<%@ include file="footer.jsp" %>

<!-- 검색기능 -->
<script type="text/javascript">
    $(document).ready(function () {
        // 입력창 입력
        $("#member_name").keyup(function () {
            if ($("#member_name").val() == "") {
                $("#member_search").empty();
            } else {
                $("#member_search").empty();
                var selectOption = "tbl_member";
                $.getJSON('../R_Board/searchTotal/' + selectOption, {
                    searchData: $("#member_name").val()
                }, function (data) {
                    $.each(data, function (index, title) {
                        $("#member_search").append('<li value="' + title.primaryKey + '">' + title.title + '</li>');
                    });
                    $("#member_search li").click(function () {
                        document.getElementById('member_name').value = $(this).text();
                        document.getElementById('member_num').value = $(this).val();
                        $("#member_search").empty();
                    });
                });
            }
        });

        // 검색 결과 클릭
        $("#member_btn").click(function () {
            if ($("#member_num").val() != "") {
                location.href = "${pageContext.request.contextPath }/Admin/mInfoSeq?m_seq=" + $("#member_num").val() + "&pageNum=1";
            }
        });
    });
</script>