<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>
<%@ include file="../include/header.jsp" %>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="${path}img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>샐러드 리뷰 작성</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Contact Us</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Contact Form Begin -->
<div class="contact-form spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="c
                    ontact__form__title">
                    <h2>샐리드 리뷰 작성하기</h2>
                </div>
            </div>
        </div>
        <form id="modify_form" action="" method="post">
            <input id="rcp_b_num" name="rcp_b_num" type="hidden" value="${board.board.rcp_b_num }">
            <input id="rcp_num" name="rcp_num" type="hidden" value="${board.board.rcp_num }">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <input readonly id="rcp_name" name="rcp_name" type="text" placeholder="샐러드 선택"
                           value="${board.recipe.rcp_name }">
                </div>
                <div class="col-lg-12 col-md-12">
                    <ul id="rcp_search">
                    </ul>
                </div>
                <div class="col-lg-12 col-md-12">
                    <input id="rcp_b_title" name="rcp_b_title" type="text" placeholder="제목"
                           value="${board.board.rcp_b_title }">
                </div>
                <br>
            </div>
            <div class="col-lg-12 col-md-12">
                <textarea id="rcp_b_content" name="rcp_b_content"
                          placeholder="리뷰 내용">${board.board.rcp_b_content }</textarea>
            </div>
            <div class="col-lg-6 col-md-12">
                <input type="file" name="rcp_b_thumbnail" placeholder="썸네일">
                <input type="file" name="rcp_b_img1" placeholder="이미지1">
                <input type="file" name="rcp_b_img2" placeholder="이미지2">
                <input type="file" name="rcp_b_img3" placeholder="이미지3">
            </div>
            <div class="col-lg-6 text-center">
                <button id="modify_btn" type="submit" class="site-btn">수정하기</button>
            </div>
    </div>
    </form>
</div>
</div>

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
    $(document).ready(function () {
        $("#rcp_name").keyup(function () {
            if ($("#rcp_name").val() == "") {
                $("#rcp_search").empty();
            } else {
                $("#rcp_search").empty();
                var selectOption = "salad_recipe";
                $.getJSON('searchTotal/' + selectOption, {searchData: $("#rcp_name").val()}, function (data) {
                    $.each(data, function (index, title) {
                        $("#rcp_search").append('<li value="' + title.primaryKey + '">' + title.title + '</li>');
                    });
                    $("#rcp_search li").click(function () {
                        document.getElementById('rcp_name').value = $(this).text();
                        document.getElementById('rcp_num').value = $(this).val();
                        $("#rcp_search").empty();
                    });
                });
            }

        });

        $("#modify_btn").click(function () {
            var rcp_num = $("#rcp_num").val();
            var rcp_b_title = $("#rcp_b_title").val();
            var rcp_b_content = $("#rcp_b_content").val();

            if (rcp_num == "") {
                alert("레시피를 선택해주세요");
                document.getElementById('rcp_name').focus();
                return false;
            } else if (rcp_num == "") {
                alert("제목을 입력해주세요");
                document.getElementById('rcp_b_title').focus();
                return false;
            } else if (rcp_num == "") {
                alert("내용을 입력해주세요.");
                document.getElementById('rcp_b_content').focus();
                return false;
            }

            $("#modify_form").attr("action", "${pageContext.request.contextPath }/R_Board/boardModify");
            $("#modify_form").submit();
        });
    });
</script>