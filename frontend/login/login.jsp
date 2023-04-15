<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<%
	// 쿠키에 저장된 아이디 값 읽어오기
	String cookieUserId = ""; // 로그인할 ID가 저장될 변수
	String chk = ""; // checkbox의 check 여부를 지정할 변수
	
	Cookie[] cookieArr = request.getCookies();
	if(cookieArr!=null){
		for(Cookie cookie : cookieArr){
			if("id".equals(cookie.getName()) || "userId".equals(cookie.getName())){
				cookieUserId = cookie.getValue();
				// 쿠키에 id값이 저장되어 있을 경우 체크박스 체크
				chk = "checked";
			}
		}
	}
%>
<script type="text/javascript">

$(function() {	

	$('.loginbutton').on('click', function() {
		var id = $('.id').val().trim();
		var pw = $('.pw').val().trim();
		
		
		// 체크박스의 체크여부값 받아오기
		var idmemory = $('.idmemory').is(':checked');
		
		// Ajax 요청
		$.ajax({
			url : '<%=request.getContextPath()%>/memberLogin.do',
			type : 'post',
			data : {"id" : id, 
					"pw" : pw,
					"idmemory" : idmemory},
			success : function(res){
				if(res.result=="Y"){
					alert("관리자 페이지로 이동 슝");
					//window.location.href="";
				} else if (res.result=="N"){
					window.location.href="<%=request.getContextPath()%>/home/main.jsp";
				} else {
					alert("아이디 또는 비밀번호가 다릅니다.");
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
	// 아이디 버튼 클릭시
	$('.findId').on('click', function() {
		// 모달창 띄우기
		$('#findIdModal').css('display','block');
	})
	// 닫기 버튼 클릭시
	$('.findIdModalClose').on('click', function() {
		$('#findIdModal').css('display', 'none');
	})
	
	// 전화번호 전송
	$('sendMessageBtn').on('click', function() {
		var tel = $('#tel').val();
		
		// Ajax 요청
		$.ajax({
			url : '<%=request.getContextPath()%>/sendMessage.do',
			type : 'post',
			data : {"tel" : tel},
			success : function(res){
				if(res.result == "true"){
					alert("인증 번호를 전송했습니다");
				} else {
					alert("가입되지 않은 전화번호입니다.");
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	// 인증번호 확인
	$('messageCheck').on('click', function() {
		var messageCheck = $('#messageCheck').val();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/messageCheck.do',
			type : 'post',
			data : {"messageCheck" : messageCheck},
					
			success : function(res) {
				if(res.result=="true"){
					alert("인증완료");
				} else {
					alert("인증실패");
					
				}
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	$('#findIdModalNextBen').on('click', function() {
		var name = $('#name').val();
		var tel = $('#tel').val();
		$.ajax({
			url : '<%=request.getContextPath()%>/findId.do',
			type : 'post',
			data : {"name" : name,
					"tel": tel},
					
			success : function(res) {
				$('#ModalContentId').empty(); //모달창 내용 초기화
				$('#ModalContentId').append('<p id="findIdResult">'+ res.resultId + '<p>')
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
})

</script>
<link rel="stylesheet" type="text/css" href="../css/loginform.css">
<style type="text/css">
@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

.logintoptest {
	margin-left: 3px;
	margin-right: 3px;
	margin-bottom: 5px;
}

.logontext{
	font-size: 18px;
	font-weight: 700;
}

.findmemIDPW{
	font-size: 12px;
	font-weight: 700;
	float : right;
	margin-top: 3px;
	opacity: 0.5;
}

form {
	margin-top: 9px;
}

button:active {
	outline: none;
	box-shadow: none;
}

.iddiv input,.passdiv input,.loginbuttondiv button{
	height: 44px;
	width: 100%;
	padding : 10px 14px;
	font-size: 16px;
	font-weight: 400;
	box-sizing: border-box;
}

.loginbox input::placeholder {
	color : rgb(199, 199, 204);
}

.iddiv input{
	width : 100%;
	border : 2px solid rgb(229, 229, 234);
	border-radius: 10px 10px 0px 0px;
	
}
.passdiv input{
	border-radius: 0px 0px 10px 10px;
	border : 2px solid rgb(229, 229, 234);
	border-top: 0px;
}

.loginbuttondiv button {
	margin-top : 9px;
	width : 100%;
	background : rgb(56, 102, 223);
	border-radius: 10px;
	color : white;
	border: none;
}

.loginother {
	margin-top: 12px;
}

.loginother p,.loginother ul{
	margin: 0;
}

.loginother p{
	display: inline-block;
	font-size: 12px;
	font-weight: 700;
	padding-top: 14px;
	float: left;
	opacity: 0.5;
}

.loginother{
	width : 100%;
	position: relative;
}

.loginother .idmemory {
	margin: 0 5px 0 0;
	width : 18px;
	height: 18px;
}

.loginother  span {
	position: absolute;
	top : -2px;
	font-size: 14px;
	
}
input:focus {outline:none;}

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999;
}

.modal-content {
	width: 300px;
	background-color: #fff;
	margin: 100px auto;
	padding: 20px;
}
</style>
</head>
<body>

<div class="root">

<nav>
	<img src="../images/코끼리로고심볼가로.png" id="cokkirilogo">
	<input type="button" value="회원가입" id="memUpdate" onclick="location.href='<%=request.getContextPath() %>/login/memberInsert.jsp'">
</nav>
<div class="main">
	<div class="loginbox">
		<div class="logintoptest">
			<span class="logontext">로그인</span>
			<div class="findmemIDPW">
				<span class="findId">아이디찾기</span>
				<span> | </span>
				<span class="findPw">비밀번호찾기</span>
			</div>
		</div>
			<div class="iddiv">
				<input type="text" name="id" placeholder="아이디" class="id" value="<%=cookieUserId%>">
			</div>
			<div class="passdiv">
				<input type="password" name="pw" placeholder="비밀번호" class="pw">
			</div>
			<div class="loginbuttondiv">
				<button type="submit" class="loginbutton">로그인</button>
			</div>
		<div class="loginother">
			<input type="checkbox" class="idmemory" name="idmemory" <%=chk %>><span>아이디 기억하기 </span>
		</div>
	</div>
	
	<!-- Modal -->
	<div id="findIdModal" class="modal">
		<div class="modalContent">
			<div class="ModalContentId">
				<h3>아이디 찾기</h3>
				<label for="name">이름</label>
				<div class="findIdModalInputId">
					<input type="text" id="name" class="name">
				</div>
				<label for="tel">휴대전화</label>
				<div class="findIdModalInputTel">
					<input type="text" id="tel" class="tel">
					<input type="button" id="sendMessageBtn" class="sendMessageBtn" value="인증번호 받기">
					
					<input type="text" id="messageCheck" class="messageCheck">
					<input type="button" id="messageCheckBtn" class="messageCheckBtn" value="확인">
				</div>
			</div>
			<input type="button" value="찾기" class="findIdModalClose">
			<input type="button" value="닫기" class="findIdModalNextBen">
		</div>
	</div>
	
	<div id="findPwModal" class="modal">
		<div class="modalContent" id="modalContentPw">
			<div class="ModalContentPw">
				<h3>비밀번호 찾기</h3>
				<label for="modalId">아이디</label>
				<input type="text" class="modalId" id="modalId">
			</div>
			<input type="button" value="찾기" class="findIdModalClose">
			<input type="button" value="닫기" class="findIdModalNextBen">
		</div>
	</div>
	
	
</div>
<footer>
	<p>Copyright© Cokkiri(주) All rights reserved.</p>
	
</footer>
</div>
</body>
</html>