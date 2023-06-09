<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%

%>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            var extvalue = ''; // 참고항목에 저장될 값

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            	//addr = data.jibunAddress;
            	 var split_addr = data.jibunAddress.split(' '); // 공백 기준으로 주소를 분리
                 addr = split_addr[0] + ' ' + split_addr[1] + ' ' + split_addr[2]; // 동까지만 주소 변수에 저장
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
            	 var split_addr = data.jibunAddress.split(' '); // 공백 기준으로 주소를 분리
                 addr = split_addr[0] + ' ' + split_addr[1] + ' ' + split_addr[2]; // 동까지만 주소 변수에 저장
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
            
            } else {
                // document.getElementById("sample6_extraAddress").value = '';
            	extvalue = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}



$(function() {
	inputcheck = 0;
	
	nowYear = new Date().getFullYear();
	for (var i=nowYear; i>nowYear-100; i--){
		$('#year').append('<option value="' + i + '">' + i + '년' + '</option>');
		if(i==nowYear-1){
			$('#year').append('<option value="' + i + '" selected>' + i + '년' + '</option>');
		}
	}
	for (var i=1; i<13; i++) {
	    $('#month').append('<option value="' + i + '">' + i + '월'  + '</option>');
		if(i==1){
			$('#month').append('<option value="' + i + '" selected>' + i + '월'  + '</option>');
		}
	}
	for (var i=1; i<32; i++) {
	    $('#day').append('<option value="' + i + '">' + i + '일'  + '</option>');
		if(i==1){
			$('#day').append('<option value="' + i + '" selected>' + i + '일'  + '</option>');
		}
	}
	
	sendMessageCode = "";
	$('#tel').on('keyup', function() {
		var telvalue = $('#tel').val();
		telreg = /^[0-9]{11}$/;
		if(!(telreg.test(telvalue))){
			$('#sendMessage').attr('disabled', true);
		} else {
			$('#sendMessage').removeAttr('disabled');
			
		}
		
	})
	
	$('#sendMessage').on('click', function() {
		var tel = $('#tel').val();
		
		// Ajax 요청
		$.ajax({
			url : '<%=request.getContextPath()%>/InsertSendMessage.do',
			type : 'post',
			data : {"tel" : tel},
			success : function(res){
				if(res.result == "false"){
					alert("인증 번호를 전송했습니다");
				} else {
					alert("이미 가입된 전화번호입니다.");
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	messageCheck = 0;
	$('#messageCheckBtn').on('click', function() {
		messageCheck = $('#messageCheck').val();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/messageCheck.do',
			type : 'post',
			data : {"messageCheck" : messageCheck},
					
			success : function(res) {
				if(res.result=="true"){
					$('#ranMessageCheck').text('인증완료').css('color','green');
					messageCheck = 1;
				} else {
					
					$('#ranMessageCheck').text('인증실패').css('color','red');
				}
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	$('#reload').on('click', function() {
		$.ajax({
			url : '<%=request.getContextPath()%>/captchaImg.do',
			type : 'post',
			data : {
					"width" : "450",
					"height" : "100"},
					
			success : function(data) {
				// JSON 데이터 파싱
				var captchaImage = data.base64Image;

			    // 이미지 추가
			    $('#captchaImg').attr('src', 'data:image/png;base64,' + captchaImage);
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	$.ajax({
		url : '<%=request.getContextPath()%>/captchaImg.do',
		type : 'post',
		data : {
				"width" : "450",
				"height" : "100"},
				
		success : function(data) {
			// JSON 데이터 파싱
			var captchaImage = data.base64Image;

		    // 이미지 추가
		    $('#captchaImg').attr('src', 'data:image/png;base64,' + captchaImage);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	
	imgCheck = 0;
	$('#imgNumCheckBtn').on('click', function() {
		var imgNumInput = $('#imgNumInput').val();
		$.ajax({
			url : "<%=request.getContextPath()%>/imgNumCheck.do",
			type : 'post',
			data : {"imgNumInput" : imgNumInput},
			success : function(res) {
				if(res.result == "true"){
					$('#imgnumCheck').text('인증 완료').css('color','green');
					imgCheck = 1;
				} else {
					$('#imgnumCheck').text('입력값이 일치하지 않습니다.').css('color','red');
					
				}
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	
	
	// 데이터 유효성 체크
	$('#id').on('keyup', function() {
		idvalue = $(this).val().trim();
		idreg = /^[a-z0-9!@#$*+=]{5,10}$/;
		if(!(idreg.test(idvalue))){
			$('#idcheck').text('5~10자의 영문 소문자, 숫자와 특수기호 (!@#$*_+-=)만 사용 가능합니다.').css('color', 'red');
		} else {
			$.ajax({
				url : "<%=request.getContextPath()%>/idcheck.do",
				type : 'post',
				data : {"id" : idvalue},
				success : function(res) {
					if(res.result == "true"){
						$('#idcheck').text('');
					} else {
						$('#idcheck').text('id가 중복됩니다.').css('color', 'red');
					}
					
					console.log(idvalue);
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
			
		}
		
	})

	passvalue="";
	$('#pass').on('keyup', function() {
		passvalue = $(this).val().trim();
		passreg = /^[a-zA-Z0-9!@#$^*()~`_+=<,>.?/-]{8,15}$/;
		if(!(passreg.test(passvalue))){
			$('#passcheck').text('8~15자의 영문 소문자, 대문자, 숫자와 특수기호 (!@#$^*()~`_-+=<,>.?/)만 사용 가능합니다.').css('color', 'red');
		} else {
			$('#passcheck').text('');
		}
		
	})
	$('#repass').on('keyup', function() {
		repassvalue = $(this).val().trim();
		if(passvalue == repassvalue){
			$('#repasscheck').text('');
		} else {
			$('#repasscheck').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
		}
		
	})
	
	$('#name').on('keyup', function() {
		namevalue = $(this).val().trim();
		namereg = /^[가-힣]{2,5}$/;
		if(!(namereg.test(namevalue))){
			$('#namecheck').text('한글만 입력 가능합니다.').css('color', 'red');
		} else {
			$('#namecheck').text('');
		}
		
	})
	
	$('#nickname').on('keyup', function() {
		nicknamevalue = $(this).val().trim();
		nicknamereg = /^[a-zA-Z0-9가-힣]{1,10}$/;
		if(!(nicknamereg.test(nicknamevalue))){
			$('#nicknamecheck').text('1~10자의 한글, 영문, 숫자만 사용 가능합니다.').css('color', 'red');
		} else {
			$.ajax({
				url : "<%=request.getContextPath()%>/nicknamecheck.do",
				type : 'get',
				data : {"nicknamevalue" : nicknamevalue},
				success : function(res) {
					if(res.result == "true"){
						$('#nicknamecheck').text('');
					} else {
						$('#nicknamecheck').text('닉네임이 중복됩니다.').css('color', 'red');
					}
					
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
		}
		
	})
	
	$('#email').on('blur', function() {
		emailvalue = $(this).val().trim();
		emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(!(emailreg.test(emailvalue))){
			$('#emailcheck').text('올바른 형식으로 입력해 주세요').css('color', 'red');
		} else {
			// 이메일 (7)
			$('#emailcheck').text('');
			inputcheck = inputcheck+1;
			console.log("이메일" +inputcheck);
		}
		
	})
	
	
	$('#memJoinBtn').on('click', function() {
		var id = $('#id').val().trim();
		var pass = $('#pass').val().trim();
		var repass = $('#repass').val().trim();
		var name = $('#name').val().trim();
		var nickname = $('#nickname').val().trim();
		var email = $('#email').val().trim();
		var sample6_address = $('#sample6_address').val().trim();
		
		var inputtag = id + pass + repass + name + nickname + email + sample6_address;
		
		var idcheck = $('#idcheck').text().trim();
		var passcheck = $('#passcheck').text().trim();
		var repasscheck = $('#repasscheck').text().trim();
		var namecheck = $('#namecheck').text().trim();
		var nicknamecheck = $('#nicknamecheck').text().trim();
		var emailcheck = $('#emailcheck').text().trim();
		
		var checkText = idcheck + passcheck + repasscheck + namecheck + nicknamecheck;
		
		if(inputtag != "" && checkText == "" && messageCheck==1 && imgCheck==1){
			$('#joinForm').submit();
		} else {
			alert("입력 잘해!!!")
		}
	})	
	
	
})

</script>
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);* { 
 font-family: 'Noto Sans KR', sans-serif;
}
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
	box-sizing: border-box;
	/* border : 1px solid blue; */
}

input:focus {
	outline: none;
	box-shadow: none;
}
.container {
	margin: 0 auto;
	width : 400px;
	position: relative;
}

.container .logoContainer{
	padding-top : 70px;
	text-align: center;
	
}
.container .logo{
	display : inline-block;
	width : 200px;
}

.joinRow:not(:first-of-type){
	margin-top: 25px;
}

.form-input{
	padding : 12px;
	font-size : 14px;
	border: none;
	height: 100%;
	width: 100%;
	box-sizing: border-box;
}

.joinRow input{
	border: 1px solid rgb(209, 209, 214);
	border-radius: 5px;
}

.joinRow .joinRepsRow{
	margin-top: 15px;
}
.joinRow .label{
	margin-bottom: 6px;
}

.joinRow label {
	font-weight: 500;
	font-size: 14px;
	color : rgb(58,58,60);
}

/* 생년월일 */
.joinRow .birbox{
	display: flex;
	justify-content: space-between;
}

.birbox select{
	width: 130px;
	vertical-align: middle;
	padding: 12px;
	border: 1px solid rgb(209, 209, 214);
	border-radius: 5px;
}


/* 성별 */
.gender select {
	width: 130px;
	padding: 12px;
	border: 1px solid rgb(209, 209, 214);
	border-radius: 5px;

}
.inputTextAndButton {
	display: flex;
	justify-content: space-between;
}
.inputTextAndButton input:nth-child(1){
	padding : 12px;
	font-size : 14px;
	border: none;
	height: 100%;
	width: 264px;
	box-sizing: border-box;
	border: 1px solid rgb(209, 209, 214);
}
.inputTextAndButton input:nth-child(2){
	padding : 12px;
	font-size : 14px;
	border: none;
	height: 100%;
	width: 130px;
	box-sizing: border-box;
}

/* 자동가입방지 이미지 */
.inputImgAndButton {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}
.inputImgAndButton img{
	padding : 12px;
	font-size : 14px;
	border: none;
	height: 100%;
	width: 300px;
	box-sizing: border-box;
	border: 1px solid rgb(209, 209, 214);
	border-radius: 5px;
}
.inputImgAndButton input{
	padding : 12px;
	font-size : 14px;
	border: none;
	height: 100%;
	width: 93px;
	box-sizing: border-box;
	justify-content: center;
}

.membJoinContainer input {
	height: 100%;
	width: 100%;
	padding: 12px;
	border: none;
	border-radius: 1233px;
	background: rgb(56,102,233);
	color: white;
	font-size: 14px;
}

.check{
	margin-top: 5px;
	font-size: 14px;
}
.check{
	margin-top: 5px;
	font-size: 14px;
}

/* 커서포인터 */
.inputTextAndButton input:nth-child(2), .inputImgAndButton input,.membJoinContainer input {
	cursor: pointer;
}
.joinRow p {
	margin-top: 3px;
    font-size: 14px;
    color: rgb(255,59,48);
}

}
</style>
</head>
<body>
<form action="<%=request.getContextPath()%>/memberInsert.do" method="post" id="joinForm">
<div class="container">
	<div class="logoContainer">
		<img src="<%=request.getContextPath()%>/images/코끼리로고심볼가로.png" alt="CokkiriLogo.jsp" class="logo">
	</div>
	
	<div class="joinRow">
		<div class="label">
			<label for="id">아이디</label>
		</div>
		<input type="text" name="id" id="id" class="form-input">
		<div id="idcheck" class="check"></div>
	</div>
	
	<div class="joinRow">
		<div class="joinPsRow">
			<div class="label">
				<label for="pass">비밀번호</label>
			</div>
			<input type="password" name="pass" id="pass" class="form-input">
			<div id="passcheck" class="check"></div>
		</div>
		
		<div class="joinRepsRow">
			<div class="label">
				<label for="repass">비밀번호 확인</label>
			</div>
			<input type="password" name="repass" id="repass" class="form-input">
			<div id="repasscheck" class="check"></div>
		</div>
	</div>
	
	<div class="joinRow" >
		<div class="label">
			<label for="name">이름</label>
		</div>
		<input type="text" name="name" id="name" class="form-input">
	</div>
		<div id="namecheck" class="check"></div>
	
	<div class="joinRow" id="nicknamebox">
		<div class="label">
			<label for="nickname">닉네임</label>
		</div>
		<input type="text" name="nickname" id="nickname" class="form-input">
		<div id="nicknamecheck" class="check"></div>
	</div>
	
	<div class="joinRow">
		<div class="label">
			<label>생년월일</label>
		</div>
		<div class="birbox">
			<select id="year" class="bir" name="year">
			</select>
			<select id="month" class="bir" name="month">
			</select>
			<select id="day" class="bir" name="day">
			</select>
		</div>
	</div>
	
	<div class="joinRow gender">
		<div class="label">
			<label>성별</label>
		</div>
		<select id="gender" class="gender" name="gender">
			<option value="M" selected>남</option>
			<option value="F" selected>여</option>
		</select>
	</div>
	
	<div class="joinRow">
		<div class="label">
			<label for="email">이메일</label>
		</div>
		<input type="text" placeholder="이메일" name="email" id="email" class="form-input">
		<div id="emailcheck" class="check"></div>
	</div>
	
	<div class="joinRow" id="">
		<div class="label">
			<label for="tel">휴대전화</label>
		</div>
		<div class="inputTextAndButton">
			<input type="text" placeholder="전화번호" name="tel" id="tel">
			<input type="button" value="인증번호 받기" name="sendMessage" id="sendMessage">
		</div>
		<p>숫자만 입력해주세요.</p>
		<div class="inputTextAndButton"">
			<input type="text" placeholder="인증번호 입력" name="messageCheck" id="messageCheck">
			<input type="button" value="확인" name="messageCheckBtn" id="messageCheckBtn">
		</div>
		<div id="ranMessageCheck" class="check"></div>
	</div>
	
	<div class="joinRow" id="">
		<div class="label">
			<label for="captchaImg">자동로그인 방지</label>
		</div>
		<div class="inputImgAndButton">
			<img id="captchaImg" src="" alt="자동가입방지문자"> 
			<div id="ccaudio" style="display:none"></div>
			<input id="reload" type="button" onclick="" value="새로고침"/>
		</div>
		<div class="audioCptcha"></div>
		<div class="inputTextAndButton"">
			<input id="imgNumInput" type="text" value="">
			<input id="imgNumCheckBtn" type="button" value="확인"/>
		</div>
		<div id="imgnumCheck" class="check"></div>
	</div>
	
	
	
	<div class="joinRow" id="addrbox">
		<div class="label">
			<label for="sample6_postcode">우편번호</label>
		</div>
		<div class="inputTextAndButton"">
			<input type="text" id="sample6_address" placeholder="주소" class="form-input" name="addr">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</div>
		
	</div>
	
	<div class="joinRow membJoinContainer">
		<input type="button" value="가입하기" id="memJoinBtn" > 
	</div>
</div>
</form>
</body>
</html>