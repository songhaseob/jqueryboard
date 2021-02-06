<%@page import="kr.or.ddit.cfms.vo.BuyVO"%>
<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
 	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
 	
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
	
	<script>
// 	$(function(){
	
// 		$.ajax({
// 			url : '/CFMS/Customerlist.do',
// 			data : 'post',
// 			dataType: 'json',
// 			success : function(res){
				
// 				code = '<h5>회원아이디      닉네임        포인트      핸드폰번호          이메일  신고횟수  </h5><hr>';
// 				$.each(res, function(i, v){
// 					code += '<div class="cusinfo" OnClick="location.href=' + "'" + 'cusView.do?id=' + v.cusid + "'" + '" style="cursor:pointer;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp';
// 					code += '&nbsp&nbsp&nbsp&nbsp' + v.cusid;
// 					code += '&nbsp&nbsp&nbsp&nbsp' + v.nick;
// 					code += '&nbsp&nbsp&nbsp&nbsp' + v.point;
// 					code += '&nbsp&nbsp&nbsp&nbsp' + v.tel;
// 					code += '&nbsp&nbsp&nbsp&nbsp' + v.email;
// 					code += '&nbsp&nbsp&nbsp&nbsp' + v.cnt;
// 					code += ' </div> <hr>';		
// 				})
				
		
				
// 				$('.content #info').html(code);
				
// 			},
// 			error : function(xhr){
// 				alert("상태 : " + xhr.status);
// 			}
			
// 		})
			
// 	})
	
	</script>
	
</head>

<body class="hold-transition sidebar-mini">

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
          	
            <h1>일반회원관리</h1>
            
            <div id="sc">
             <input type="text" id="search"  placeholder="ID를 검색하세요" >
             <button id="sh" class="btn btn-outline-primary" onclick="sear()">검색</button>
          </div>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="member" id="info">
		
		<!-- 회원 정보를 가져오는 구간  -->
		
			<table class="table" id="tb">
				<tr>
					<th>회원아이디</td>
					<th>닉네임</th>
					<th>포인트</th>
					<th>핸드폰</th>
					<th>이메일</th>
					<th>신고횟수</th>
				</tr>
		
		<%
			List<CustomerVO> custList = (List<CustomerVO>)request.getAttribute("allcustomer");
			
			
			if(custList!=null){
				for(int i = 0; i<custList.size(); i++){
					CustomerVO cusVo = custList.get(i);
		%>
						<tbody>
					 	<tr class="userinfo" OnClick="location.href = 'cusView.do?id=<%= cusVo.getCus_id() %>'" style="cursor:pointer;">
						<td><%= cusVo.getCus_id() %></td>
						<td><%= cusVo.getNicknm() %></td>
						<td><%= cusVo.getPoint() %></td>
						<td><%= cusVo.getTel() %></td>
						<td><%= cusVo.getEmail() %></td>
						<td><%= cusVo.getReport_cnt() %></td>
						</tr>
			
					
		<% 
				}
			}
			
		%>	
					</tbody>
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
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
</body>
<script>
function sear(){
    var search = $("#search").val().trim();
      $("#tb > tbody > tr").hide();
      var temp = $("#tb > tbody > tr > td:contains('"+ search +"')");
      $(temp).parent().show();
 }
</script>
</html>