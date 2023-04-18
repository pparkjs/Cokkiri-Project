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
<script src="<%=request.getContextPath() %>/js/manage.js"></script>

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
 <%@ include file="/module/adminHeader.jsp" %>
 <div class="con_memManage">
 	<div class="con_memManage_header">
 		<input type="text" class="memManage_search" placeholder="전체 사용자 검색(닉네임)">
		<img id="search" src="<%=request.getContextPath()%>/images/돋보기.png">
 	</div>
 	<div class="con_memManage_main">
<!-- 	 	<table class="memManage_table"> -->
<!-- 	 		<tr> -->
<!-- 	 			<th class="memManage_id">아이디</th> -->
<!-- 	 			<th class="memManage_name">이름</th> -->
<!-- 	 			<th class="memManage_nick">닉네임</th> -->
<!-- 	 			<th class="memManage_birth">생년월일</th> -->
<!-- 	 			<th class="memManage_gend">성별</th> -->
<!-- 	 			<th class="memManage_email">이메일</th> -->
<!-- 	 			<th class="memManage_phone">전화번호</th> -->
<!-- 	 			<th class="memManage_addr">주소</th> -->
<!-- 	 		</tr> -->
<!-- 	 		<tr> -->
<!-- 	 			<td>asdfasdf</td> -->
<!-- 	 			<td>박정수</td> -->
<!-- 	 			<td>꼬박이</td> -->
<!-- 	 			<td>1999.01.22</td> -->
<!-- 	 			<td>M</td> -->
<!-- 	 			<td>qkrwjdtn123@sadasd.sdsd</td> -->
<!-- 	 			<td>010-4404-2323</td> -->
<!-- 	 			<td>대전 중구 오류동</td> -->
<!-- 	 		</tr> -->
<!-- 	 	</table> -->
 	</div>
 	<div class="memManage_page">
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