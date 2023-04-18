<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-2 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="./index.jsp"><img
                                src="${pageContext.request.contextPath }/resources/saladmall/img/logo.png" alt=""></a>
                    </div>
                    <!-- <ul>
                        <li>Address: 60-49 Road 11378 New York</li>
                        <li>Phone: +65 11.188.888</li>
                        <li>Email: hello@colorlib.com</li>
                    </ul> -->
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>개인정보처리방침 | 이용약관</h6>
                    <ul>
                        <li><a href="#">주식회사 샐러드 | 대표자명 : 1조</a></li>
                        <li><a href="#">주소 : 부산광역시 부산진구 동천로 109 삼한골든게이트 7층</a></li>
                        <li><a href="#">통신판매업 신고번호 : 제 2021 - 부산시 - 1234호 | 사업자등록번호 : 123-45-67891</a></li>
                        <li><a href="#">Copyright © 2021 이소정, 문석호, 김창진, 이기동, 노아영, 김보혜, 전종락, 이유화<br>All rights reserved.</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Join Our Newsletter Now</h6>
                    <p>Get E-mail updates about our latest shop and special offers.</p>
                    <form action="#">
                        <input type="text" placeholder="Enter your mail">
                        <button type="submit" class="site-btn">Subscribe</button>
                    </form>
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text"><p>Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p></div>
                    <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                </div>
            </div>
        </div> -->
    </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="${pageContext.request.contextPath }/resources/saladmall/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/saladmall/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/saladmall/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/saladmall/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/saladmall/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath }/resources/saladmall/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/saladmall/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/saladmall/js/main.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#total_search_data").keyup(function () {
            if ($("#total_search_data").val() == "") {
                $("#total_search_result").empty();
            } else if ($("#total_categories_val").val() == null) {
                $("#total_search_result").empty();
            } else {
                $("#total_search_result").empty();

                var selectOption = $("#total_categories_val").val();

                if (selectOption == 1) selectOption = "recipe_board";
                else if (selectOption == 2) selectOption = "salad_recipe";
                else if (selectOption == 3) selectOption = "tbl_member";

                $.getJSON('../R_Board/searchTotal/' + selectOption, {searchData: $("#total_search_data").val()}, function (data) {
                    $.each(data, function (index, title) {
                        $("#total_search_result").append('<li data-value="' + title.address + '">' + title.title + '</li>');
                    });
                    $("#total_search_result li").click(function () {
                        document.getElementById('total_search_data').value = $(this).text();
                        document.getElementById('total_search_address').value = $(this).data().value;
                        $("#total_search_result").empty();
                    });
                });
            }
        });

        $("#total_categories li").click(function () {
            $("#total_categories_text").empty();
            document.getElementById('total_categories_text').innerText = $(this).text();
            document.getElementById('total_categories_val').value = $(this).val();

            $("#total_search_result").empty();
        });

        $("#total_search_btn").click(function () {
            if ($("#total_search_address").val() != "") {
                var address = document.getElementById('total_search_address').value;
                location.href = address;
            }
        });
    });
</script>
</body>

</html>