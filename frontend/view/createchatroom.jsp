<%@page import="com.google.gson.Gson"%>
<%@page import="vo.ChatMessageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = (String)request.getAttribute("mem_id");
	Long res = (Long)request.getAttribute("res");
%>
{
	"res" : <%=res %>
	,"mem_id": "<%=mem_id %>"
}