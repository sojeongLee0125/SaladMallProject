<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>

<!-- 네이버 / 카카오 / 구글 로그인 관련 태그 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
        charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
         data-setbg="/resources/saladmall/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>로그인</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/index">Home</a> <span>Login</span>
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
        <div class="common__form login__form">
            <div class="contact__form__title">
                <h2>Welcome</h2>
            </div>
            <form action="" method="post">
                <div class="common__input">
                    <input type="text" id="m_id" name="m_id" placeholder="아이디를 입력해주세요.">
                </div>
                <div class="common__input">
                    <input type="password" id="m_pw" name="m_pw" placeholder="비밀번호를 입력해주세요.">
                </div>
                <div class="Btn_wide">
                    <input type="button" class="site-btn" value="로그인" id="Mlogin_submit_Btn" name="Mlogin_submit_Btn">
                </div>
                <!-- 로그인 버튼 제어   -->
                <div class="navi-display">
                    <ul class="navi-list">
                        <li class="#"><a href="${pageContext.request.contextPath}/M_Join/join">회원가입</a></li>
                        <li class="#"><a href="javascript: findPW();">아이디/비밀번호 찾기</a></li>
                    </ul>
                </div>

                <div class="divider">
                    <span data-v-d3dff3a6="" onclick="signOut();">OR</span>
                </div>

                <div class="d-flex justify-content-around">
                    <!-- 구글 아이디 로그인 버튼  -->
                    <a class="g-signin2" id="googleLogin" onclick="init();" data-theme="dark"></a>
                    <!-- 네이버아이디로로그인 버튼 노출 영역 -->
                    <div id="naver_id_login"></div>
                    <!-- 카카오로그인 -->
                    <a href="javascript:kakaoLogin();">
                        <img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png"
                             style="height: 40px;width: auto;">
                    </a>
                </div>

            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<!-- 자바스크립트 제어 -->
<script type="text/javascript">

    /* 비밀번호 찾기 */
    function findPW() {
        var url = "${pageContext.request.contextPath}/M_Login/findpw";
        window.open(url, "비밀번호 찾기", 'width=500px, height=370px, scrollbars=no, top=300px, left=500px');
    }

    // 로그인 클릭
    $(function () {
        $('#Mlogin_submit_Btn').click(function () {
            LoginSubmit();
        });
    });

    // 서브밋 이벤트
    function LoginSubmit() {
        var m_id = $('#m_id').val();
        var m_pw = $('#m_pw').val();

        if (m_id == "") {
            alert("아이디를 입력해주세요");
        } else if (m_pw == "") {
            alert("비밀번호를 입력해주세요.");
        } else {
            $.ajax({
                type: "POST",
                url: 'login',
                data: {
                    m_id: m_id,
                    m_pw: m_pw
                },
                success: function (data) {
                    if (data == "false") {
                        alert("아이디나 비밀번호 오류입니다.");
                    } else if (data == "admin") {
                        alert("관리자님 환영합니다.");
                        location.href = "${pageContext.request.contextPath}/Admin/main";
                    } else {
                        alert(m_id + "님 환영합니다.")
                        location.href = "${pageContext.request.contextPath}/M_Main/mypage";
                    }//if
                }
            });
        }
    }

    <!-- 네이버아디디로로그인 초기화 Script -->
    var naver_id_login = new naver_id_login("Jm9CXeSe0d2eMXMxOH2s", "http://localhost:8080/index");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 2, 40);
    naver_id_login.setDomain("http://localhost:8080");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();

    /* 네이버 로그인 콜백 */
    var naver_id_login = new naver_id_login("Jm9CXeSe0d2eMXMxOH2s", "http://localhost:8080/index");
    // 접근 토큰 값 출력
    alert(naver_id_login.oauthParams.access_token);
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");

    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
        alert(naver_id_login.getProfileData('email'));
        alert(naver_id_login.getProfileData('nickname'));
        alert(naver_id_login.getProfileData('age'));
    }


    /* 카카오 소셜 로그인 */

    function kakaoLogin() {

        Kakao.init("3cc402e7d8390b71a827b742467344bd");
        console.log(Kakao.isInitialized());

        Kakao.Auth.login({
            success: function (authObj) {
                console.log(authObj);
                fetch('/v2/user/me', {
                    method: 'GET',
                    headers: {
                        Authorization: authObj.access_token,
                    },
                }).then(res => res.json()).then(res => {
                    localStorage.setItem('access_token', res.access_token);
                    if (res.access_token) {
                        alert('로그인 성공!');
                        history.push('/');
                    } else {
                        alert('다시 확인해주세요');
                    }
                });
            },
            fail: function (err) {
                console.log('에러', err);
                alert('로그인실패!');
            },
        });
    }

    /* 카카오 로그아웃 */
    function kakaoLogout() {
        /* 네이버 로그인된 것도 같이 로그아웃 되도록 실행 */
        naverLogout();

        if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                    console.log(error)
                },
            })
            Kakao.Auth.setAccessToken(undefined)
        }
    }

    /*  네이버 로그아웃 */
    var testPopUp;

    function openPopUp() {
        testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
        testPopUp.close();
    }

    function naverLogout() {
        openPopUp();
    }

    // 구글 소셜 로그인 1단계 - init
    var googleUser = {};

    function init() {
        gapi.load('auth2', function () {
            auth2 = gapi.auth2.init({
                client_id: '937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com',
                cookiepolicy: 'single_host_origin',
            });
            attachSignin(document.getElementById('googleLogin'));
        });
    }

    // 구글 소셜 로그인 2단계 - signin
    function attachSignin(element) {
        auth2.attachClickHandler(element, {},
            function (googleUser) {
                var profile = googleUser.getBasicProfile();
                var id_token = googleUser.getAuthResponse().id_token;

                var id = profile.getEmail();
                var m_id = id.slice(0, id.indexOf("@"));
                var m_pw = 123456;

                $(function () {
                    $.ajax({
                        url: '/M_Login/googlelogin',
                        type: 'post',
                        data: {
                            "m_id": m_id,
                            "m_pw": m_pw,
                            "m_name": profile.getName(),
                            "m_email": profile.getEmail()
                        },
                        success: function (result) {

                            if (result == 1) {
                                alert("구글아이디로 회원가입 되었습니다. 초기비밀번호는 123456 입니다.");
                                location.href = "${pageContext.request.contextPath }/M_Main/mypage";
                            }

                            if (result == 0) {
                                alert("구글아이디로 로그인에 성공했습니다.");
                                location.href = "${pageContext.request.contextPath }/M_Main/mypage";
                            }
                        }
                    });
                })
            }, function (error) {
                alert("구글아이디 로그인이 실패했습니다.");
            });
    }

    // 구글 로그아웃
    function signOut() {

        openPopUp();

        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');
        });
        auth2.disconnect();
    }
</script>

<%@ include file="../include/footer.jsp" %>
