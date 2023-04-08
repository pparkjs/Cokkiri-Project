<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int res=(int)request.getAttribute("res");
%>
{
	"flag" : <%=res %>
}