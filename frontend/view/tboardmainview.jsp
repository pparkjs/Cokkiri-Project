<%@page import="com.google.gson.Gson"%>
<%@page import="vo.TBoardAndAttVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List<TBoardAndAttVO> list = (List<TBoardAndAttVO>)request.getAttribute("list");
	int admin = (int)request.getAttribute("admin");
	
	Gson gson = new Gson();
	String json = gson.toJson(list);
%>
{
	"admin":<%=admin %>
	<%if(list!=null&&list.size()!=0){ %>
	,"list":<%=json %>
	<%} %>
}