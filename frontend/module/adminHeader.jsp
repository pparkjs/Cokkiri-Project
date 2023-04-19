<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.admin_pf{display : flex; align-items: center;}
.admin_pf p {margin-left: 10px;}
.admin_logout{text-decoration: none; color: black; margin-left: 100px; }
.header .navbar {width:100%}
.header .navbar .navbar__board li:nth-child(2) {margin-right: 20px;}
</style>
<!--  wrap의 시작 -->
 <div class="wrap">
        <!-- nav를 포함하는 가장 상단의 header-->
        <div class="header">
            <div class="navbar">
                <div class="navbar__mainLogo">
                    <img class="mainLogo__img" src="<%=request.getContextPath()%>/images/logo2.png" alt="logo.png">
                    <a class="mainLogo__a" href="<%=request.getContextPath()%>/admin/adminhome.jsp">
                    	<img src="<%=request.getContextPath()%>/images/logotext.png" alt="logotext.png">
                    </a>
                    
                </div>
                <ul class="navbar__board">
                    <li class="item">
                   		<a class="a1" href="<%=request.getContextPath()%>/admin/memManagement.jsp">회원관리</a>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/tboard/tboard.jsp">중고거래</a></li>
                    <li><a href="<%=request.getContextPath()%>/secretboard/sboard.jsp">비밀게시판</a></li>
                    <li><a href="#">마이플레이스</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/noticeboard.jsp">공지사항</a></li>
                </ul>
                
                <div class="navbar__mymenu">
                    <!-- <input type="checkbox" id="mymenu"> -->
                    <div class="navbar__label" >
                    	<div class=admin_pf>
                        	<img class="myimage" src="<%=request.getContextPath()%>/images/기본프로필.png" alt="기본프로필.png">
                        	<p>관리자</p>
                        </div>
                    </div>
                </div>  
                 <a class="admin_logout" href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
            </div>
        </div> 
