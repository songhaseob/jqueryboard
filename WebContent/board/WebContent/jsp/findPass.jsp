<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String resId = (String) request.getAttribute("resId");
	if (resId != null) {
%>
{"sw" : "회원님의 메일로 임시비밀번호를 발급했습니다. 비밀번호를 변경해주세요"}
<%
	} else {
%>
{"sw" : "🙅‍♂️존재하지 않는 회원입니다. 아이디와 메일을 다시 확인 하세요."}
<%
	}
%>