<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Order</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Order</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<c:forEach var="cartVO" items="${orderList }">
<p><c:out value="${cartVO.cart_num }"/></p>
<p><c:out value="${cartVO.m_id }"/></p>
<p><c:out value="${cartVO.rcp_num }"/></p>
<p><c:out value="${cartVO.cart_amount }"/></p>
<p><c:out value="${cartVO.cart_option }"/></p>
<p><c:out value="${cartVO.cart_price }"/></p>
<p><c:out value="${cartVO.cart_regdate }"/></p>
</c:forEach>

<h4>주문 정보</h4>
<form action="#">
    <div class="row">
        <div class="col-lg-8 col-md-6">
            <div class="row">
                <div class="col-lg-6">
                    <div class="checkout__input">
                        <p>이름<span>*</span></p>
                        <input type="text">
                    </div>
                </div>
            </div>
            <div class="checkout__input">
                <p>주소<span>*</span></p>
                <input type="text" placeholder="Street Address" class="checkout__input__add">
                <input type="text" placeholder="Apartment, suite, unite ect (optinal)">
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="checkout__input">
                        <p>휴대폰번호<span>*</span></p>
                        <input type="text">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="checkout__input">
                        <p>이메일<span>*</span></p>
                        <input type="text">
                    </div>
                </div>
            </div>
            <div class="checkout__input__checkbox">
                <label for="acc">
                    Create an account?
                    <input type="checkbox" id="acc">
                    <span class="checkmark"></span>
                </label>
            </div>
            <p>Create an account by entering the information below. If you are a returning customer
                please login at the top of the page</p>
            <div class="checkout__input__checkbox">
            </div>
            <div class="checkout__input">
                <p>배송메시지<span>*</span></p>
                <input type="text" placeholder="Notes about your order, e.g. special notes for delivery.">
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="checkout__order">
                <h4>결제 금액</h4>
                <div class="checkout__order__products">상품 <span>총 주문금액</span></div>
                <ul>
                    <li>Vegetable’s Package <span>$75.99</span></li>
                    <li>Fresh Vegetable <span>$151.99</span></li>
                    <li>Organic Bananas <span>$53.99</span></li>
                </ul>
                <div class="checkout__order__subtotal">금액 <span>$750.99</span></div>
                <div class="checkout__order__total">총 주문금액 <span>$750.99</span></div>
                <div class="checkout__input__checkbox">
                </div>
                <div class="checkout__input__checkbox">
                    <label for="payment">
                        Check Payment
                        <input type="checkbox" id="payment">
                        <span class="checkmark"></span>
                    </label>
                </div>
                <div class="checkout__input__checkbox">
                </div>
                <button type="submit" class="site-btn">주문하기</button>
            </div>
        </div>
    </div>
</form>

<form name="orderF" id="orderF" action="paymentList">
    <button type="button" onclick="goOrder()">주문하기</button>
</form>
<script type="text/javascript">
    /* 체크박스에 체크한 상품(상품번호,주문수량)을 가지고 주문 폼 페이지로 이동 */
    function goOrder() {
        // 1. 장바구니에 담긴 상품이 없는 경우 주문하기 눌렸을 때
        var chk = $('input[name="opnum"]');
        if (chk.length == 0) {
            alert('장바구니에 담긴 상품이 없습니다.');
            return;
        }

        // 2. 담긴 상품이 있다면 체크박스 갯수만큼 반복문 돌면서 체크한 상품과,
        // 체크되지 않은 상품을 구분하여, 체크 안된 상품의 주문 수량은 서버쪽에
        // 전송되지 않도록 disabled 처리한다.

        var cnt = 0
        $.each(chk, function (index, ch) {
            if ($(ch).is(":checked")) { //체크박스가 체크되어있는 경우
                cnt++
                $('#oqty' + (index + 1)).prop('disabled', false) // 활성화
            } else { // 안되어있는경우
                // 체크 안된 상품의 주문 수량 비활성화
                $('#oqty' + (index + 1)).prop('disabled', true) // 비활성화
                // index는 0부터 시작하니까 1추가
            }
        });

        if (cnt == 0) {
            alert('주문할 상품을 체크하세요');
            $('input[name="oqty"]').prop('disabled', false) // 활성화
            return;
        }
        orderF.submit();
    }
</script>

<p>
<p>아임 서포트 결제 모듈 테스트 해보기</p>
<button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
</p>

<div class="card-body bg-white mt-0 shadow">
    <p style="font-weight: bold">카카오페이 현재 사용가능</p>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
    <p style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
    <button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">충 전 하 기</button>
</div>

<script>
    $('#charge_kakao').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp46064882');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);

        IMP.request_pay({
            pg: 'kakao',
            merchant_uid: 'merchant_' + new Date().getTime(),

            name: '주문명 : 주문명 설정',
            amount: money,
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type: "GET",
                    url: "/user/mypage/charge/point", //충전 금액값을 보낼 url 설정
                    data: {
                        "amount": money
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href = "${pageContext.request.contextPath }/user/mypage/home"; //alert창 확인 후 이동할 url 설정
        });
    });
</script>

<%@ include file="../include/footer.jsp" %>
