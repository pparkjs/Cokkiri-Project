<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--  wrap의 시작 -->
 <div class="wrap">
        <!-- nav를 포함하는 가장 상단의 header-->
        <div class="header">
            <div class="navbar">
                <div class="navbar__mainLogo">
                    <img class="mainLogo__img" src="<%=request.getContextPath()%>/images/logo2.png" alt="logo.png">
                    <a class="mainLogo__a" href="<%=request.getContextPath()%>/home/main.jsp">
                    	<img src="<%=request.getContextPath()%>/images/logotext.png" alt="logotext.png">
                    </a>
                    
                </div>
                <ul class="navbar__board">
                    <li class="item">
                   		<a class="a1" href="#">중고거래</a>
                    </li>
                    <li><a href="#">비밀게시판</a></li>
                    <li><a href="#">마이플레이스</a></li>
                </ul>
                <div class ="navbar__mapLogo">
                    <img src="<%=request.getContextPath()%>/images/지도아이콘.png" alt="지도아이콘.png">
                    <p class="area">지역</p>	
                </div>
                <div class ="navbar__alamLogo">
                    <img src="<%=request.getContextPath()%>/images/알람.png" alt="알람.png">
                </div>
                
                               <!-- 이런식으로 input의 id와 label의 for을 연결해주면 label클릭시 input이 체크 되거나 체크 해제됨 -->
               <!-- 
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
                </div>  -->
                  
                <div class="navbar__mymenu">
                    <!-- <input type="checkbox" id="mymenu"> -->
                    <div class="navbar__label" >
                        <img class="myimage" src="<%=request.getContextPath()%>/images/기본프로필.png" alt="기본프로필.png">
                   		 <div class="sidebar" >
                       		<ul class="sidebar__list">
                         	  <li><a href="#">My 프로필</a></li>
                          	  <li><a href="#">관심목록</a></li>
                          	  <li><a href="<%=request.getContextPath()%>/chatRoom.do">채팅방</a></li>
                          	  <li><a href="#">내 글 보기</a></li>
                          	  <li><a href="#">로그아웃</a></li>
                     	    </ul>
                    	</div>
                    </div>
                </div>  
            </div>
        </div> 