<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/adminStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>

<script>
$(function(){
	//제목 글자수 제한
	$('#ta1').on('keyup', function(){
		$('#maxTitle').html("("+$(this).val().length+" / 70)");
		
		if($(this).val().length > 70){
			$(this).val($(this).val().substring(0, 70));
			$('#maxTitle').html("(70 / 70)");
		}
	})
	
	//내용 글자수 제한
	$('#ta2').on('keyup', function(){
		$('#maxContent').html("("+$(this).val().length+" / 1000)");
		
		if($(this).val().length > 1000){
			$(this).val($(this).val().substring(0, 1000));
			$('#maxContent').html("(1000 / 1000)");
		}
	})
	
	$('.notice_btn').on('click',function(){
		
		title = $('#ta1').val();
		
		content = $('#ta2').val();
		econtent = content.replace(/\n/g, "<br>");
		
		$('#ta2').val(econtent);
		
		if(title != '' && content != ''){
			$('form').submit();
						
		}else{
			alert("제목 또는 내용을 입력하세요.")
		}
		
		})
		
				//keydown 키보드의 키가 눌렸을때 발생
		$('#ta1').on('keydown', function(event){ 			
			if(event.keyCode === 13){ // 13은 엔터키의 keyCode 값
				event.preventDefault(); // 기본 동작인 줄바꿈을 막는다.
			}

		})
	})
	
</script>
</head>
<body>
 <%@ include file="/module/adminHeader.jsp" %>
 <div class="con_notice">
	<form action="<%=request.getContextPath()%>/NoticeInsert.do" method="post">
		<div class="notice_header">
			<h1>공지사항 글쓰기</h1><br>
		</div>
		
		<div class="notice_title">
			<div class="txt">제목</div>
			<textarea rows="1" id="ta1" name="title" cols="155" placeholder="제목을 입력해주세요."></textarea>
			<div id="maxTitle">(0 / 70)</div>
		</div>
		<div class="notice_content">
			<div class="txt">내용</div>
			<div class="ntc">
				<textarea  id="ta2" name="content" rows="25" cols="168" placeholder="내용을 입력해주세요."></textarea>
				<div id="maxContent">(0 / 1000)</div>
			</div>
			<br>
		</div>
		<div class="notice_bottom">
			<input type="button" class="notice_btn" value="등록하기">
		</div>
	</form>
</div>
 <%@ include file="/module/footer.jsp" %>
</body>
</html>