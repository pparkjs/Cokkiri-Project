<%@page import="com.google.gson.Gson"%>
<%@page import="vo.AlarmVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberVO memberVO =  (MemberVO)request.getAttribute("memberVO");
	List<AlarmVO> alarm = (List<AlarmVO>)request.getAttribute("alarm");
	
	Gson gson = new Gson();
	String mem=gson.toJson(memberVO);
	String al= gson.toJson(alarm);
%>
{
	"member" : <%=mem %>
	
	<%if(alarm!=null && alarm.size()!=0) {%>
	, "alarm" : <%=al %>
	<%} %>
}