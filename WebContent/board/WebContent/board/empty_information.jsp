<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<title>gifti_ILJO</title>
<script>
<%
	CustomerVO custVo = (CustomerVO)request.getAttribute("userinfo");
%>
	$(function() {
		document.location.href="loginMainView.do?id=<%=custVo.getCus_id()%>";
		
	})
</script>
</head>
<body>

</body>
</html>