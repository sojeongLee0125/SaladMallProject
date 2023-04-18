<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<style>

    th, td {
        text-align: center;
    }
</style>

<h1 style="text-align: center; padding-top: 30px;">재료 재고 목록 조회</h1>

<section class="content" style="padding-top: 50px; padding-bottom: 200px;">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">재료 목록 총 ${pm.totalCount }개</h3>
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
                                            aria-label="Rendering engine: activate to sort column descending">재료번호
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Browser: activate to sort column ascending">재료 카테고리
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Platform(s): activate to sort column ascending">재료 이름
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Platform(s): activate to sort column ascending">재료 가격
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Platform(s): activate to sort column ascending">원산지
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="CSS grade: activate to sort column ascending">재고 수량
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="ivo" items="${igdtListAll }">
                                        <tr role="row" class="odd">
                                            <td class="sorting_1"><a
                                                    href="${pageContext.request.contextPath }/Admin/igdtInfo?igdt_num=${ivo.igdt_num }&pageNum=${pm.cri.pageNum}">${ivo.igdt_num }</a>
                                            </td>
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
                                            <td>${ivo.igdt_country }</td>
                                            <td>${ivo.igdt_count }</td>
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

<div class="text-center">
    <ul class="pagination">
        <!-- 이전 -->
        <c:if test="${pm.prev }">
            <li><a href="igdtListAll?pageNum=${pm.startPage-1 }"> &laquo;</a></li>
        </c:if>
        <!-- 페이지 번호 -->
        <c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
            <li <c:out value="${pm.cri.pageNum == idx? 'class = active ':''}"/>>
                <a href="igdtListAll?pageNum=${idx }">${idx }</a>
            </li>
        </c:forEach>
        <!-- 다음 -->
        <c:if test="${pm.next && pm.endPage > 0 }">
            <li><a href="igdtListAll?pageNum=${pm.endPage + 1}"> &raquo;</a></li>
        </c:if>
    </ul>
</div>

<%@ include file="footer.jsp" %>