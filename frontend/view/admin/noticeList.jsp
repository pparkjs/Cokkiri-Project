<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="vo.PageVO"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
{
   "spage" : 1 첫번쨰 페이지
   "epage" : 4 끝페이지
   "tpage" : ? 전체 페이지 개수
}
*/
List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");
PageVO pages = (PageVO)request.getAttribute("page");

JsonObject obj = new JsonObject();
obj.addProperty("spage", pages.getStartPage());
obj.addProperty("epage", pages.getEndPage());
obj.addProperty("tpage", pages.getTotalPage());

Gson gson = new Gson();
JsonElement result = gson.toJsonTree(list);

obj.add("datas", result);

out.print(obj);
out.flush();
%>