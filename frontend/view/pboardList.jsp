<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="vo.PboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
 
 List<PboardVO> list = (List<PboardVO>)request.getAttribute("list");
 
 JsonObject obj = new JsonObject();
 Gson gson = new Gson();
 JsonElement result = gson.toJsonTree(list);
 
obj.add("datas", result);

out.print(obj);
out.flush();

 
 %>