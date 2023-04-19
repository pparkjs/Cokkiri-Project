<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageTboardStyle.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mypageTBoard.js"></script>
<% MemberVO memVo = (MemberVO)session.getAttribute("memberVo"); %>
<script type="text/javascript">
mypath = `<%=request.getContextPath() %>`;
memId = `<%=memVo.getMem_id()%>`;
$(function() {
	// 게시판 제목 클릭시 화면이동
	$(document).on("click",".ele",function(){
		tboard_id = $(this).attr('id');
		location.href = "<%=request.getContextPath()%>/tboardInfo.do?id=" + tboard_id;
	})
	
	// 외부스크립트
	mypageTboardListServer(1); 
	more = 1;
	// 더보기 버튼 클릭시 6개씩 추가
	$('#more').on('click', function() {
		more = more + 1;
		mypageTboardListServer(more);
	})
	
	soldout();
	
})
</script>
<style type="text/css">
.container #containerpMenuRoot #containerpMenu .tboard{
	color: rgb(56,102,233);
	font-weight: 600;
}
</style>
</head>
<body>
<!-- header -->
<%@ include file="/module/header.jsp" %>
               
<!-- container 시작 -->
<div class="container">
	<div id="banner">
		<h1>내 글 보기</h1>
	</div>
	<div id="containerpMenuRoot">
		<div id="containerpMenu">
			<a href="<%=request.getContextPath()%>/mypage/mypageTboard.jsp" class="tboard">중고거래</a>
			<a href="<%=request.getContextPath()%>/mypage/mypageSboard.jsp" class="sboard">비밀게시판</a>
			<a href="<%=request.getContextPath()%>/mypage/mypageMboard.jsp" class="mboard">마이플레이스</a>
		</div>
	</div>
	<section>
		<!-- 게시판 리스트 -->
		<div class="boardList">
			<div class="mypageTboard">
				<!-- DB에서 게시판 가져오기 -->
			</div>
		</div>
		<div class="moreContainer">
			<button class="moreBtn" id="more"><img alt="더보기버튼.png" src="<%=request.getContextPath() %>/images/더보기버튼.png"></button>
		</div>
	</section>
</div>
 	
<!-- footer -->
<%@ include file="/module/footer.jsp" %>	
</body>
</html>