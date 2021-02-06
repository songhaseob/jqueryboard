<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String resId = (String) request.getAttribute("resId");
	if (resId != null) {
%>
{"sw" : "가입된 아이디 입니다."}
<%
	} else {
%>
{"sw" : "사용가능한 아이디 입니다."}
<%
	}
%>