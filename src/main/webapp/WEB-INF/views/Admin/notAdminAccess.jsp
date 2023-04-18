<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<div class="lockscreen-wrapper" style="padding-bottom: 350px;">
    <div class="lockscreen-logo">
        <b>Admin Access Area</b>

    </div>
    <!-- User name -->
    <div class="lockscreen-name">Chunsik</div>

    <!-- START LOCK SCREEN ITEM -->
    <div class="lockscreen-item">
        <!-- lockscreen image -->
        <div class="lockscreen-image">
            <img src="${pageContext.request.contextPath }/resources/admin/dist/img/main_img.jpg" alt="User Image">
        </div>
        <!-- /.lockscreen-image -->

        <!-- lockscreen credentials (contains the form) -->
        <form class="lockscreen-credentials">
            <div class="input-group">
                <input type="password" class="form-control" placeholder="  관리자로 로그인해주세요." readonly="readonly"
                       onclick="location.href='${pageContext.request.contextPath }/M_Login/login';">
                <div class="input-group-btn">
                    <button type="button" class="btn"
                            onclick="location.href='${pageContext.request.contextPath }/M_Login/login';">
                        <i class="fa fa-arrow-up text-muted"></i>
                    </button>
                </div>
            </div>
        </form>
        <!-- /.lockscreen credentials -->

    </div>
    <!-- /.lockscreen-item -->
    <div class="help-block text-center"> Please log-in with the Administrator Account</div>
    <div class="text-center">
        <a href="${pageContext.request.contextPath }./index">Or Return to SaladMall</a>
    </div>
    <div class="lockscreen-footer text-center">
        Copyright © 2021-2021 <b class="text-black">TeamSalad</b><br> All
        rights reserved
    </div>
</div>

<%@ include file="footer.jsp" %>