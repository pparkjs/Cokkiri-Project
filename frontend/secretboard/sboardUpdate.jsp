<%@page import="vo.SboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<% List<SboardVO> sbList = (List<SboardVO>)session.getAttribute("sbList"); %>
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
		
		$('#ta1').val(title);
		$('#ta2').val(econtent);
		
		if(title != '' && content != ''){
			$('form').submit();
						
		}else{
			alert("제목 또는 내용을 입력하세요.")
		}
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
			
		})
		
		fileAdd() //이미지 url을 파일 객체로 만드는 메서드 호출 
		
		//파일 미리보기 메서드 호출
		$(document).on('change','.file', function(){
	 		readURL(this);
		})
		
		
		
		content = "<%=sbList.get(0).getSboard_content()%>"
		
		econtent = content.replace(/<br>/g, "\n");
		
		$('#ta1').val("<%=sbList.get(0).getSboard_title()%>")
		$('#ta2').val(econtent);
		
})

function fileAdd() {
	// 이미지 URL을 담을 배열 생성 - XMLHttpRequest()가 순서에 상관없이 내보내기에 순서대로 출력하기위함
	const imgUrls = [];

	<%
	for(SboardVO vo : sbList){
	%>
	if("<%= vo.getSimg_origin_name() %>" !== "null") {
	  const url = "<%=request.getContextPath() %>/SimageSrcView.do?imgName=<%=vo.getSimg_save_name() %>";
	  imgUrls.push(url); // 배열에 URL 추가
	}
	<%
	}
	%>
	
	// URL 배열에서 이미지를 순서대로 가져와 출력
	for (let i = 0; i < imgUrls.length; i++) {
	  code = `<div class="img_div" id="img_div${fcnt}">
			      <img class="img" id="img${fcnt}" src="${imgUrls[i]}" alt="image">
			      <img class="img_del" src="<%=request.getContextPath()%>/images/x마크.png">
			  </div>`;
	  $('.img_wrap'+fcnt).before(code);
	//기존에 있던 img_wrap을 숨기고 새로운 img_wrap을 만들자
		$('.img_wrap'+fcnt).css("display", "none");
		
		//새로운 img_wrap 생성
		vwrap = `<div class="img_wrap${fcnt+1}">
					<input type="file" class="file" id="f${fcnt+1}" name="img_file${fcnt+1}">
					<div class="file_background">
						<label for="f${fcnt+1}">
							<img class="img_up" src="<%=request.getContextPath()%>/images/카메라.png">
							</label>
						</div>
					</div>`;
		//첨부한img 뒤에 추가
		$('.rg_images').append(vwrap);
	   fcnt = fcnt + 1;
	  
	   const url = imgUrls[i];
	   console.log("url: ", url);
	   const xhr = new XMLHttpRequest();
	   xhr.open('GET', url, true);
	   xhr.responseType = 'blob';
	   xhr.onload = function() {
	     if(xhr.status === 200) {
	       const ext = url.split(".").pop(); // 이미지 타입을 추출
	       const filename = url.split("_").pop(); //이미지 이름을 추출
	       const metadata = { type: `image/${ext}` }; 
	       const imgFile = new File([xhr.response], filename, metadata);
	       const input = document.getElementById("f"+(i + 1));
	       console.log(filename)
	       const dt = new DataTransfer();
	       dt.items.add(imgFile);
	       input.files = dt.files;
	       console.log(input.files)
	     }
	   };
	  xhr.send();
	}
}
</script>
</head>
<body>
 <%@ include file="/module/header.jsp" %>
<div class="con_regist">
	<form action="<%=request.getContextPath()%>/SboardUpdate.do?sboardId=<%=sbList.get(0).getSboard_id() %>" method="post"
		enctype="multipart/form-data">
		<div class="rg_header">
			<h1>비밀게시판 게시글 수정</h1>
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
			<input type="button" class="rg_btn" value="수정하기">
		</div>
	</form>
</div>
	
 <%@ include file="/module/footer.jsp" %>	
</body>
</html>