<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("memberVo");	
%>
<head>
<meta charset="UTF-8">
<title>My Place</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/pboard.js"></script>
</head>
 

<script>
memId = `<%=memVo.getMem_id()%>`;
more = 0; // 더보기 버튼
mypath = "<%=request.getContextPath()%>";
hit = 0; //조회수

//회원인 경우에만 지역 나눔
<%if(memVo.getAdmin_auth().equals("N")){%>
	 region = `<%=memVo.getMem_add()%>`; 
	 frontRegion = region.split(' ')[0]; //지역별로 하기 위해 앞에 지역 쪼갠거
<%}else{%>
	 frontRegion = '';
<%}%>

$(function(){
	
	//외부스크립트
	pboardListServer(0); // 첫번째 페이지 
	
	$('#search').on('click', function(){
		//관리자용으로 신고 체크 되있을때
		if($('.no_check').is(':checked')){
	        $('.pboard').empty(); // 검색하면 이전에 있던거 없애고 시작
			more = 0;
			notifyCheckView(more);
		}else{
	        $('.pboard').empty(); // 검색하면 이전에 있던거 없애고 시작
			more = 0;
			pboardListServer(more);
		}
	})
	
	// 조회수 증가 함수 호출
	hitUpdateServer();
	
	likeOrUnlikeClick();
		
	
	$('.morebtn').on('click',function(){
		 if($('.no_check').is(':checked')){
			more = more + 1;
			notifyCheckView(more);
		} else {
			more = more + 1;
			pboardListServer(more);		
		}
	
	})
	
	$('.no_check').on('change', function(){
		more = 0; //체크박스가 바뀔때마다 0으로 줌
		if($('.no_check').is(':checked')){ // 체크 되면 true 풀리면 false 반환
			$('.pboard').empty();
			notifyCheckView(0);
		}else{
			$('.pboard').empty();
			pboardListServer(0);
		}
	})
				
})
</script>

<body>
<%if(memVo.getAdmin_auth().equals("N")){ %> 
<%@ include file="/module/header.jsp" %>
<%}else{ %>
 <%@ include file="/module/adminHeader.jsp" %>
<%} %>

	<div class="container">
		<div class="box">
			<div class="texbox"><h1 class="quote" style="text-align: center; font-size:25px; margin-top: 30px;">우리 지역 맛집, 우리끼리 </h1></div>
			<div class="header">
				<select class="pb_type">
					<option value="">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="place">장소</option>
				</select> <input type="text" class="pb_search" placeholder="  search">
				<img id="search" src="<%=request.getContextPath()%>/images/돋보기.png">
				
				<%if(memVo.getAdmin_auth().equals("N")){ %> 
				<a href="<%=request.getContextPath()%>/pboard/pboardwrite.jsp">
					<img id="write" src="<%=request.getContextPath()%>/images/글쓰기.png">
				</a>
				<%}else{ %>
				   <div class="notify_con">
					<input type="checkbox" class="no_check">
				    <p>신고</p>
				   </div>
				<%} %>
			</div>
			<!-- DB에서 가져오기 -->
			<div class="pmain">


				<div class="pboard">
				
				</div>
			</div>

			<div class="viewMore">
				<img class="morebtn" src="<%=request.getContextPath()%>/images/더보기버튼.png">
			</div>

		</div>
	</div>

	<%@ include file="/module/footer.jsp" %>

 	
</body>
</html>