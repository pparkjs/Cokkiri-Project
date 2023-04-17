<%@page import="vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% NoticeVO vo = (NoticeVO)session.getAttribute("noticeData"); %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/noticeboard.js"></script>
<script>
$(function(){
	
	$('#delete').on('click', function(){
		if(confirm('정말 삭제하시겠습니까?')){ // 확인누르면 true반환 취소 누르면 false반환
			location.href="<%=request.getContextPath()%>/NoticeDelete.do?nbId=<%=vo.getNboard_id()%>";
		}
	})
	
	$('#modify').on('click', function(){
		location.href="<%=request.getContextPath()%>/admin/noticeUpdate.jsp";
	})
	
	$('.a_back').on('click', function(){
		location.href="<%=request.getContextPath()%>/admin/noticeboard.jsp";
	})
})
</script>
</head>
<body>
<%@ include file="/module/adminHeader.jsp" %>
<div class="admin_notice">
	<div class="admin_header">
		<div class="admin_t">
			<%=vo.getNboard_title() %>
		</div>	
		<div id="modify">수정</div>
		<div id="delete">삭제</div>
	</div>
	
	<div class="admin_top">
		<div class="a_date"><%=vo.getNboard_cdate() %></div>
	</div>
	
	<div class="admin_content">
		<div class="admin_ct">
			<%=vo.getNboard_content() %>
		</div>
		<br>
	</div>
	<div class="a_list">
		<input class="a_back" type="button" value="목록">
	</div>

</div>
<%@ include file="/module/footer.jsp" %>
</body>
</html>