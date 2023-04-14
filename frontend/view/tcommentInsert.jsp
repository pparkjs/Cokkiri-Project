<%@page import="com.google.gson.Gson"%>
<%@page import="vo.TcommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int cnt = (Integer)request.getAttribute("result");
	TcommentVO vo = (TcommentVO)request.getAttribute("tcommentId");

	Gson gson = new Gson();
	
	String result = gson.toJson(vo);
	
%>
{
	"result":<%=cnt %>
	<%if(vo!=null){ %>
	,"vo" : <%=result %>
	<%} %>
}