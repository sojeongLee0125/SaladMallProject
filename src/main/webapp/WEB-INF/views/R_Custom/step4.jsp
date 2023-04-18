<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="${path}img/breadcrumb.jpg">
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
<!-- Breadcrumb Section End -->

<!-- Custtom Section Begin -->
<section class="shoping-cart spad2">
    <div class="container">
        <!-- step bar 시작 -->
        <div class="text-center p-0 mt-3 mb-2">
            <div class="card px-0 pt-4 pb-0">
                <h2 id="heading">샐러드에 들어갈 소스를 선택해주세요!</h2>
                <p>Do it yourself salad!</p>
                <form id="msform">
                    <!-- progressbar -->
                    <ul id="progressbar">
                        <li id="step1"><strong>Step1</strong></li>
                        <li id="step2"><strong>Step2</strong></li>
                        <li id="step3"><strong>Step3</strong></li>
                        <li class="active" id="step4"><strong>Step4</strong></li>
                        <li id="step5"><strong>Step5</strong></li>
                    </ul>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"
                             aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <br>
                    <!-- fieldsets -->
                    <fieldset>
                        <div class="form-card">
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-card">
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-card">
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-card">
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-card">
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <!-- step bar 끝 -->

        <div class="row">
            <div class="col-lg-8">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Products</th>
                            <th>Price</th>
                            <th>Choice</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="vo" varStatus="status" items="${ingredientList }">
                            <form action="" method="POST">
                                <input type="hidden" name="igdt_num" value="${vo.igdt_num }">
                                <input type="hidden" name="igdt_name" value="${vo.igdt_name }">
                                <input type="hidden" name="igdt_price" value="${vo.igdt_price }">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="${path}img/cart/cart-1.jpg" alt="">
                                        <h5>${vo.igdt_name }</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                            ${vo.igdt_price }
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <input type="submit" class="add" value="추가">
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="shoping__cart__btns">
                    <a href="#" class="primary-btn cart-btn"
                       onclick="location.href='${pageContext.request.contextPath }/R_Custom/step2'">Previous</a>
                    <a href="#" class="primary-btn cart-btn cart-btn-right" value="다음"
                       onclick="location.href='${pageContext.request.contextPath }/R_Custom/step5'">
                        Next
                    </a>
                </div>
            </div>
            <!-- col-lg- 테이블 목록 Een -->
            <div class="col-lg-4">
                <div class="checkout__order">
                    <h4>Your Order</h4>
                    <div class="checkout__order__products">Products <span>Total</span></div>
                    <ul id="customList">
                        <c:choose>
                            <c:when test="${customList != null }">
                                <c:forEach var="cvo" items="${customList }">
                                    <li value="${cvo.igdt_price }">${cvo.igdt_name }
                                        <span>&#8361;${cvo.igdt_price }</span></li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <li>아직 값이 없습니다</li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <div id="total" class="checkout__order__total">Total <span>&#8361;</span></div>
                    <form role="form">
                        <button type="submit" id="btn-1">레시피 등록</button>
                        <button type="submit" id="btn-2" class="site-btn">Shopping Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- row End -->

    </div>
</section>
<!-- Custtom Section End -->

<!-- 레시피 등록, 장바구니 담기 클릭시 -->
<script type="text/javascript">
    $(document).ready(function () {

        var fr = $("form[role='form']");


        // 레시피 등록
        $("#btn-1").on("click", function () {
            fr.attr("action", "${pageContext.request.contextPath }/R_Custom/addRecipe")
            fr.attr("method", "get");
            fr.submit();
        });

        // 장바구니 담기
        $("#btn-2").on("click", function () {
            fr.attr("action", "${pageContext.request.contextPath }/R_Custom/addCart")
            fr.attr("method", "get");
            fr.submit();
        });
    });
    // step bar 작동
    $(document).ready(function () {
        var current = 4;
        var steps = $("fieldset").length;

        var sum = 0;
        $("#customList li").each(function (index, item) {
            sum = sum + $(this).val();
        });

        $("#total span").append(sum);

        setProgressBar(current);

        $(".next").click(function () {
            setProgressBar(++current);
        });

        $(".previous").click(function () {

            setProgressBar(--current);
        });

        function setProgressBar(curStep) {
            var percent = parseFloat(100 / steps) * curStep;
            percent = percent.toFixed();
            $(".progress-bar").css("width", percent + "%")
        };

        $(".submit").click(function () {
            return false;
        });
    });
</script>


<%@ include file="../include/footer.jsp" %>
