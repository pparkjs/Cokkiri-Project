<%@page import="vo.ScommentVO"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int cnt = (Integer)request.getAttribute("result");
	ScommentVO vo = (ScommentVO)request.getAttribute("scommentId");

	Gson gson = new Gson();
	
	String result = gson.toJson(vo);
	
%>
{
	"result":<%=cnt %>
	<%if(vo!=null){ %>
	,"vo" : <%=result %>
	<%} %>
}