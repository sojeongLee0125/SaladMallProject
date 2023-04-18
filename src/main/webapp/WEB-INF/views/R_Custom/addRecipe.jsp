<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="${path}img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>레시피 등록</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>RECIPE</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<section class="spad">
    <div class="container">
        <div class="common__form">
            <h4>${m_id }님 레시피를 등록해주세요.</h4>
            <!-- 한줄에 하나  -->
            <form action="#" method="post" class="">
                <div class="common__input">
                    <p>레시피 이름<span>*</span></p>
                    <input type="text" name="rcp_name" placeholder="레시피 이름을 정해주세요">
                </div>
                <div class="common__input">
                    <p>레시피 조합<span>*</span></p>
                    <input type="text" name="rcp_cmbnt" value="${rcp_cmbnt }" placeholder="등록된 레시피 조합이 없습니다"
                           readonly>
                </div>
                <div class="common__input">
                    <p>레시피 설명<span>*</span></p>
                    <input type="text" name="rcp_content" placeholder="레시피를 간단히 설명해주세요">
                </div>
                <div class="common__input">
                    <p>파일 이미지</p>
                    <input type="file" id="" name="rcp_img">
                </div>

                <input type="hidden" name="rcp_price" value="500">

                <div class="text-center">
                    <input type="submit" value="레시피 등록" class="site-btn_green">
                </div>
            </form>
        </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>