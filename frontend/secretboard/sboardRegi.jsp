<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<!-- session 테스트용 -->
<% String memId = (String)session.getAttribute("mem_id"); %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/sboardWrite.js"></script>

<script>
fcnt = 1;
mypath = "<%=request.getContextPath() %>";
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
		$('#maxContent').html("("+$(this).val().length+" / 500)");
		
		if($(this).val().length > 500){
			$(this).val($(this).val().substring(0, 500));
			$('#maxContent').html("(500 / 500)");
		}
	})
	
	$('.rg_btn').on('click',function(){
		
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
		
		//파일 미리보기
		$(document).on('change','.file', function(){
	 		readURL(this);
	 		
		})
		
		$(document).on('click','.img_del', function(){
			$(this).parent().next().remove();
			$(this).parent().remove();
			
			if($('.file').length == 6){
				$('.rg_images div:nth-child(12)').css("display", "block");
				return;
			}
		})
		
		//keydown 키보드의 키가 눌렸을때 발생
		$('#ta1').on('keydown', function(event){ 			
			if(event.keyCode === 13){ // 13은 엔터키의 keyCode 값
				event.preventDefault(); // 기본 동작인 줄바꿈을 막는다.
			}
			
			const input = document.getElementById("f1");
			console.log(input.files)
		})
})

</script>
</head>
<body>
 <%@ include file="/module/header.jsp" %>
<div class="con_regist">
	<form action="<%=request.getContextPath()%>/InsertSboard.do" method="post"
		enctype="multipart/form-data">
		<div class="rg_header">
			<h1>비밀게시판 글쓰기</h1>
		</div>
		<!-- 이미지 업로드 -->
		<div class="rg_images">
			<div class="txt">이미지<br><span>(최대 5개까지 첨부가능)</span></div>
			
			<div class="img_wrap1">
				<input type="file" class="file" id="f1" name="img_file1">
				<div class="file_background">
					<label for="f1">
						<img class="img_up" src="<%=request.getContextPath()%>/images/카메라.png">
					</label>
				</div>
			</div>
			
			
		</div>
		
		<div class="rg_title">
			<div class="txt">제목</div>
			<textarea rows="1" id="ta1" name="title" cols="155" placeholder="제목을 입력해주세요."></textarea>
			<div id="maxTitle">(0 / 70)</div>
		</div>
		<div class="rg_content">
			<div class="txt">내용</div>
			<div class="rgc">
				<textarea  id="ta2" name="content" rows="10" cols="168" placeholder="내용을 입력해주세요."></textarea>
				<div id="maxContent">(0 / 500)</div>
			</div>
			<br>
		</div>
		<div class="rg_bottom">
			<input type="button" class="rg_btn" value="등록하기">
		</div>
	</form>
</div>
	
 <%@ include file="/module/footer.jsp" %>	
</body>
</html>