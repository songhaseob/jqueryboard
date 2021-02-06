<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String resId = (String) request.getAttribute("resId");
	if (resId != null) {
%>
{"sw" : "회원님 아이디는 <%=resId%> 입니다"}
<%
	} else {
%>
{"sw" : "존재하지 않는 회원입니다."}
<%
	}
%>