<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = (String)request.getAttribute("result");
	
	if(result.equals("ok")){
%>
		{
			"result" : "ok"
		}
<%
	} else if(result.equals("no")) {
%>
		{
			"result" : "no"
		}

<%
	}
%>