<%@page import="kr.or.ddit.cfms.vo.SelVO"%>
<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.cfms.vo.BuyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
 	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_userinfo.css">
 	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	
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
	
<style>
.userinfo{
	width : 900px;
	height : 700px;
	border : 1;
	background: lightgray;
	border-radius : 20px;
	margin-left : 30px;
}
.userinfo #detail span{
	font-size : 1.5em;
	margin-left : 40px;
	
}
#buydetail span{
	font-size : 1.2em;
}
	
</style>
	
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="loginMainView.do?id=admin" class="nav-link">회원페이지</a>
      </li>
    </ul>




  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="http://localhost/CFMS/mainPage.do" class="brand-link">
      <img src="${pageContext.request.contextPath}/images/logo_w.png"
           alt="AdminLTE Logo"
           class="brand-image img-circle elevation-3"
           style="width : 200px; box-shadow: none!important;">
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
          <br><br>
            <h1>회원 상세정보</h1>
            
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="member" id="info">
		
		<!-- 회원정보 -->
		<div class="userinfobox">
		<br><br>
		<table class="table" id="tb">
				<tr>
					<th>닉네임</th>
					<th>아이디</th>
					<th>포인트</th>
					<th>전화번호</th>
					<th>이메일</th>
				</tr>
			
				<%
				
					CustomerVO cusVo = (CustomerVO)request.getAttribute("userinfo");
		
					 
				%>
	
					
						<tr>
						<td><%= cusVo.getNicknm() %></td>
						<td><%= cusVo.getCus_id() %></td>
						<td><%= cusVo.getPoint() %></td>
						<td><%= cusVo.getTel() %></td>
						<td><%= cusVo.getEmail() %></td>
						</tr>
					
					<!-- 구매내역 bar -->
					<tr id="buylistBAR">
						<td colspan="5" class="tt">구매 내역</td>
						
					</tr>
					<!-- 구매내역 리스트  -->
					<tr id = "buydetail">
					<td>순번</td>     
					<td>구매일자</td>     
					<td>상품명</td>      
					<td>구매가격</td>
					<td>비고</td>
					</tr>
					
					<%
					
						List<BuyVO> buyList = (List<BuyVO>)request.getAttribute("buylist");
						List<SelVO> selList = (List<SelVO>)request.getAttribute("sellist");
						List<ProductVO> buyProdList = (List<ProductVO>)request.getAttribute("buyprodlist");
						List<ProductVO> selProdList = (List<ProductVO>)request.getAttribute("selprodlist");
					
					
						if(buyList!=null){
							for(int i =0; i<buyList.size(); i++){
								BuyVO buyVo = buyList.get(i);
								ProductVO buyProdVo = buyProdList.get(i);
							

					%>
					
						<tr>
						<td><%=i+1 %></td>
						<td><%= buyVo.getBuy_dt() %></td>
						<td><%= buyProdVo.getPro_nm() %></td>
						<td><%= buyProdVo.getPro_pr() %></td>
						<td></td>
						</tr>
					
					
					
					<%
					
							}
						}
						
					%>
					
					<!-- 판매내역 bar -->
					
					<tr id="buylistBAR">
						<td colspan="5" class="tt">판매 내역</td>
						
					</tr>
					<!-- 판매내역 리스트  -->
					<tr id = "buydetail">
					<td>순번</td>     
					<td>판매일자</td>     
					<td>상품명</td>
				    <td>판매가격</td>
				    <td>비고</td>
					</tr>
					<%
					
				
						if(selList!=null){
							for(int i =0; i<selList.size(); i++){
								SelVO selVo = selList.get(i);
								ProductVO selProdVo = selProdList.get(i);
							

					%>
					
						<tr>
						<td><%=i+1 %></td>
						<td><%= selVo.getSel_dt() %></td>
						<td><%= selProdVo.getPro_nm() %></td>
						<td><%= selProdVo.getPro_pr() %></td>
						<td></td>
						</tr>
					
					
					
					<%
					
							}
						}
						
					%>
				
					</table>
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