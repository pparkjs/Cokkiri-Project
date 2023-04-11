<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sboardStyle.css">
<!DOCTYPE html>
<html>
<%
List<MemberVO> list = (List<MemberVO>)request.getAttribute("list");

for(MemberVO mem : list){
	if(mem.getMem_nickname().equals("꼬빡이")){
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/sboard.js"></script>

<script>
 more = 0; // 더보기 버튼 누르기 용
 mypath = `<%=request.getContextPath() %>`;
$(function(){
	//외부스크립트 이용
	sboardListServer(0); // 맨처음에는 첫번째 페이지 
	
	//검색 버튼 누를시 검색한 게시물이 나옴
	$('#search').on('click', function(){
        $('.sboard').empty(); // 검색하면 이전에 있던거 없애고 시작
		more = 0;
		sboardListServer(more);
	})
	
	//더보기 버튼 클릭시 6개씩 추가
	$('#more_btn').on('click', function(){
		more = more + 1;
		sboardListServer(more);
	})
	
})
</script>
</head>
<body>

 <%@ include file="/module/header.jsp" %>
	
<div class="con_sboard">
<!-- 게시판에 헤더 -->
	<div class="con_sboard_header">
		<select class="sb_type">
			<option value="">전체</option>
			<option value="sboard_title">제목</option>
			<option value="sboard_content">내용</option>
		</select>
		<input type="text" class="sb_search">
		<img id="search" src="<%=request.getContextPath()%>/images/돋보기.png">
		<a href="<%=request.getContextPath()%>/secretboard/sboardRegi.jsp?memId=<%=mem.getMem_id()%>">
			<img id="regi" src="<%=request.getContextPath()%>/images/글쓰기.png">
		</a>
	</div>
<!-- 게시판의 메인 -->
	<div class="con_sboard_main">
		<div class="sboard">
			<!-- 이곳에 DB에서 가져온 게시판 넣을 거 -->	
		</div>
	</div>
	<div class="more">
		  <img id="more_btn" src="<%=request.getContextPath()%>/images/더보기버튼.png">
	</div>
	
</div>


	
 <%@ include file="/module/footer.jsp" %>		

<%
	}
}
%>
</body>
</html>