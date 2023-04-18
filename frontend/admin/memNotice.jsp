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
<script src="<%=request.getContextPath() %>/js/noticeboard.js"></script>

<script>
mypath = `<%=request.getContextPath() %>`;
currentPage = 1;
$(function(){

	listPageServer(1);// 맨처음 페이지 1 선택
	
	// 다음 버튼 클릭
	$(document).on('click', '.next', function(){
		//pageno의 마지막요소에 + 1
		currentPage = parseInt($('.pageno').last().text().trim()) + 1;
		
		listPageServer(currentPage)// 다음 누르면 해당 end페이지에서 +1
	});
	
	//이전클릭
	$(document).on('click', '.prev', function(){
		
		currentPage = parseInt($('.pageno').first().text().trim()) - 1
		
		listPageServer(currentPage);
	})
	
		// 페이지 번호
	$(document).on('click', '.pageno', function(){
		
		currentPage = $(this).text().trim();
		
		listPageServer(currentPage);
	})
	
		// 검색 search클릭
	$('#search').on('click', function(){
		currentPage = 1;
		listPageServer(currentPage); // search할때는 페이지가 1번째로 가야함
	})
	
	
})
</script>
</head>
<body>
 <%@ include file="/module/header.jsp" %>
 <div class="con_notice">
 	<div class="con_notice_header">
 		<input type="text" class="notice_search" placeholder="제목 검색">
		<img id="search" src="<%=request.getContextPath()%>/images/돋보기.png">
		<a href="<%=request.getContextPath()%>/admin/noticeRegi.jsp">
			<img id="regi" src="<%=request.getContextPath()%>/images/글쓰기.png">
		</a>
 	</div>
 	<div class="con_notice_main">
<!-- 	 	<table class="notice_table"> -->
<!-- 	 		<tr> -->
<!-- 	 			<th>제목</th> -->
<!-- 	 			<th class="notice_writer">작성자</th> -->
<!-- 	 			<th class="notice_date">작성일</th> -->
<!-- 	 		</tr> -->
<!-- 	 	</table> -->
 	</div>
 	<div class="notice_page">
<!--  		<ul class="pagination"> -->
<!--  			<li id="prev_li" class="page"><a class="prev" href="#">&lt; 이전</a></li> -->
<!--  			<li class="page active"><a class="pageno" href="#">1</a></li> -->
<!--  			<li class="page"><a class="pageno" href="#">2</a></li> -->
<!--  			<li class="page"><a class="pageno" href="#">3</a></li> -->
<!--  			<li id="next_li" class="page"><a class="next" href="#">다음 &gt;</a></li> -->
<!--  		</ul> -->
 	</div>
 </div>
 <%@ include file="/module/footer.jsp" %>
</body>
</html>