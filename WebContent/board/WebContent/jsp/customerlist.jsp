<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<CustomerVO> list = (List<CustomerVO>) request.getAttribute("list");
%>

[

<%
	for(int i=0; i<list.size(); i++){
		CustomerVO vo = list.get(i);
		if(i>0) out.print(',');

%>
	{
		"cusid" : "<%= vo.getCus_id() %>",
		"pass" : "<%= vo.getPass() %>",
		"nick" : "<%= vo.getNicknm() %>",
		"tel" : "<%= vo.getTel() %>",
		"email" : "<%= vo.getEmail() %>",
		"point" : "<%= vo.getPoint() %>",
		"hint" : "<%= vo.getPass_hint() %>",
		"answer" : "<%= vo.getAnswer() %>",
		"cnt" : "<%= vo.getReport_cnt() %>",
		"admin_cd" : "<%= vo.getAdmin_cd() %>"
	}
	
<%
	}

%>

]
    
    
    
    
    
    
