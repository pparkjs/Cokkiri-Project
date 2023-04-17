<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageSboardStyle.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mypageSecretBoard.js">

</script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);* { 
 font-family: 'Noto Sans KR', sans-serif;
}
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
	font-family: 
	/* border: 1px solid blue; */
}

.container *{
	box-sizing: border-box;
}

.container #banner {
	padding : 40px 0;
	width : 1280px;
	height: 250px;
	margin: 0 auto;
}
.container #banner h1{
	font-family: 'yg-jalnan', sans-serif;
	color: rgb(28,28,30);
}

#banner h1 {
	font-family: 
}
.container #containerpMenuRoot {
	border-bottom: 2px solid rgb(229, 229, 234);	
	border-top: 2px solid rgb(229, 229, 234);	
}

.container #containerpMenuRoot #containerpMenu{
	padding : 15px 0;
	width : 700px;
	margin: 0 auto;
	text-align: center;
	display: flex;
	justify-content: space-between;
}
.container #containerpMenuRoot #containerpMenu a{
	text-decoration: none;
	color : rgb(28,28,30);
	font-weight: 500;
	text-align: center;
}

.container #selectBtn {
	width : 500px;
	margin : 25px auto;
	display: flex;
	justify-content: space-between; /* 수평방향으로 양끝에 배치 */
	align-items: center; /* 수직 방향으로 중앙정렬 */
}
.container #selectBtn input{
	
	width : 80px;
	height : 35px;
	border-radius: 120px;
	background-color: white;
	border: 1px solid rgb(229, 229, 234);
	font-size: 14px;
	color: rgb(28,28,30);
}
</style>
<script type="text/javascript">
mypath = `<%=request.getContextPath() %>`;
$(function() {
	// 외부스크립트
	mypageSboardListServer(1); 
	
	// 더보기 버튼 클릭시 6개씩 추가
	$('#moreBtn').on('click', function() {
		more = more + 1;
		mypageSboardListServer(more);
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
	
	
	// 조회수 증가 함수
	
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
			<a href="<%=request.getContextPath()%>/mypage/">중고거래</a>
			<a href="<%=request.getContextPath()%>/mypage/secretBoard.jsp">비밀게시판</a>
			<a href="<%=request.getContextPath()%>/mypage/myplaceBoard.jsp">마이플레이스</a>
		</div>
	</div>
	<section>
		<div id="selectBtn">
			<input type="button" value="내글" name="board" class="SearchBtn" id="boardBtn">
			<input type="button" value="댓글" name="comment" class="SearchBtn" id="commentBtn">
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
			<button class="moreBtn"><img alt="더보기버튼.png" src="<%=request.getContextPath() %>/images/더보기버튼.png" style="display : none"></button>
		</div>
	</section>
</div>
 	
<!-- footer -->
<%@ include file="/module/footer.jsp" %>	
</body>
</html>