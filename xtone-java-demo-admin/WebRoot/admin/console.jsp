<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
  /* response.sendRedirect("menu.jsp"); */
  String username = (String)session.getAttribute("username");
  if(username.equalsIgnoreCase("huasheng")){
	  response.sendRedirect("code.stat-all.jsp");
  }
  else{
  response.sendRedirect("stat-all.jsp");
  }
%>