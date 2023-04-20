<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mypageMboard.js"></script>
<% MemberVO memVo = (MemberVO)session.getAttribute("memberVo"); %>
<script type="text/javascript">
mypath = `<%=request.getContextPath() %>`;
memId = `<%=memVo.getMem_id()%>`;
hit = 0; //조회수
more = 1; // 더보기 버튼
$(function() {
	// 외부스크립트
	mypageSboardListServer(1,"내글"); 
	more = 1;
	btnValue = "";
	
	//회원인 경우에만 지역 나눔
	
	
	// 더보기 버튼 클릭시 6개씩 추가
	$('#more').on('click', function() {
		more = more + 1;
		mypageSboardListServer(more, btnValue);
	})
	// 버튼을 누르면 해당 게시물이 나옴
	// 내글
	$('#boardBtn').on('click', function() {
		btnValue = "내글";
		$('#mypageSboard').empty(); 
		more = 1;
		mypageSboardListServer(more, btnValue); 
	})
	// 댓글
	$('#commentBtn').on('click', function() {
		btnValue = "댓글";
		$('#mypageSboard').empty(); 
		more = 1;
		mypageSboardListServer(more, btnValue); 
	})
	// 좋아요
	$('#likeBtn').on('click', function() {
		btnValue = "좋아요";
		$('#mypageSboard').empty(); 
		more = 1;
		mypageSboardListServer(more, btnValue); 
	})
	// 싫어요
	$('#nulikeBtn').on('click', function() {
		btnValue = "싫어요";
		$('#mypageSboard').empty(); 
		more = 1;
		mypageSboardListServer(more, btnValue); 
	})
	
	
	likeOrUnlikeClick();
})
</script>
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
		<div id="selectBtn">
			<input type="button" value="내글" name="board" class="SearchBtn" id="boardBtn">
			<input type="button" value="댓글 단 글" name="comment" class="SearchBtn" id="commentBtn">
			<input type="button" value="좋아요" name="like" class="SearchBtn" id="likeBtn">
			<input type="button" value="싫어요" name="nulike" class="SearchBtn" id="nulikeBtn">
			
		</div>
		
		<!-- 게시판 리스트 -->
		<div class="boardList">
			
			<div class="mypageSboard">
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