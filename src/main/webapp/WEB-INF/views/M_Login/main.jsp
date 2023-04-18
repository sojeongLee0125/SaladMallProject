<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <meta charset="UTF-8">
    <title>SaladMall | LoginPage</title>
    <meta
            content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
            name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- Font Awesome Icons -->
    <link
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
            rel="stylesheet" type="text/css"/>
    <!-- Ionicons -->
    <link
            href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
            rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css"
          rel="stylesheet" type="text/css"/>

    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id"
          content="937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<!-- jQuery 2.1.4 -->
<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<body>

${m_id }

<span id="google_login" class="circle google" onclick="init();"> <i class="fa fa-google-plus fa-fw"></i> </span>
<section style="padding: 100px 400px 100px 400px; margin-left: 100px;">
    <button type="button" onclick="signOut();">google sign out</button>

</section>

<script type="text/javascript">

    // google signin API
    var googleUser = {};

    function init() {
        gapi.load('auth2', function () {
            console.log("init()시작");
            auth2 = gapi.auth2.init({
                client_id: '937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com',
                cookiepolicy: 'single_host_origin',
            });
            attachSignin(document.getElementById('google_login'));
        });
    }


    //google signin API2
    function attachSignin(element) {
        auth2.attachClickHandler(element, {},
            function (googleUser) {
                var profile = googleUser.getBasicProfile();
                var id_token = googleUser.getAuthResponse().id_token;
                console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                console.log('ID토큰: ' + id_token);
                console.log('Name: ' + profile.getName());
                console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
                $(function () {
                    $.ajax({
                        url: '/M_Login/googlelogin',
                        type: 'post',
                        data: {
                            "m_id": profile.getEmail(),
                            "m_name": profile.getName(),
                            "m_email": profile.getEmail()
                        },
                        success: function (data) {
                            alert("구글아이디로 로그인 되었습니다");
                            location.href = "${pageContext.request.contextPath }/main";
                        }
                    });
                })
            }, function (error) {
                alert("구글아이디 로그인이 실패했습니다.");
            });
    }

    // 구글 로그아웃
    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');
        });
    }


    <!-- 네이버아이디로로그인 버튼 노출 영역 -->
    <div id="naver_id_login"></div>

    <!-- 네이버아디디로로그인 초기화 Script -->
    <script type="text/javascript">
        var naver_id_login = new naver_id_login("4JoVEl8bh_pfo_aFwcDO", "http://localhost:8088/M_Login/main");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("green", 2, 40);
        naver_id_login.setDomain(".service.com");
        naver_id_login.setState(state);
        naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();
</script>
<!-- //네이버아디디로로그인 초기화 Script -->


<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
        // naver_id_login.getProfileData('프로필항목명');
        alert(naver_id_login.getProfileData('email'));
    }

    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");

</script>

</body>
</html>