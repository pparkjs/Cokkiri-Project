<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = (String)request.getAttribute("result");
	
	if(result.equals("N")){
%>
		{
			"result" : "N"
		}
<%
	} else if(result.equals("Y")) {
%>
		{
			"result" : "Y"
		}
<%
	} else if(result.equals("false")) {
%>
		{
			"result" : "false"
		}
<%
	}
%>