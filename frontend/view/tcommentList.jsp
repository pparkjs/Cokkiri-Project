<%@page import="com.google.gson.Gson"%>
<%@page import="vo.TcommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<TcommentVO> list = (List<TcommentVO>)request.getAttribute("tcommentList");

	Gson gson = new Gson();
	
	String result = gson.toJson(list);
	
	out.print(result);
	out.flush();
%>