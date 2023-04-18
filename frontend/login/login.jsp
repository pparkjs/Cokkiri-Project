<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
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
					window.location.href="<%=request.getContextPath()%>/admin/adminhome.jsp";
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
	
	// 모달창
	// 아이디 버튼 클릭시
	$('.findId').on('click', function() {
		// 모달창 띄우기
		$('#findIdModal').css('display','block');
	})
	// 닫기 버튼 클릭시
	$('#idModalClose').on('click', function() {
		$('#findIdModal').css('display', 'none');
	})
	
	nameCheck = 0;
	// 이름 유효성 검사
	$('#name').on('keyup', function() {
		namevalue = $(this).val().trim();
		namereg = /^[가-힣]{2,5}$/;
		if(!(namereg.test(namevalue))){
			$('#name').css('border', '2px solid rgb(255,59,48)');
			nameCheck = 0;
		} else {
			$('#name').css('border', '2px solid rgb(229,229,234)');
			nameCheck = 1;
		}
		
	})
	
	// 전화번호 전송
	$('#sendMessageBtn').on('click', function() {
		var tel = $('#tel').val();
		console.log(tel);
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
	
	messageCheckCnt = 0;
	// 인증번호 확인
	$('#messageCheckBtn').on('click', function() {
		var messageCheck = $('#messageCheck').val();
		$.ajax({
			url : '<%=request.getContextPath()%>/messageCheck.do',
			type : 'post',
			data : {"messageCheck" : messageCheck},
					
			success : function(res) {
				if(res.result=="true"){
					alert("인증완료");
					messageCheckCnt = 1;
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
	
	$('#idModalSearch').on('click', function() {
		if(messageCheckCnt==0 && nameCheck == 0){
			alert("이름 또는 전화번호 인증이 완료되지 않았습니다.");	
		} else {
			var name = $('#name').val();
			var tel = $('#tel').val();
			$.ajax({
				url : '<%=request.getContextPath()%>/findId.do',
				type : 'post',
				data : {"name" : name,
						"tel": tel},
						
				success : function(res) {
					if(res.result == "true"){
						$('#idModalSearch').hide();
						$('#modalContentId').empty(); //모달창 내용 초기화
						$('#modalContentId').append('<p id="findIdResult" class="findresultOne">'+ res.memId + '<p>')
						
					} else if(res.result == "false"){
						$('#modalContentId').empty(); //모달창 내용 초기화
						$('#modalContentId').append('<p id="findIdResult" class="findresultOne">가입하지 않은 회원입니다.<p>')
						
					}
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
			
		}
		
	})
	
	
	// 비밀번호 찾기
	// 모달창
	// 아이디 버튼 클릭시
	$('.findPw').on('click', function() {
		// 모달창 띄우기
		$('#findPwModal').css('display','block');
	})
	// 닫기 버튼 클릭시
	$('#pwModalClose').on('click', function() {
		$('#findPwModal').css('display', 'none');
	})
	userId = "";
	// 아이디 확인
	$('#pwModalSearch').on('click', function() {
		userId = $('#modalId').val().trim();
		$.ajax({
			url : '<%=request.getContextPath()%>/idcheck.do',
			type : 'post',
			data : {"id" : userId},
			success : function(res) {
				if(res.result=="false"){ // 아이디가 존재할때
					//$('#modalContentPw').html("");
					console.log("dho제발!!!!!!!!");
					$('#modalContentPw').empty(); //모달창 내용 초기화
					var code = "";
					code += '<div class = modalPwRepw>';
					code += '		<div class="mPwBox">';
					code += '			<label for="modalPw">새비밀번호</label>';
					code += '			<input type="password" name="modalPw" id="modalPw" class="modalPw">';
					code += '		</div>';
					code += '		<div class="mRePwBox">';
					code += '			<label for="modalRepw">비밀번호 확인</label>';
					code += '			<input type="password" name="modalRepw" id="modalRepw" class="modalRepw">';
					code += '		</div>';
					code += '		<div id="modalRepwCheck" class="modalRepwCheck"></div>';
					code += '	</div>';
					code += '	<input type="button" value="비밀번호 변경" name="updatePwBtn" id="updatePwBtn" class="nextBen">';
					console.log(code);
					$('#modalContentPw').append(code); // 모달 내용 추가 
					// $('#modalContentPw').html(code);	
				} else {
					alert("없는 아이디 입니다.");
				}
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	$(document).on('keyup', '#modalRepw', function() {
		var modalPw = $('#modalPw').val();
		if(modalPw != $(this).val()){
			$('#modalRepwCheck').text('비밀번호가 일치하지 않습니다.');
			$('#pwModalSearch').attr('disabled', true);
		} else{
			$('#modalRepwCheck').text('');
			$('#pwModalSearch').attr('disabled', false);
		}
		
	})
	
	$(document).on('click', '#updatePwBtn', function() {
		var pw = $('#modalRepw').val();
		console.log("pw" + pw);
		console.log("userId" + userId);
		$.ajax({
			url : '<%=request.getContextPath()%>/memPwUpdate.do',
			type : 'post',
			data : {"pw" : pw,
					"id" : userId},
			success : function(res) {
				if(res.result=="true"){ // 비밀번호가 변경되면 
					$('#modalContentPw').empty(); //모달창 내용 초기화
					$('#modalContentPw').append('<p class = modalPwRepw>비밀번호가 변경되었습니다.</p>');
				} 
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
})

</script>
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

/* 커서포인트 */
.loginbuttondiv button{
	cursor: pointer;
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
		<div class="modalContent" id="modalConId">
			<div class="box">
				<div class="modalBtnBox">
					<img alt="close.png" src="<%=request.getContextPath() %>/images/close.png" class="close" id="idModalClose">
				</div>
				<div id="modalContentId">
					<h3>아이디 찾기</h3>
					<label for="name">이름</label>
					<div class="findIdModalInputId input">
						<input type="text" id="name" class="name">
					</div>
					<label for="tel">휴대전화</label>
					<div class="findIdModalInputTel input">
						<div class="seandMessageBox modalInputBox">
							<input type="text" id="tel" class="tel" name="tel">
							<input type="button" id="sendMessageBtn" class="sendMessageBtn" value="인증번호 받기">
						</div>
						<div class="messageCheckBox modalInputBox">
							<input type="text" id="messageCheck" class="messageCheck" name="messageCheck">
							<input type="button" id="messageCheckBtn" class="messageCheckBtn" value="확인">
						</div>
					</div>
					<input type="button" value="찾기" class="nextBen" id="idModalSearch">
				</div>
			</div>
		</div>
	</div>
	
	<div id="findPwModal" class="modal">
		<div class="modalContent" id="modalConPw">
			<div class="box">
				<div class="modalBtnBox">
					<img alt="close.png" src="<%=request.getContextPath() %>/images/close.png" class="close" id="pwModalClose">
				</div>
				<div id="modalContentPw">
					
					<div class="modalContentPwPW">
						<h3>비밀번호 찾기</h3>
						<label for="modalId">아이디</label>
						<div class="findpwIDInput">
							<input type="text" class="modalId" id="modalId">
						</div>
					</div>
					<input type="button" value="다음" class="nextBen" id="pwModalSearch">
				</div>
			</div>
		</div>
	</div> 
	
	
</div>
<footer>
	<p>Copyright© Cokkiri(주) All rights reserved.</p>
	
</footer>
</div>
</body>
</html>