<%@page import="vo.ChatMessageVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.ChatRoomVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ChatMessageVO> res = (List<ChatMessageVO>)request.getAttribute("res");
if(res!=null){
	Gson gson = new Gson();
	String json = gson.toJson(res);
%>
{"res" : <%=json %>}
<%}else{%>
{"res" : null}
<%}%>