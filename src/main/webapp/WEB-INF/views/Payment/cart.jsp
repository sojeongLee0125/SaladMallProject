<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>
<c:set var="filePath" value="${pageContext.request.contextPath }/resources/upload/"/>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${path }img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
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
            <div class="checkout__form">
                <h4>주문정보</h4>
                <form action="" method="post" name="orderform">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                		<input type="hidden" name="order_name" value="${member.m_name }">
                                        <input name="order_receive_name" type="text" value="${member.m_name }">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                            	<input style="float: right; width: 15%; height: 30px; color: #ffffff; padding-left: 10px; background-color: #7fad39; font-weight: 600;" 
                            	type="button" value="주소찾기" id="searchAddr" onclick="addrclick()">
                                <p>주소<span>*</span></p>
                                <input type="hidden" name="order_receive_zip" id="m_zip">
                                <input readonly name="order_receive_addr1" id="m_addr1" type="text" placeholder="Street Address" class="checkout__input__add" value="${member.m_addr1}">
                                <input name="order_receive_addr2" id="m_addr2" type="text" placeholder="Apartment, suite, unite ect (optinal)" value="${member.m_addr2}">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>휴대 전화<span>*</span></p>
                                        <input name="order_receive_phone" type="text" value="${member.m_phone}">
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
                            <div class="checkout__input">
                                <p>배송 메시지<span>*</span></p>
                                <input type="text"
                                    placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                            <div class="checkout__input__radio">
	                            <label>
	                                계좌이체
	                                <input value="account_transfer" name="order_type" type="radio">
	                                <span class="checkmark"></span>
	                            </label>
	                            <label style="margin-left: 10px;">
	                                카카오 페이
	                                <input value="kakao_pay" name="order_type" type="radio" checked>
	                                <span class="checkmark"></span>
	                            </label>
	                        </div>
	                        <div class="row">
                                <div class="col-lg-6" id="account_transfer_view" style="display: none;">
                                    <div class="checkout__input">
                                        <p>계좌 정보<span>*</span></p>
                                        <input name="account_transfer_name" type="text" value="사장 이름">
                                        <input name="account_transfer_num" type="text" value="사장 계좌번호">
                                    </div>
                                </div>
                                <div class="col-lg-12" id="kakao_pay_view">
                                    <div class="checkout__input" >
                                        <p>카카오 페이</p>
                                    </div>
                                    <div class="checkout__input__radio">
			                            <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
						                <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
						                <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
						                <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
						                <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
						                <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
						                <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
						                <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
						                <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
						                <p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
						                <button type="button" class="site-btn" id="charge_kakao">충 전 하 기</button>
			                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>결제 금액</h4>
                                <div class="checkout__order__products">상품 <span>금액</span></div>
                                <ul id="orderList">
                                	<c:forEach items="${orderInfo }" var="order">
                                		<li value="${order.cart.cart_price }">${order.recipe.rcp_name } 
                                			<span>
                                				<fmt:formatNumber value="${order.cart.cart_price}" pattern="#,###원" />
                                			</span>
                                		</li>
                                	</c:forEach>
                                </ul>
                                <div id="subtotal" class="checkout__order__subtotal">총 금액 </div>
                                <div id="total" class="checkout__order__total">결제 금액 </div>
                                <input type="hidden" id="order_total_price" name="order_total_price">
                                <button id="order_submit_btn" type="submit" class="site-btn">주문하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
	$("document").ready(function() {
		var sum = 0;
		$("#orderList li").each(function(index, item) {
			sum = sum + $(this).val();
		});
		
		sum = sum.toLocaleString() + "원";
		
		$("#subtotal").append("<span>" + sum + "</span>");
		$("#total").append("<span>" + sum + "</span>");
		
		document.getElementById('order_total_price').value = sum;
		
		$("input[name='order_type']").change(function() {
			$("input[name='order_type']").each(function() {
				var id = $(this).val();
				var check = $(this).prop('checked');
				
				if(check)
					$("#"+id+"_view").css("display", "inherit");
				else
					$("#"+id+"_view").css("display", "none");
			});
		});
		
		$('#order_submit_btn').click(function() {
			OrderSubmit();
		});
		
		function OrderSubmit() {
			
			//이름 공백 확인 
			if ($("input[name='order_receive_name']").val() == "") {
				alert("이름을 입력해 주세요");
				$("input[name='order_receive_name']").focus();
				return false;
			}
			
			if ($("input[name='order_receive_phone']").val() == "") {
				alert("휴대전화번호을 입력해 주세요");
				$("input[name='order_receive_phone']").focus();
				return false;
			}
			
			if ($("input[name='order_receive_zip']").val() == "") {
				alert("주소을 입력해 주세요");
				$("input[name='order_receive_addr2']").focus();
				return false;
			} else{
				alert("주문에 성공했습니다.");
				document.orderform.submit();
			} 
		}
	});
</script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
                        "amount" : money
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href="../index"; //alert창 확인 후 이동할 url 설정
        });
    });
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	// 주소 검색 버튼 클릭
	function addrclick() {	
		new daum.Postcode({
			oncomplete : function(data) {
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
	
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
	
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("m_addr1").value = extraAddr;
	
				} else {
					document.getElementById("m_addr1").value = '';
				}
	
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("m_zip").value = data.zonecode;
				document.getElementById("m_addr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("m_addr2").focus();
			}
		}).open();
	}
</script>