<%@page import="com.google.gson.Gson"%>
<%@page import="vo.TBoardAndAttVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TBoardAndAttVO tavo = (TBoardAndAttVO)request.getAttribute("tavo");
	Gson gson = new Gson();
	String json = gson.toJson(tavo);
	out.print(json);
%>