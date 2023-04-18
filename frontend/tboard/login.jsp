<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/login.do" method="post">
	id: <input type="text" name="memId"><br>
	<input type="submit">
		
</form>
</body>
</html>