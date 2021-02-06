<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int res = (Integer)request.getAttribute("result");
	int res2 = (Integer)request.getAttribute("result2");
	if(res>0&&res2>0){
%>
	
<%  
		request.getRequestDispatcher("/mainPage.do").forward(request, response);
	}else {%>

<%
	}
%>
