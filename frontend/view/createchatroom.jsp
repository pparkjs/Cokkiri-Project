<%@page import="com.google.gson.Gson"%>
<%@page import="vo.ChatMessageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ChatMessageVO chatMessageVO = (ChatMessageVO)request.getAttribute("message");
	int res = (int)request.getAttribute("res");
%>
{
	"res" : <%=res %>
	<%if(chatMessageVO!=null){ 
		Gson gson = new Gson();
		String json=gson.toJson(chatMessageVO);
	%>
	,"message":<%=json %>
	<%} %>
}