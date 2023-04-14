<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
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
			<input type="button" value="내글" name="board" class="boardBtn">
			<input type="button" value="댓글" name="comment" class="commentBtn">
			<input type="button" value="좋아요" name="like" class="likeBtn">
			<input type="button" value="싫어요" name="nulike" class="nulikeBtn">
			
		</div>
		<div class="boardList">
		</div>
		<div class="moreContainer">
			<button class="moreBtn"><img alt="더보기버튼.png" src="<%=request.getContextPath() %>/images/더보기버튼.png"></button>
		</div>
	</section>
</div>
 	
<!-- footer -->
<%@ include file="/module/footer.jsp" %>	
 
<script>
    let home1TextH = document.querySelector('.home1__h1')
    let home1TextP = document.querySelector('.home1__p')
    let home2TextH = document.querySelector('.home2__h1')
    let home2TextP = document.querySelector('.home2__p')
    let home3TextH = document.querySelector('.home3__h1')
    let home3TextP = document.querySelector('.home3__p')
    //스크롤 할때 줄 이벤트
    window.addEventListener('scroll', function(){
        //스크롤의 높이를 가져오는 것
        let value = window.scrollY 
        console.log(value);
        if(value > 250){
            // 애니메이션에 forwards주면 방금 일어난 에니메이션상태 유지됨
            home1TextH.style.animation = "disappear 1s ease-out forwards";
            home1TextP.style.animation = "disappear 1s ease-out forwards";
        }else{
            home1TextH.style.animation = "slideLeft 1s ease-out";
            home1TextP.style.animation = "slideLeft 1.5s ease-out";
        }
        if(value < 350 || value > 950){
            home2TextH.style.animation = "disappearH 1s ease-out forwards";
            home2TextP.style.animation = "disappearP 1s ease-out forwards";
        }else{
            home2TextH.style.animation = "slideRightH 1s ease-out";
            home2TextP.style.animation = "slideRightP 1.5s ease-out";
        }

        if(value < 950){
            // 애니메이션에 forwards주면 방금 일어난 에니메이션상태 유지됨
            home3TextH.style.animation = "disappear 1s ease-out forwards";
            home3TextP.style.animation = "disappear 1s ease-out forwards";
        }else{
            home3TextH.style.animation = "slideLeft 1s ease-out";
            home3TextP.style.animation = "slideLeft 1.5s ease-out";
        }
    
    })

</script>
</body>
</html>