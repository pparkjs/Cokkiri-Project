<%@page import="vo.TcommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.serializejson.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url : "<%=request.getContextPath()%>/tcommentList.do",
		type : 'post',
		success: function(res){
			var code= "";
			$.each()
		
		},
		error: function(xhr){
			alert(xhr.status);
		},
		dataType: 'json'
	})
})
</script>
<style type="text/css">
div{
	border: 1px solid black;
}
span{
	margin: 5px;
	padding: 5px;
}
#re-tcomment{
	margin-left: 50px;
}
#re-tcomment2{
	margin-left: 100px;
}
</style>
</head>
<body>

<%--  <form action="<%=request.getContextPath()%>/tcommentInsert.do" method="get" id="tcommentInsert">
 	<div>
		<input type="submit" id="tcommentWrite" value="댓글쓰기">
	</div><br><br>
	<input type="hidden" name="tboard" value="<%=request.getParameter("tboard")%>">
	<div id="tcommentWriteForm">
		<img alt="기본프로필.png" src="../images/기본프로필.png">
		작성자<span id="writer"></span>
		<input type="hidden" name="nickname" value="<%=request.getParameter("member")%>"> 
		<textarea rows="7" cols="10" placeholder="댓글을 입력해주세요" name="tco"></textarea>
	</div>
</form> --%>
<!-- 댓글 목록 -->
<div class="list">
	<div id="tcomment">
		<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">
		<span id="writer">작성자</span>
		<span id="content">댓글입니다.</span>
		<span id="cdate">2023-04-09</span>
		<input type="submit" value="댓글 달기" id="tcommentWrite">
	</div>
	<div id="re-tcomment">
		<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">
		<span id="writer">작성자</span>
		<span id="content">댓글입니다.</span>
		<span id="cdate">2023-04-09</span>
		삭제
	</div>
	<div>
		<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">
		<span id="writer">작성자</span>
		<span id="content">댓글입니다.</span>
		<span id="cdate">2023-04-09</span>
		<input type="submit" value="댓글 달기" id="tcommentWrite">
	</div>
	<div id="re-tcomment">
		<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">
		<span id="writer">작성자</span>
		<span id="content">댓글입니다.</span>
		<span id="cdate">2023-04-09</span>
		삭제
	</div>
	<div id="re-tcomment2">
		<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">
		<span id="writer">작성자</span>
		<span id="content">댓글입니다.</span>
		<span id="cdate">2023-04-09</span>
		삭제
	</div>
</div>
<div id="commtLayer"></div>
</body>
</html>