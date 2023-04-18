<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.3.1.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="${path}img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>장바구니</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<section class="shoping-cart spad mt-5">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="shoping__cart__table">
                    <form action="" method="post">
                        <table>
                            <thead>
                            <tr role="row">
                                <th>번호</th>
                                <th>레시피번호</th>
                                <th>주문수량</th>
                                <th>상품가격</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="vo" items="${Basket}">
                                <form action="" method="post">
                                    <input type="hidden" name="cart_num" value="${vo.cart_num }">
                                    <input type="hidden" name="rcp_num" value="${vo.rcp_num }">
                                    <input type="hidden" name="cart_amount" value="${vo.cart_amount }"> <input
                                        type="hidden" name="cart_price" value="${vo.cart_price }">

                                    <tr role="row" class="odd">
                                        <td class="sorting_1">${vo.cart_num}</td>
                                        <td>${vo.rcp_num}</td>
                                        <td>${vo.cart_amount}개</td>
                                        <td><fmt:formatNumber pattern="###,###,###" value="${vo.cart_price}"/>원</td>
                                        <td>
                                            <div class="delete">
                                                <button class="bkdlete_btn" type="submit">삭제</button>
                                            </div>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br><br>
                        <div class="text-center">
                            <button class="bkpayment_btn site-btn_green" type="button"
                                    onclick="location.href='${pageContext.request.contextPath }/Payment/cart'">주문하기
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>


<script type="text/javascript">
    // 전달된 데이터를 저장 (el표현식의 값)
    var result = '${result}';

    if (result == 'Basket delete') {
        alert(" 장바구니 삭제 완료! ");
    }

</script>

<%@ include file="../include/footer.jsp" %>