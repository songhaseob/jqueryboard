<%@page import="kr.or.ddit.cfms.vo.ProlistVO"%>
<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub_product.css">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">
	<title>상품등록 페이지</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script>
	$(function(){
		$('#result').on('click',function () {
		 	pname = $("#pname").val() ;
		 	rprice = $("#rprice").val();
		 	sprice = $("#sprice").val(); 
		 	cont = $("#cont").val();
		 	file = $("#file2").val();
		 	
		 	if(pname==""||rprice==""||sprice==""||cont==""||file==""){
		 		alert("모든 입력사항을 작성해주세요");
		 		return false;
		 	}else{
		 		alert("게시글이 수정 되었습니다.")
		 	}
		 	
		 	
		}) 
	})
	
	</script>
</head>
<body>
	<%
		CustomerVO custVo = (CustomerVO)request.getAttribute("userinfo");
		ProductVO vo = (ProductVO)request.getAttribute("product");
		ProlistVO vo2 = (ProlistVO)request.getAttribute("prolist");
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
			
			<!-- 상품등록 시작 -->
			<!-- body 시작 -->
			<div class="body">
			
				<!-- wrapper 시작 -->
				<div id="wrapper">
					<h2>상품등록</h2>
					<form id="uploadFile" method="post" enctype="multipart/form-data" action="/CFMS/updateProductRegistration.do">
						<div class="regi_form">
							<div class="regi_row">
								
								<input type="text" value="<%=custVo.getCus_id()%>" name="id" style="display:none">
								<input type="text" value="<%=custVo.getNicknm()%>" name="name" style="display:none">
								<input type="text" value="<%=vo2.getList_num()%>" name="listnum" style="display:none">
								
							</div>
							<div class="regi_row">
								<label>카테고리</label>
								<select id="category" name="category">

								    <option value="베이커리/도넛" selected="selected">베이커리/도넛</option>
								    <option value="커피/음료" >커피/음료</option>
								    <option value="편의점">편의점</option>
								    <option value="피자/치킨">피자/치킨</option>
								    <option value="패스트푸드">패스트푸드</option>
								</select>
							</div>
							<div class="regi_row">
								<label>브랜드</label>
								<select id="brand" name="brand">
								
								    <option value="파리바게트" selected="selected">파리바게트</option>
								    <option value="던킨">던킨</option>
								    <option value="스타벅스">스타벅스</option>
								    <option value="메가커피">메가커피</option>
								    <option value="GS25">GS25</option>
								    <option value="이마트24">이마트24</option>
								    <option value="도미노피자">도미노피자</option>
								    <option value="BBQ">BBQ</option>
								    <option value="맥도날드">맥도날드</option>
								    <option value="서브웨이">서브웨이</option>
								</select>
							</div>
							<div class="regi_row">
								<label>상품명</label>
								<input type="text" id="pname" name="pname" value="<%=vo.getPro_nm()%>">
							</div>
							<div class="regi_row">
								<label>소비자가격</label>
								<input type="text" id="rprice" name="rprice" value="<%=vo.getRet_pr()%>">
							</div>
							<div class="regi_row">
								<label>판매가격</label>
								<input type="text" id="sprice" name="sprice" value="<%=vo.getPro_pr()%>">
							</div>
							<div class="regi_row">
								<label>내용</label>
								<textarea id="cont" name="cont"><%=vo2.getCont() %></textarea>
							</div>
							<div class="regi_row">
								<label>기프티콘사진</label>
								<input type="file" id="file2" name = file2>
							</div>
							
							<!-- <button type="button"></button> -->
							<%-- <a href="<%=request.getContextPath()%>/uploadedFilesServlet.do">전송하기</a> --%>
							<%-- <button type="button" onclick="location.href='<%=request.getContextPath()%>/productRegistration.do'">상품등록</button> --%>
							
							<div class="btn">
								<button id="result" type="submit">
									<span>상품등록</span>
								</button>
							</div>
						</div>
						<!-- End regi_form -->
						
					</form>
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
	<!-- container 끝 -->
</body>
</html>