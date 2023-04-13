<%@page import="vo.ChatMessageTboardVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.ChatMessageVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ChatMessageTboardVO list = (ChatMessageTboardVO)request.getAttribute("cmtVO");
	Gson gson = new Gson();
	String json = gson.toJson(list);
	out.print(json);
%>