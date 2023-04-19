<%@page import="vo.ScommentVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<ScommentVO> list = (List<ScommentVO>)request.getAttribute("scommentList");

	Gson gson = new Gson();
	
	String result = gson.toJson(list);
	
	out.print(result);
	out.flush();
%>