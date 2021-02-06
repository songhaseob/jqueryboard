<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
		int cnt = (Integer)request.getAttribute("cnt");
	
		int res = (Integer)request.getAttribute("result");

		if(cnt > 0 && res > 0){
	%>	
		{
			"res1" = "성공"
		}
		
	<% 	}else{ %>
		
		{
			"res1" = "실패"
		}	
	<% 
	}
    %>
    
    
    
    
    
    
    
    
    
