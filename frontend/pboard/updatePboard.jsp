<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 연습용 로그인 세션 -->
<% 
   String memId = (String)session.getAttribute("memId");
   String nickName = (String)session.getAttribute("nickName");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/pboard.js"></script>
</head>


<body>
<%@ include file="/module/header.jsp" %>

<div class="writebody">
		<form action="<%=request.getContextPath()%>/PboardWrite.do"
			method="post" enctype="multipart/form-data">
			<div class="wr_header">
				<h1>마이플레이스 글 수정하기</h1>
			</div>

			<!--이미지 넣기 -->
			<div class="wr_images">
				<div class="text">
					이미지<br> <span>(최대 6개까지 첨부가능)</span>
				</div>

				<div class="img_wrap">
					<input type="file" class="file" id="file" name="img_file">
					<div class="file_background">
						<label for="f1"> <img class="img_up"
							src="<%=request.getContextPath()%>/images/카메라.png">
						</label>
					</div>
				</div>
			</div>


			<div class=title>
				<div class="text">장소명</div>
				<textarea rows="1" cols="155" name="title" placeholder=" 장소명을 입력해주세요"></textarea>
				<input type="hidden" name="memId" value="<%=memId%>">
				<div id="maxTitle">(0 / 70)</div>
			</div>

			<div class="content">
				<div class="text">내용</div>
				<div class="wrc">
					<textarea rows="20" cols="170" name="content"
						placeholder=" 추천 메뉴등 내용을 입력해주세요 !"></textarea>
					<div id="maxContent">(0 / 500)</div>
				</div>
			</div>
			<br><br>
			
			<div class="place">
				<div class="text">장소 검색</div>
					
					
					
			</div>


			<br><br>
			<div class="button">
				<input type="submit" class="upload_btn" value="수정하기">
			</div>

		</form>
	</div>


<%@ include file="/module/footer.jsp" %>
</body>
</html>