<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<style>

    .content {
        height: 100%;
    }

    .main-footer {
        position: fixed;
        height: 60px;
        top: 0;
        right: 0;
        bottom: 0;
        width: 100%;
    }
</style>

<section class="content">
    <!-- Info boxes -->
    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
				<span class="info-box-icon bg-black"><i
                        class="ion ion-ios-gear-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">금일 트래픽 지수</span> <span
                        class="info-box-number">90<small>%</small></span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
				<span class="info-box-icon bg-red"><i
                        class="fa fa-google-plus"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">금일 검색지수</span> <span
                        class="info-box-number">41,410</span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
				<span class="info-box-icon bg-green"><i
                        class="ion ion-ios-cart-outline"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">금일 판매지수</span> <span
                        class="info-box-number">760</span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
				<span class="info-box-icon bg-yellow"><i
                        class="ion ion-ios-people-outline"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">금일 신규회원</span> <span
                        class="info-box-number">2,000</span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <b>주간 매출 통계</b>
                    </h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool"
                                data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-box-tool dropdown-toggle"
                                    data-toggle="dropdown">
                                <i class="fa fa-wrench"></i>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <button type="button" class="btn btn-box-tool"
                                data-widget="remove">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">
                            <p class="text-center">
                                <strong>Sales: 1 Oct, 2021 - 7 Oct, 2021</strong>
                            </p>

                            <div class="progress-group">
                                <span class="progress-text">주간 매출 목표 달성도</span> <span
                                    class="progress-number"><b>78.57</b>/100</span>

                                <div class="progress sm">
                                    <div class="progress-bar progress-bar-danger"
                                         style="width: 78.57%"></div>
                                </div>
                            </div>
                            <!-- /.progress-group -->
                            <div class="progress-group">
                                <span class="progress-text">월요일 매출 목표 달성도</span> <span
                                    class="progress-number"><b>65</b>/100</span>

                                <div class="progress sm">
                                    <div class="progress-bar progress-bar-blue" style="width: 65%"></div>
                                </div>
                            </div>
                            <!-- /.progress-group -->
                            <div class="progress-group">
                                <span class="progress-text">화요일 매출 목표 달성도</span> <span
                                    class="progress-number"><b>77</b>/100</span>

                                <div class="progress sm">
                                    <div class="progress-bar progress-bar-red" style="width: 77%"></div>
                                </div>
                            </div>
                            <!-- /.progress-group -->
                            <div class="progress-group">
                                <span class="progress-text">수요일 매출 목표 달성도</span> <span
                                    class="progress-number"><b>92</b>/100</span>

                                <div class="progress sm">
                                    <div class="progress-bar progress-bar-red" style="width: 92%"></div>
                                </div>
                            </div>
                            <!-- /.progress-group -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6">
                            <p class="text-center">
                                <strong>Sales: 1 Oct, 2021 - 7 Oct, 2021</strong>
                            </p>

                            <div class="progress-group">
                                <span class="progress-text">목요일 매출 목표 달성도</span> <span
                                    class="progress-number"><b>88</b>/100</span>

                                <div class="progress sm">
                                    <div class="progress-bar progress-bar-red" style="width: 88%"></div>
                                </div>
                            </div>
                            <!-- /.progress-group -->
                            <div class="progress-group">
                                <span class="progress-text">금요일 매출 목표 달성도</span> <span
                                    class="progress-number"><b>66</b>/100</span>

                                <div class="progress sm">
                                    <div class="progress-bar progress-bar-blue" style="width: 66%"></div>
                                </div>
                            </div>
                            <!-- /.progress-group -->
                            <div class="progress-group">
                                <span class="progress-text">토요일 매출 목표 달성도</span> <span
                                    class="progress-number"><b>90</b>/100</span>

                                <div class="progress sm">
                                    <div class="progress-bar progress-bar-red" style="width: 90%"></div>
                                </div>
                            </div>
                            <!-- /.progress-group -->
                            <div class="progress-group">
                                <span class="progress-text">일요일 매출 목표 달성도</span> <span
                                    class="progress-number"><b>72</b>/100</span>

                                <div class="progress sm">
                                    <div class="progress-bar progress-bar-blue" style="width: 72%"></div>
                                </div>
                            </div>
                            <!-- /.progress-group -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- ./box-body -->
                <div class="box-footer">
                    <div class="row">
                        <div class="col-sm-3 col-xs-6">
                            <div class="description-block border-right">
								<span class="description-percentage text-green"><i
                                        class="fa fa-caret-up"></i> 17%</span>
                                <h5 class="description-header">$35,210.43</h5>
                                <span class="description-text">총 매출</span>
                            </div>
                            <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-3 col-xs-6">
                            <div class="description-block border-right">
								<span class="description-percentage text-yellow"><i
                                        class="fa fa-caret-left"></i> 0%</span>
                                <h5 class="description-header">$10,390.90</h5>
                                <span class="description-text">총 비용</span>
                            </div>
                            <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-3 col-xs-6">
                            <div class="description-block border-right">
								<span class="description-percentage text-green"><i
                                        class="fa fa-caret-up"></i> 20%</span>
                                <h5 class="description-header">$24,813.53</h5>
                                <span class="description-text">순 이익</span>
                            </div>
                            <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-3 col-xs-6">
                            <div class="description-block">
								<span class="description-percentage text-red"><i
                                        class="fa fa-caret-down"></i> 18%</span>
                                <h5 class="description-header">1200</h5>
                                <span class="description-text">작년 매출 비교</span>
                            </div>
                            <!-- /.description-block -->
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-footer -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <!-- Main row -->
    <div class="row">
        <!-- Left col -->
        <div class="col-md-6">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <b>실시간 주문내역</b>
                    </h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool"
                                data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool"
                                data-widget="remove">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table no-margin">
                            <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>결제번호</th>
                                <th>주문아이디</th>
                                <th>주문레시피</th>
                                <th>주문갯수</th>
                                <th>총 주문금액</th>
                                <th>주문상태</th>
                                <th>주문시간</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="rovo" items="${recentOList }">
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath }/Admin/oInfo?order_num=${rovo.order_num }&pageNum=1">${rovo.order_num }</a>
                                    </td>
                                    <td>${rovo.order_pay_num }</td>
                                    <td>${rovo.m_id }</td>
                                    <td>${rovo.rcp_name }</td>
                                    <td>${rovo.order_amount }</td>
                                    <td>${rovo.order_total_price }</td>
                                    <c:choose>
                                        <c:when test="${rovo.order_status == 0}">
                                            <td><span class="label label-primary">결제 대기중</span></td>
                                        </c:when>
                                        <c:when test="${rovo.order_status == 1}">
                                            <td><span class="label label-success">결제 완료</span></td>
                                        </c:when>
                                        <c:when test="${rovo.order_status == 2}">
                                            <td><span class="label label-warning">배송중</span></td>
                                        </c:when>
                                        <c:when test="${rovo.order_status == 3}">
                                            <td><span class="label label-primary">배송 완료</span></td>
                                        </c:when>
                                        <c:when test="${rovo.order_status == 4}">
                                            <td><span class="label label-danger">구매 확정</span></td>
                                        </c:when>
                                        <c:when test="${rovo.order_status == 5}">
                                            <td><span class="label label-success">거래 완료</span></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><span class="label label-danger">확인 불가</span></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${rovo.order_date }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <a href="${pageContext.request.contextPath }/Admin/oListAll"
                       class="btn btn-sm btn-primary btn-flat pull-left">전체 주문 목록 이동</a>
                </div>
                <!-- /.box-footer -->
            </div>
        </div>
        <!-- right col -->
        <div class="col-md-6">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <b>인기 레시피 게시판 실시간 순위</b>
                    </h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool"
                                data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool"
                                data-widget="remove">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table no-margin">
                            <thead>
                            <tr>
                                <th>글 번호</th>
                                <th>회원 아이디</th>
                                <th>레시피 번호</th>
                                <th>글 제목</th>
                                <th>좋아요 수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="rbvo" items="${popularRList }">
                                <tr>
                                    <td><a href="#">${rbvo.rcp_b_num }</a></td>
                                    <td>${rbvo.m_id }</td>
                                    <td>${rbvo.rcp_num }</td>
                                    <td>${rbvo.rcp_b_title }</td>
                                    <td>${rbvo.rcp_b_like_count }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <a href="${pageContext.request.contextPath }/Admin/RBoard_TopList"
                       class="btn btn-sm btn-danger btn-flat pull-left">인기 레시피 게시판 이동</a>
                </div>
                <!-- /.box-footer -->
            </div>
        </div>
        <!-- /.col -->
        <!-- /.box-footer -->
    </div>
    <!-- /.box -->
    </div>
    <!-- /.col -->
    </div>
    <!-- /.row -->
</section>

<%@ include file="footer.jsp" %>