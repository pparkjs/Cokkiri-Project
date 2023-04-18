<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% 
   String memId = (String)session.getAttribute("memId");
   String nickName = (String)session.getAttribute("nickName");
%>
<head>
<meta charset="UTF-8">
<title>My Place</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/pboard.js"></script>
</head>
 

<script>
memId = `<%=memId%>`;
more = 0;
mypath = "<%=request.getContextPath()%>";

$(function(){
	
	pboardListServer(0);
		
	$('.morebtn').on('click',function(){
		more = more + 1;
		pboardListServer(more);
	})	
	
	
})

</script>

<body>
<%@ include file="/module/header.jsp" %>

	<div class="container">
		<div class="box">
			<div class="texbox"><h1 class="quote" style="text-align: center; font-size:25px; margin-top: 30px;">우리 지역 맛집, 우리끼리 </h1></div>
			<div class="header">
				<select class="pb_type">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="place">장소</option>
				</select> <input type="text" class="pb_search" placeholder="  search">
				<img id="search" src="<%=request.getContextPath()%>/images/돋보기.png">
				<a href="<%=request.getContextPath()%>/pboard/pboardwrite.jsp">
					<img id="write" src="<%=request.getContextPath()%>/images/글쓰기.png">
				</a>
			</div>
			<!-- DB에서 가져오기 -->
			<div class="pmain">


				<div class="pboard"></div>
			</div>

			<div class="viewMore">
				<img class="morebtn"
					src="<%=request.getContextPath()%>/images/더보기버튼.png">
			</div>

		</div>
	</div>

	<%@ include file="/module/footer.jsp" %>

 	
</body>
</html>