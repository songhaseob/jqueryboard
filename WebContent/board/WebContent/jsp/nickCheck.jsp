<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String resNick = (String) request.getAttribute("resNick");
	if (resNick != null) {
%>
{"sw" : "중복된 닉네임입니다."}
<%
	} else {
%>
{"sw" : "사용가능한 닉네임 입니다."}
<%
	}
%>