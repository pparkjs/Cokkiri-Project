<%@page import="com.google.gson.Gson"%>
<%@page import="vo.PcommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<PcommentVO> list = (List<PcommentVO>)request.getAttribute("pcommentList");

	Gson gson = new Gson();
	
	String result = gson.toJson(list);
	
	out.print(result);
	out.flush();
%>