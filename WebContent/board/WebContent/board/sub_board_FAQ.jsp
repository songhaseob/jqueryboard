<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>FAQ</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub_product.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub_board.css">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
	
<script>
$(function(){

	// 공지사항 ajax ------------------------------- 시작
	$.ajax({
		  url : '/CFMS/CFMSBoardlist.do',
		  type : 'post',
		  dataType : 'json',
		  success : function(res){
			  
			  code = '<div class="panel-group" id="accordion">';
			  $.each(res, function(i,v){
				  
				  if(v.classify == 'FAQ'){
				 code +='<div class="panel panel-default">';
				 code +='	<div class="panel-heading">';
				 code +='		<div class="panel-title">';
				 code +='			<a data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.seq + '">';
				 code +='				<span class="board_classify">'+ v.classify +'</span>';
				 code +='				<span class="board_title">' + v.title + '</span>';
				 code +='				<span class="board_date">' + v.date + '</span>';		
				 code +='			</a>';
				 code +='		</div>';
				 code +='	</div>';
				 code +='	<div id="collapse'+ v.seq + '" class="panel-collapse collapse">';
				 code +='		<div class="panel-body">';			          
              	 code +='			<p>';
               	 code +='				<span class="cspan">' + v.cont + '</span>';
                 code +='			</p>';
                 code +='		</div>';
                 code +='	</div>';
                 code +='</div>';
				  }  
				  
			  })
			  code +='</div>';
			  
			
			  $('#faq .sub_content').html(code);
			 
		  },
		  error : function(xhr){
			  alert("상태 : " + xhr.status)
		  }
	  })
	  
	  
	  // 공지사항 ajax ------------------------------------- 끝  
	
	
})

</script>
</head>
<body>
	<%
		CustomerVO custVo = (CustomerVO)request.getAttribute("userinfo");
	%>
	<div id="container">
		<div id="content_wrap">
		
			<!-- header 시작 -->
			<div class="header">
			
				<!-- navbar 시작 -->
				<div id="navbar">
					<div class="inner">
						<div class="logo">

							<h1><a href="http://localhost/CFMS/loginMainView.do?id=<%=custVo.getCus_id()%>">gifti-ILJO</a></h1>

						</div>
						<div class="search">
							<form action="searchProduct.do" id="searchProduct" method="post">
								
								<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden="">
								<input type='text' class="search_area" id='search' name='search' placeholder="기프티일조에서 원하시는 상품을 검색해보세요.">
								<label for=""><a href="#" onclick="document.getElementById('searchProduct').submit();" class="btn_sch"><img src="${pageContext.request.contextPath}/images/search.png" alt="검색"></a></label>
							</form>
						</div>
						<div class="right_menu">
							<p>
								<a href="http://localhost/CFMS/loginMainView.do?id=<%=custVo.getCus_id()%>">상품</a>
							</p>
							<p>
								<a OnClick="location.href ='customerService.do?id=<%=custVo.getCus_id()%>'">고객센터</a>
							</p>
						</div>		
					</div>
				</div>	
				<!-- navbar 끝 -->
				
				<!-- loginbar before 시작 -->
				<div class="loginbar_wrap before" style="display:none;">
					<ul>
						<li class ="loginbar"><a data-toggle="modal" href="#id01">로그인</a></li>


						<li class ="loginbar"><a href="${pageContext.request.contextPath}/board/main_joinmember.jsp" class="bar">회원가입</a></li>

					</ul>
				</div>
				<!-- loginbar before 끝 -->
				
				<!-- loginbar after 시작 -->
				<div class="loginbar_wrap after">
					<ul>
						<li class ="loginbar"><a href="myPageInfo.do?id=<%=custVo.getCus_id()%>"><%=custVo.getNicknm()%>님(<%=custVo.getPoint()%>P)</a></li>
						<li class ="loginbar"><a href="myPageInfo.do?id=<%=custVo.getCus_id()%>" class="bar">마이페이지</a></li>
						<li class ="loginbar"><a href="productInfo.do?id=<%=custVo.getCus_id()%>" class="bar">상품등록</a></li>
						<li class ="loginbar"><a href="chargeInfo.do?id=<%=custVo.getCus_id()%>" class="bar">포인트충전</a></li>
						<li class ="loginbar"><a href="logOut.do?id=<%=custVo.getCus_id()%>" class="bar">로그아웃</a></li>
					</ul>
				</div>
				<!-- loginbar after 끝 -->
				
			</div>
			<!-- header 끝 -->
		
			<!-- body 시작 -->
			<div class="body footer_padding">
			
				<div class="sub_menu_nav" >
					<ul>
<%-- 						<li><a OnClick="location.href ='customerService.do?id=<%=custVo.getCus_id()%>'">공지사항</a></li> --%>
						<li><a href ="customerService.do?id=<%=custVo.getCus_id()%>">공지사항</a></li>
						
						<li class="active"><a href="#faq">FAQ</a></li>
					</ul>
				</div>
			
				<!-- wrapper 시작 -->
				<div id="wrapper">
					
					<!-- FAQ 시작  -->
					<div class="sub_menu_wrapper" id="faq">
						<div class="sub_title">
							<h2>FAQ</h2>
							<div class="notice_board">
								<p class="notice_board_title">
									<span class="board_classify_title">분류</span>
									<span class="board_title_title">제목</span>
									<span class="board_date_title">등록일</span>
								</p>
								<div class="sub_content"></div>
							</div>
						</div>
						
						
					</div>
					<!-- FAQ 끝  -->
					
								
				</div>
				<!-- wrapper 끝 -->
					
			</div>
				<!-- body 끝 -->
		
		</div>
		<!-- content_wrap 끝 -->
		
		
		<div class="push"></div>
			
		<!-- footer 시작 -->
		<div id="footer">
			<p>Copyright ©gifti-ILJO Rights Reserved.</p>
		</div>
		<!-- footer 끝 -->	
		
	</div>
</body>
</html>