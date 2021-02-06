<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int res = (Integer)request.getAttribute("result");
	if(res > 0){
		
%>
   {
    	"sw" : "게시물이 삭제되었습니다"
    }	
    <% 	}else{%>
    {
    	"sw" : "게시물 삭제 실패"
    }	
    
  <%   
    
    }
    %>