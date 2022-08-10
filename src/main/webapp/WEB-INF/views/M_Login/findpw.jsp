<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/M_Login/findpw",
				type : "POST",
				data : {
					m_id : $("#m_id").val(),
					m_email : $("#m_email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: green;
  color: #fff;
  margin-top: 20px;
  border: solid 2px green; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto" style="width: 500px;height: 300px;">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기창</h3>
			</div>
			<div>
				<p>
					<label>아이디</label>
					<input class="w3-input" type="text" id="m_id" name="m_id" placeholder="회원가입한 아이디를 입력하세요" required>
				</p>
				<p>
					<label>이메일</label>
					<input class="w3-input" type="text" id="m_email" name="m_email" placeholder="회원가입한 이메일주소를 입력하세요" required>
				</p>
				<p class="w3-center">
					<button type="button" id="findBtn" class="w3-button w3-hover-green w3-ripple w3-margin-top w3-round mybtn">비밀번호 찾기</button>
					<button type="button" onclick="javascript:window.close();" class="w3-button w3-hover-green w3-ripple w3-margin-top w3-round mybtn">창 닫기</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>