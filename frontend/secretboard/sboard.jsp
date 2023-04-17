<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sboardStyle.css">
<!DOCTYPE html>
<html>
<!-- session 예비용 해놓은거 수정해야함 -->
<%
MemberVO memVo = (MemberVO)session.getAttribute("memberVo");	
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
 hit = 0; //조회수
 memId = `<%=memVo.getMem_id()%>`;

$(function(){
	//외부스크립트 이용
	sboardListServer(0); // 맨처음에는 첫번째 페이지 
	
	//검색 버튼 누를시 검색한 게시물이 나옴
	$('#search').on('click', function(){
		//관리자용으로 신고 체크 되있을때
		if($('.no_check').is(':checked')){
	        $('.sboard').empty(); // 검색하면 이전에 있던거 없애고 시작
			more = 0;
			notifyCheckView(more);
		}else{
	        $('.sboard').empty(); // 검색하면 이전에 있던거 없애고 시작
			more = 0;
			sboardListServer(more);
		}

	})
	
	
	$('#more_btn').on('click', function(){
		//관리자용으로 신고 체크 되있을때
		if($('.no_check').is(':checked')){
			more = more + 1;
			notifyCheckView(more);
		}else{
			more = more + 1;
			sboardListServer(more);
		}
	})
		
	// 조회수 증가 함수 호출
	hitUpdateServer();
	
	likeOrUnlikeClick();
	
	
	$('.no_check').on('change', function(){
		more = 0; //체크박스가 바뀔때마다 0으로 줌
		if($('.no_check').is(':checked')){ // 체크 되면 true 풀리면 false 반환
			$('.sboard').empty();
			notifyCheckView(0);
		}else{
			$('.sboard').empty();
			sboardListServer(0);
		}
	})
	
})
 
</script>
</head>
<body>
<%if(memVo.getAdmin_auth().equals("N")){ %> 
<%@ include file="/module/header.jsp" %>
<%}else{ %>
 <%@ include file="/module/adminHeader.jsp" %>
<%} %>

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
		
		<%if(memVo.getAdmin_auth().equals("N")){ %> 
		<a href="<%=request.getContextPath()%>/secretboard/sboardRegi.jsp">
			<img id="regi" src="<%=request.getContextPath()%>/images/글쓰기.png">
		</a>
		<%}else{ %>
			<div class="notify_con">
				<input type="checkbox" class="no_check">
				<p> 신고</p>
			</div>
		<%} %>
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

</body>
</html>