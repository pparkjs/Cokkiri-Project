<%@page import="com.google.gson.Gson"%>
<%@page import="vo.ChatRoomVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ChatRoomVO> list = (List<ChatRoomVO>)request.getAttribute("list");
	
	Gson gson = new Gson();
	String json = gson.toJson(list);
	out.print(json);
%>