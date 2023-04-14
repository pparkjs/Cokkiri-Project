<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String btn = (String)request.getAttribute("btn");
	int res = (int)request.getAttribute("res");
	
%>
{
	"btn" : "<%=btn %>",
	"res" : <%=res %>	
}