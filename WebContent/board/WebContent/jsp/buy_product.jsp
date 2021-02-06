<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int res = (Integer)request.getAttribute("cnt");
	int res2 = (Integer)request.getAttribute("cnt2");
	int res3 = (Integer)request.getAttribute("cnt3");
	int res4 = (Integer)request.getAttribute("cnt4");
	if(res>0&&res2>0&&res3>0&&res4>0){
%>
	{
		"sw" : "구매성공"
	}
<%  
		
	}else {%>
	
	{
		"sw" : "구매실패"
	}
<%
	}
%>