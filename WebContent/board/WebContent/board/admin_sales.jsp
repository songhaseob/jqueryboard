<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@page import="kr.or.ddit.cfms.vo.SelVO"%>
<%@page import="kr.or.ddit.cfms.vo.BuyVO"%>
<%@page import="kr.or.ddit.cfms.vo.ChargeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Insert title here</title>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> 
	
	
<!-- 	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet"> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminlte.min.css">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_sales.css">
</head>

<body class="hold-transition sidebar-mini">

<%
	List<ChargeVO> allCharList = (List<ChargeVO>)request.getAttribute("totallist");
	List<ChargeVO> charList2 = (List<ChargeVO>)request.getAttribute("datelist");



		

		
		
		
%>
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
  
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="http://localhost/CFMS/board/main.jsp" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>
    
  </nav>
  <!-- /.navbar -->
  

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="${pageContext.request.contextPath}/index3.html" class="brand-link">
      <img src="${pageContext.request.contextPath}/images/logo_w.png"
           alt="AdminLTE Logo"
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light" style=" color: #343a40;">.</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath}/images/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">관리자님, 반갑습니다.</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        	<li class="nav-item">
        		 <a href="adminUserInfo.do" class="nav-link">
        		 	<p>일반회원관리	</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="Blackcuslist.do" class="nav-link">
        		 	<p>블랙리스트관리</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="Reportlist.do" class="nav-link">
        		 	<p>신고내역조회</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="adminSalesTotal.do" class="nav-link">
        		 	<p>매출현황</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="adminBoard.do" class="nav-link">
        		 	<p>공지사항관리</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="adminFAQ.do" class="nav-link">
        		 	<p>FAQ관리</p>
        		 </a>
        	</li>
		</ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
         
            <h1>매출현황</h1>
            <br>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="sales">
		<table class="table" id="tb">
        			<%	
        				int totalPoint= 0;
	    				int usePoint= 0;	
						if(allCharList!=null){
							for(int i=0; i<allCharList.size(); i++ ){
								totalPoint += allCharList.get(i).getCha_pr();
							}
							
						}
        			%>
        			
        		
        		<tr>
        			<th colspan="6">총 매출 현황</th>
        		</tr>
        		<tr>
        			<td colspan="6"><%=totalPoint %>P</td>
        		</tr>
        		
        		<tr>
       				<th colspan="6">포인트 사용내역 조회</th>
        		</tr>
        		
        		
        		<tr class="deal">
        				
       				<td colspan="6" class="tm">
        				<form action="adminSales.do" method="post">
	       					<input class="term" name="date" type="submit" value="1일">
	       				</form>
	       				
	       				<form action="adminSales.do" method="post">
	       					<input class="term" name="date" type="submit" value="1주일">
	       				</form>
	       				
	       				<form action="adminSales.do" method="post">	
	       					<input class="term" name="date" type="submit" value="1개월">
       					</form>
       					
       					<form action="adminSales.do" method="post">	
	       					<input class="term" name="date" type="submit" value="1년">
       					</form>
       				</td>
       				
	       		</tr>
	       		
				<tr>    
					<td colspan="6">   		
       					<form action="adminSalesTerm.do" method="post">	
	       					<input type="date" value="2018-07-22" name="startdate" min="2018-01-01" max="2020-12-31"> ~
	       					<input type="date" value="2020-12-11" name="enddate" min="2018-01-01" max="2020-12-31">
	       					<input id="search2" type="submit" value="조회">
	       				</form>
	       			</td>
	       		</tr>
       			
       			<tr>
       					<th colspan="1" class="tl">회원ID</th>
       					<th colspan="1" class="tl">일시</th>
       					<th colspan="4" class="tl">금액</th>
       						
       			</tr>
       			
       					
       						<tr class="myChargePoint">
			    				<%
			    					if(charList2!=null){
			    						for(int i=0; i<charList2.size(); i++ ){
			    							ChargeVO charVo = charList2.get(i);
			    				%>			
			    					
			    					<td><%=charVo.getCus_id()%></td>
			    					<td><%=charVo.getCha_dt()%></td>
			    					<td><%=charVo.getCha_pr()%></td>
				    		</tr>
			    					
			    				<% 	
			    						}
			    					}
			    				%>
			</table>
		</div>
    </section>
    <!-- /.content -->

    <a id="back-to-top" href="#" class="btn btn-primary back-to-top" role="button" aria-label="Scroll to top">
      <i class="fas fa-chevron-up"></i>
    </a>
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.0.5
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
</body>
</html>