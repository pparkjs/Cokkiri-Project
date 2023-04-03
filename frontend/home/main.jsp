<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="mainStyle.css">
</head>
<body>
    <!-- wrap 클래스로 모든 내용 하나로 포장함-->
    <div class="wrap">
        <!-- nav를 포함하는 가장 상단의 header-->
        <div class="header">
            <div class="navbar">
                <div class="navbar__mainLogo">
                    <img class="mainLogo__img" src="../images/logo2.png" alt="logo.png">
                    <a class="mainLogo__a" href="../home/main.jsp">
                    	<img src="../images/logotext.png" alt="logotext.png">
                    </a>
                    
                </div>
                <ul class="navbar__board">
                    <li class="item">
                   		<a class="a1" href="#">중고거래</a>
                    	<div class="sub_menu_test">
                    		<div class="contents_menu">
                    			<ul>
                    				<li>테스트2</li>
                    				<li>테스트2</li>
                    				<li>테스트2</li>
                    				<li>테스트2</li>
                    			</ul>
                    		</div>
                    	</div> 
                    </li>
                    <li><a href="#">비밀게시판</a></li>
                    <li><a href="#">마이플레이스</a></li>
                </ul>
                <div class ="navbar__mapLogo">
                    <img src="../images/지도아이콘.png" alt="지도아이콘.png">
                    <p class="area">지역</p>	
                </div>
                <div class ="navbar__alamLogo">
                    <img src="../images/알람.png" alt="알람.png">
                </div>

                <!-- 이런식으로 input의 id와 label의 for을 연결해주면 label클릭시 input이 체크 되거나 체크 해제됨 -->
                <div class="navbar__mymenu">
                    <input type="checkbox" id="mymenu">
                    <label class="navbar__label" for="mymenu">
                        <img class="myimage" src="../images/기본프로필.png" alt="기본프로필.png">
                    </label>
                    <div class="sidebar">
                        <ul class="sidebar__list">
                            <li><a href="#">My 프로필</a></li>
                            <li><a href="#">판매내역</a></li>
                            <li><a href="#">관심목록</a></li>
                            <li><a href="#">채팅방</a></li>
                            <li><a href="#">내 글 보기</a></li>
                            <li><a href="#">로그아웃</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> 
               
        <!-- container 시작 -->
        <div class="container">
            <div class="container__home1">
                    <div class="home1__text">
                        <h1 class="home1__h1">같은 지역끼리
                            <br>
                            중고거래
                        </h1>
                        <br>
                        <p class="home1__p">아직도 믿음이 안가는 장거리 택배거래<br>
                            우리끼리 직접 만나 거래해요.
                        </p><br><br>
                        <a class="home1_button" href="#">중고거래 바로가기</a>
                    </div>
                    <div class="home1__images">
                        <img src="../images/거래2.png" alt="">
                    </div>
                
            </div>
            <div class="container__home2">
                    <div class="home2__images">
                        <img src="../images/비밀2.png" alt="">
                    </div>
                    <div class="home2__text">
                        <h1 class="home2__h1">쉿! 우리끼리 
                            <br>
                            비밀 대화를 나눠요.
                        </h1>
                        <br>
                        <p class="home2__p">익명을 통해 마음껏 자신의 고민을 풀거나<br>
                            궁금사항을 말해 스트레스를 날려보아요. 
                        </p><br><br>
                        <a class="home1_button" href="#">비밀게시판 바로가기</a>
                    </div>
                    <div class="home2__images2">
                        <img src="../images/책.png" alt="">
                    </div>
                    <div class="home2__images3">
                        <img src="../images/책2.png" alt="">
                    </div>
            </div>
            <div class="container__home3">
                    <div class="home3__text">
                        <h1 class="home3__h1">나만 아는 좋은장소 
                            <br>
                            알려줄까?
                        </h1>
                        <br>
                        <p class="home3__p">우리지역의 최고의 맛집, 명소 <br>
                            혼자 알지 말고 우리끼리 공유해요.
                        </p><br><br>
                        <a class="home1_button" href="#">마이플레이스 바로가기</a>
                    </div>
                    <div class="home3__images">
                        <img src="../images/장소.png" alt="">
                    </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer__explain">
                <p>
                    대표 <span>박정수</span> | 전화 <span>010-6647-7508</span>
                </p>
                <p>
                    주소 <span>대전광역시 중구 계룡로 846, 3-4층</span>
                </p>
                <p>
                    이메일 <span>qkrwjdtn963@gmail.com</span>
                </p>
                <p>
                    이용약관 개인정보 처리 방침 위치기반서비스 이용약관
                </p>
            </div>
        </div>
    </div>
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