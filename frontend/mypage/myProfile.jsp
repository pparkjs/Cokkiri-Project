<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<% MemberVO memVo = (MemberVO)session.getAttribute("memberVo"); %>
<style type="text/css">
body * {
	box-sizing: border-box;
}
.container #banner{
	height: 125px;
}
.container #banner h1 {
	text-align: center;
}

#profileContainer {
	width : 374px;
	margin : 0 auto;
	
}
.profile {
	position: relative;
}
.profileImgBox img {

	display: inline-block;
	width: 250px;
	height: 250px;
	border-radius: 50%;
	margin: 0 auto;
}

.camara img{
	width : 50px;
	height : 50px;
	box-shadow: 0 0 5px 2px rgb(209,209,214);
	border-radius: 50%;
}
.camara {
	position: absolute;
    bottom: 0;
    right: 80px;
}

.profile #profileImg {
	display: block;
	width : 250px;
	height: 250px;
	border-radius: 50%;
	margin: 0 auto;
}
#profileContainer {
	margin-bottom: 50px;
}
.inputbox:not(:first-child) {
	margin-top: 20px;
	
}

.row {
	position: relative;

}
.row:not(:first-child) {
	margin-top: 25px;

}
.row input {
	margin-top: 5px;
	width: 374px;
    padding: 12px;
    font-size: 14px;
    font-weight: 400;
    border-radius: 10px;
    border: 2px solid rgb(209, 209, 214);
    color : rgb(28,28,30);
}
#submitBtn {
	margin-top: 25px;
	width: 374px;
    padding: 12px;
    font-size: 14px;
    font-weight: 400;
    border-radius: 10px;
    border: none;
    background-color : rgb(56,102,233);
    color : white;
}
.row label {
    font-size: 14px;
    font-weight: 600;
    color : rgb(28,28,30);
}
.repwbox {
	margin-top: 10px;
}
.mckeckText, .check {
	font-size: 14px;
	color : rgb(255,59,48);
	margin-bottom: 15px;
    margin-top: 5px;
}
#ranMessageCheck{
	font-size: 14px;
	
}
.row_btn2 input[type=text]{
	width : 247px;
	margin-right: 3px;
}
.row_btn2 input[type=button]{
	width : 120px;
	border: none;
	cursor: pointer;
}

</style>
<script type="text/javascript">
mypath = `<%=request.getContextPath() %>`;
memId = `<%=memVo.getMem_id()%>`;
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
            document.getElementById("add").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}


$(function() {
	$('#file').change(function(event) {
		console.log('제빌');
	    file = event.target.files[0];
	    $('#profileImg').attr('src', URL.createObjectURL(file));
	});
	
	$('#submitBtn').on('click', function() {
		console.log("asd")
		name = $('#name').val().trim();
		nickname = $('#nickname').val().trim();
		add = $('#add').val().trim();
		var namecheck = $('#namecheck').text().trim();
		
		if(name != "" && nickname!="" && add !="" && namecheck == ""){
			$("#updateForm").get(0).submit();
		} else {
			alert("이름, 닉네임, 주소를 입력하지 않았거나 닉네임이 중복됩니다.");		
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
	
	$('#name').on('keyup', function() {
		namevalue = $(this).val().trim();
		namereg = /^[가-힣]{2,5}$/;
		if(!(namereg.test(namevalue))){
			$('#namecheck').text('한글만 입력 가능합니다.').css('color', 'red');
		} else {
			$('#namecheck').text('');
		}
		
	})
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
			url : '<%=request.getContextPath()%>/sendMessage.do',
			type : 'post',
			data : {"tel" : tel},
			success : function(res){
				if(res.result == "true"){
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
})
</script>
</head>
<body>
<!-- header -->
<%@ include file="/module/header.jsp" %>
               
<!-- container 시작 -->
<div class="container">
	<div id="banner">
		<h1>My 프로필</h1>
	</div>
	<section>
		
		
		<!-- 게시판 리스트 -->
		<div id="profileContainer">
			<form action="<%=request.getContextPath()%>/memberUpdate.do" method="post" id="updateForm" enctype="multipart/form-data">
				<div class="profile">
					<div class="profileImgBox">
					<%
					String src=request.getContextPath()+"/images/기본프로필.png";
					if(memVo.getMem_image()!=null){
						src=request.getContextPath()+"/profileImageView.do";
					}
						%>
						<img id="profileImg" alt="userProfile" src="<%=src%>">
					</div>
					
					<div class="camara">
						<label for="file"><img alt="" src="<%=request.getContextPath()%>/images/카메라 동그랗게.png" id="profileCamaraImg"></label>
						<input type="file" name="File" id="file" style = "display : none">
					</div>
				</div>
				<div class="inputbox">
					<div class="row">
						<label for="name">이름</label>
						<input type="text" name="name" value="<%=memVo.getMem_name()%>" id="name">
						<div id="namecheck" class="check"></div>
					</div>
					<div class="row">
						<label for="nickname">닉네임</label>
						<input type="text" name="nickname" value="<%=memVo.getMem_nickname()%>" id="nickname">
						<div id="nicknamecheck" class="check"></div>
					</div>
					<div class="row row_btn2">
						<div class="label">
							<label for="add">주소</label>
						</div>
						<div class="inputTextAndButton"">
							<input type="text" name="add" value="<%=memVo.getMem_add()%>" id="add">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</div>
							
					</div>
					<div class="row  row_btn2">
						<div class="label">
							<label for="tel">휴대전화</label>
						</div>
						<div class="inputTextAndButton">
							<input type="text" placeholder="전화번호" name="tel" id="tel">
							<input type="button" value="인증번호 받기" name="sendMessage" id="sendMessage">
						</div>
						<p class="mckeckText">숫자만 입력해주세요.</p>
						<div class="inputTextAndButton"">
							<input type="text" placeholder="인증번호 입력" name="messageCheck" id="messageCheck">
							<input type="button" value="확인" name="messageCheckBtn" id="messageCheckBtn">
						</div>				
						<div id="ranMessageCheck" class="check"></div>
					</div>
				</div>
				<input type="button" value="변경완료" id="submitBtn">
			</form>
		</div>
	</section>
</div>
 	
<!-- footer -->
<%@ include file="/module/footer.jsp" %>	
</body>
</html>