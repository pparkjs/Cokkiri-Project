<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int res = (Integer)request.getAttribute("result");
if(res > 0){
%>

	{
		"flag" : "ok"
	}
	
<%	
}else{
%>

	{
		"flag" : "no"
	}

<%	
}
%>