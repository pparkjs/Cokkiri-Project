<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<% 
	MemberVO memVo = (MemberVO)session.getAttribute("memberVo"); 
%>
<head>
<meta charset="UTF-8">
<title>My Place</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/pboardWrite.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=783f45435dd899b6746abc88c415eb86&libraries=services"></script>

</head>

<script>
mypath = "<%=request.getContextPath() %>";
fcnt = 1;

	$(function() {
		
		//제목 글자수 제한
		$('#v1').on('keyup', function(){
			$('#maxTitle').html("("+$(this).val().length+" / 70)");
			
			if($(this).val().length > 70){
				$(this).val($(this).val().substring(0, 70));
				$('#maxTitle').html("(70 / 70)");
			}
		})	
		
		
		//내용 글자수 제한
		$('#v2').on('keyup', function(){
			$('#maxContent').html("("+$(this).val().length+" / 500)");
			
			if($(this).val().length > 500){
				$(this).val($(this).val().substring(0, 500));
				$('#maxContent').html("(500 / 500)");
			}
		})
		
	

		$('.upload_btn').on('click', function() {

			title = $('#v1').val();
			content = $('#v2').val();
//  			address = $('#v3').val();

			econtent = content.replace(/\n/g, "<br>");

			$('#v2').val(econtent);

			if (title != '' && content != '') {
				$('form').submit();

 			} else {
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
		$('#v1').on('keydown', function(event){ 			
			if(event.keyCode === 13){ // 13은 엔터키의 keyCode 값
				event.preventDefault(); // 기본 동작인 줄바꿈을 막는다.
			}
			
			const input = document.getElementById("f1");
			console.log(input.files)
		})
    })   
    
 
</script>



<body>
<%@ include file="/module/header.jsp" %>

	<div class="writebody">
		<form action="<%=request.getContextPath()%>/PboardWrite.do"
			method="post" enctype="multipart/form-data">
			<div class="wr_header">
				<h1>마이플레이스 글쓰기</h1>
			</div>

			<!--이미지 넣기 -->
			<div class="rg_images">
				<div class="text">
					이미지<br> <span>(최대 6개까지 첨부가능)</span>
				</div>

				<div class="img_wrap1">
					<input type="file" class="file" id="f1" name="img_file1">
					<div class="file_background">
						<label for="f1"> <img class="img_up"
							src="<%=request.getContextPath()%>/images/카메라.png">
						</label>
					</div>
				</div>
			</div>


			<div class=title>
				<div class="text">제목</div>
				<textarea rows="1" cols="155" id="v1" name="title" placeholder=" 제목을 입력해주세요"></textarea>
				<input type="hidden" name="memId">
				<div id="maxTitle">(0 / 70)</div>
			</div>

			<div class="content">
				<div class="text">내용</div>
				<div class="wrc">
					<textarea rows="20" cols="170" id="v2" name="content" placeholder=" 추천 메뉴등 내용을 입력해주세요 !"></textarea>
					<div id="maxContent">(0 / 500)</div>
				</div>
			</div>
			<br><br>
			
 			<div class="place" > 
				<div id="clickLatlng" style="border-bottom: 2px solid lightgray;"></div> 
 					<div class="text" style="margin-top: 30px;">장소 검색 
<!--  						<input type="text" id="v1" class="pb_searchplace" name=place placeholder=" 주소를 입력해주세요" style="width:300px; height:30px; ">  -->
					</div>	 
					<div> 
						<input type="submit" class="saveBtn" value="위치 저장하기" style= "margin-left: 1020px; margin-bottom: 20px; border-radius:20px; width:100px; height:30px; background: white;">
					</div> 
			<div id="map" style="width: 60%; height: 400px; margin-left : 300px;"></div> 
			</div>	 
			<br><br>
			<div class="button">
				<input type="button" class="upload_btn" value="등록하기">
			</div>
		 
	 </form>
</div>


<script>
 		var container = document.getElementById('map');
 		var options = {
 			center: new kakao.maps.LatLng(36.350710442653956, 127.38473542742071),
 			level: 5
 		};

 		var map = new kakao.maps.Map(container, options);
</script>



<%@ include file="/module/footer.jsp" %>	
</body>
</html>