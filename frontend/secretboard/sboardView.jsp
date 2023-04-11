<%@page import="java.util.List"%>
<%@page import="vo.SboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<% List<SboardVO> list = (List<SboardVO>)request.getAttribute("list"); %>



<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/sboard.js"></script>
<script>
$(function(){
	
	imageView();
	
	function imageView(){
	<%
	for(SboardVO vo : list){
		
	%>
<%-- 		code = `<img src="<%=request.getContextPath()%>/images/SimageSrcView.do?<%=v">` --%>
// 		$('.mem_img').append(code);
		
		
	<%
	}
	%>
	
	}
	
})
</script>
</head>
<body>
<%@ include file="/module/header.jsp" %>
<div class="mem_sboard">
	<div class="mem_header">
		<input type="button" id="modify" value="수정">
		<input type="button" id="delete" value="삭제">
	</div>
	
	<div class="mem_top">
		<img src="<%=request.getContextPath()%>/images/기본프로필.png">
		<p class="m_writer">익명</p>
		<p class="m_date"><%= list.get(0).getSboard_cdate() %></p>
	</div>
	
	<div class="mem_img">
<%-- 		<img src="<%=request.getContextPath()%>/images/SimageSrcView.do?"> --%>
	</div>
	
	<div class="mem_title">
		<div class="mem_t">
			<%=list.get(0).getSboard_title() %>
		</div>
	</div>
	
	<div class="mem_content">
		<div class="mem_ct">
			<%=list.get(0).getSboard_content() %>
		</div>
	</div>
	
	<div class="mem_btns">
		<div class="m_hit">
			<img id="mHit" src="<%=request.getContextPath()%>/images/조회수.svg">
			<p id="htext">0</p>
		</div>
		<div class="m_like">
			<img id="mLike" src="<%=request.getContextPath()%>/images/좋아요-체크안함.svg">
			<p id="lktext">0</p>
		</div>
		<div class="m_unlike">
			<img id="mUnlike" src="<%=request.getContextPath()%>/images/싫어요-체크안함.svg">
			<p id="untext">0</p>
		</div>
		<div class="m_notify">
			<img id="mNotify" src="<%=request.getContextPath()%>/images/신고-신고 안할때.svg">
		</div>
	</div>

</div>
	
 <%@ include file="/module/footer.jsp" %>		
</body>
</html>




