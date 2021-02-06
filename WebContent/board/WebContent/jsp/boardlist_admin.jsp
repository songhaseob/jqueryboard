<%@page import="kr.or.ddit.cfms.vo.CFMSBoardlistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<CFMSBoardlistVO> list = (List<CFMSBoardlistVO>)request.getAttribute("list");	
%>

[

<%

	for(int i=0; i<list.size(); i++){
		CFMSBoardlistVO vo = list.get(i);
			if(i>0) out.print(",");
			
%>

  

    {
    	"seq" : "<%=vo.getList_num() %>",
    	"num" : "<%=vo.getBd_num() %>",
    	"code" : "<%=vo.getBd_cd() %>",
    	"title" : "<%=vo.getTitle() %>",
    	"date" : "<%=vo.getWr_dt() %>",
    	"cont" : "<%=vo.getCont().replaceAll("\r","").replaceAll("\n","<br>") %>",
    	"writer" : "<%=vo.getWriter() %>",
    	"hits" : "<%=vo.getHits() %>",
    	"userid" : "<%=vo.getCus_id() %>",
    	"classify" : "<%=vo.getClassify() %>"

    
    }   
<%		
	}
%>
]
 
    
    
    
    
    
    
    
    
    
    
