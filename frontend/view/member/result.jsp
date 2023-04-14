<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = (String)request.getAttribute("result");
	
	if(result == "true"){
%>
		{
			"result" : "true"
		}
<%
	} else if(result=="false") {
%>
		{
			"result" : "false"
		}

<%
	}
%>