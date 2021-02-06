<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@page import="kr.or.ddit.cfms.vo.ProlistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_login.css" />
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script>
// 	var modal = document.getElementById('id01');

// 	window.onclick = function(event) {
// 		if (event.target == modal) {
// 			modal.style.display = "none";
// 		}
// 	}
</script>

<title>gifti_ILJO</title>
</head>
<body>
	<div id="container">
		<div id="content_wrap">
		
			<!-- header 시작 -->
			<div class="header">
			
				<!-- navbar 시작 -->
				<div id="navbar">
					<div class="inner">
						<div class="logo">
							<h1><a href="http://localhost/CFMS/mainPage.do">gifti-ILJO</a></h1>
						</div>
						<div class="search">
							<input type='text' class="search_area" id='search' name='search' placeholder="기프티일조에서 원하시는 상품을 검색해보세요.">
							<label for=""><a href="javascript:topsearch();" class="btn_sch"><img src="${pageContext.request.contextPath}/images/search.png" alt="검색"></a></label>
							
						</div>
						<div class="right_menu">
							<p><a id="cust_on" href="#all_products">상품</a></p>
							<p><a href="#">고객센터</a></p>
						</div>			
					</div>
				</div>	
				<!-- navbar 끝 -->
				
				<!-- loginbar before 시작 -->
				<div class="loginbar_wrap before">
					<ul>
						<li class ="loginbar"><a data-toggle="modal" href="#id01">로그인</a></li>


						<li class ="loginbar"><a href="${pageContext.request.contextPath}/board/main_joinmember.jsp" class="bar">회원가입</a></li>

					</ul>
				</div>
				<!-- loginbar before 끝 -->
				
				<!-- loginbar after 시작 -->
				<div class="loginbar_wrap after" style="display:none;">
					<ul>
						<li class ="loginbar"><a href="#">홍길동님</a></li>
						<li class ="loginbar"><a href="#" class="bar">마이페이지</a></li>
						<li class ="loginbar"><a href="#" class="bar">상품등록</a></li>
						<li class ="loginbar"><a href="#" class="bar">포인트충전</a></li>
						<li class ="loginbar"><a href="#" class="bar">로그아웃</a></li>
					</ul>
				</div>
				<!-- loginbar after 끝 -->
				
			</div>
			<!-- header 끝 -->
			
			
			<!-- body 시작 -->
			<div class="body">
			
				<!-- main_slide 시작 -->
				<div class="main_slide">
					<a href=""><img src="${pageContext.request.contextPath}/images/123.jpg" alt=""></a>
				</div>
				<!-- main_slide 끝 -->
				
				<!-- all_products 시작 -->
				<div class="all_products" id="all_products">
					<h3>전체상품</h3>
					
					<!-- filter 시작 -->
					<div class="filter">
						
						<dl class="filter_category">
							<dt>카테고리</dt>
							<dd>
								<ul>
									<li class="category">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A1">
										<label for="A1">베이커리/도넛</label>
									</li>
									<li class="category">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A2">
										<label for="A2">커피/음료</label>
									</li>
									<li class="category">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A3">
										<label for="A3">편의점</label>
									</li>
									<li class="category">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A4">
										<label for="A4">피자/치킨</label>
									</li>
									<li class="category">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A5">
										<label for="A5">패스트푸드</label>
									</li>
								</ul>
							</dd>
						</dl>
													
						<dl>
							<dt>브랜드</dt>
							<dd class="filter_brand">
								<ul>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B1">
									<label for="B1">파리바게트</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B2">
									<label for="B2">던킨</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B3">
									<label for="B3">스타벅스</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B4">
									<label for="B4">메가커피</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B5">
									<label for="B5">GS25</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B6">
									<label for="B6">이마트24</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B7">
									<label for="B7">도미노피자</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B8">
									<label for="B8">BBQ</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B9">
									<label for="B9">맥도날드</label>
								</li>
								<li class="brand">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B10">
									<label for="B10">서브웨이</label>
								</li>
							</ul>
							</dd>
						</dl>
				
						<dl class="filter_price">
							<dt>가격</dt>
							<dd>
								<ul>
								<li class="price">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C1">
									<label for="C1">3천원이하</label>
								</li>
								<li class="price">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C2">
									<label for="C2">3천-5천원</label>
								</li>
								<li class="price">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C3">
									<label for="C3">5천-1만원</label>
								</li>
								<li class="price">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C4">
									<label for="C4">1만-3만원</label>
								</li>
								<li class="price">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C5">
									<label for="C5">3만원이상</label>
								</li>
							</ul>
							</dd>
						</dl>
					</div>
					<!-- filter 끝 -->
					

					
					<!-- DB에 저장된 상품 게시글을 받아오는 작업 -->
					<div class="products">
						<ul class="arrange_products">
							<li><a href = "#">최근순</a></li>
							<li><a href = "#">낮은 가격순</a></li>
							<li><a href = "#">높은 가격순</a></li>
						</ul>
					
						<ul class="product_ul">
						<%
							List<ProlistVO> proList = (List<ProlistVO>)request.getAttribute("prolist");
							List<ProductVO> prodList = (List<ProductVO>)request.getAttribute("prodlist");
							if(prodList.size()!=0){			
							for(int i = 0; i<proList.size(); i++){
								ProlistVO proVo = proList.get(i);
								ProductVO prodVo = prodList.get(i);
								int no = i+1;
								
								int pie = (int)Math.round(prodVo.getPro_pr()*100.0/prodVo.getRet_pr());
								
								pie = 100-pie;
						
						%>
						
						<!-- http://199.999.999(개발서버ip)/이미지  절대경로/aaa.jpg
						D:\D_Other\uploadImage -->
						

						<li class="product"  OnClick="#">
							 
							<!-- <img id="test" src="http://192.168.42.46/imageResponse.jsp" > -->
							<%-- <img alt="오류" src="${pageContext.request.contextPath}/images/coffee.jpg"> --%>
							<div class="product_wrapper">
								<div class="product_img">
									<%
										if(prodVo.getBrand().equals("파리바게트")){
									%>
									
									<img id="image" src="${pageContext.request.contextPath}/images/paris.jpg" alt="파리바게트">

									<%
										}else if(prodVo.getBrand().equals("던킨")){
									%>	

									<img id="image" src="${pageContext.request.contextPath}/images/dunkin.jpg" alt="던킨">

									<%
										}else if(prodVo.getBrand().equals("스타벅스")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/star.jpg" alt="스타벅스">
									
									<%
										}else if(prodVo.getBrand().equals("메가커피")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/mega.jpg" alt="메가커피">
									
									<%
										}else if(prodVo.getBrand().equals("GS25")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/gs25.jpg" alt="GS25">
									
									<%
										}else if(prodVo.getBrand().equals("이마트24")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/emart.jpg" alt="이마트24">
									
									<%
										}else if(prodVo.getBrand().equals("도미노피자")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/domino.jpg" alt="도미노피자">
									
									<%
										}else if(prodVo.getBrand().equals("BBQ")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/bbq.jpg" alt="BBQ">
									
									<%
										}else if(prodVo.getBrand().equals("맥도날드")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/mcdonald.jpg" alt="맥도날드">
									
									<%
										}else if(prodVo.getBrand().equals("서브웨이")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/subway.jpg" alt="서브웨이">
									
									<%
										}
									%>
									
									<p class="sale">SALE <%=pie %>%</p>
								</div>
								<div class="product_txt">
									<p class="product_before_price"><%=prodVo.getRet_pr()%></p>
									<p class="product_price"><%=prodVo.getPro_pr() %></p>
									<p class="product_name"><%=prodVo.getPro_nm() %></p>
									<p class="product_brand"><%=prodVo.getBrand() %></p>
									<p class="product_brand"><%=proVo.getSel_check()%></p>
								</div>
							</div>
						</li>
						
						<% 
							}

							}
						%> 

						</ul> 
						<div class="push"></div>

					</div> 
					<!-- products 끝 -->
					
				</div>
				<!-- all_products 끝 -->
				
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
	
	
	<!-- start modal 로그인	 -->
	<div id="id01" class="modal">
		<div class="modal_wrapper">
			<form class="modal-content animate" action="<%=request.getContextPath()%>/SessionLoginServlet.do" method="post">
			 	
			 	<div class="modal_conts">
					<div class="imgcontainer">
						<span onclick="document.getElementById('id01').style.display='none'"
							class="close" title="Close Modal">&times;</span> 
						<img src="${pageContext.request.contextPath}/images/logo_yellow_back.png" alt="Avatar" class="avatar">
					</div>
		
					<div class="container_modal">
						<label for="uname">
							<p>아이디</p>
						</label> 
						<input id="modalid" type="text" placeholder="아이디 입력" name="uname" required> 
						<label  for="psw">
							<p>비밀번호</p>
						</label> 
						<input id="modalpass" type="password" placeholder="비밀번호 입력" name="psw" required>
						<button id="modalbutton" type="submit">로그인</button>
						<label> 
							<input id="moadlcheck" type="checkbox" checked="checked" name="remember">
							<span>아이디 기억하기</span>
						</label>
					</div>
		
					<div class="container">
						<a href="${pageContext.request.contextPath}/board/findId.jsp" id="search_id">
							<span>아이디찾기</span>
						</a>
						<a href="${pageContext.request.contextPath}/board/findPass.jsp" id="search_pass">
							<span>비밀번호찾기</span>
						</a>
					</div>
				</div>
				<!-- modal_conts 끝 -->
			</form>
		</div>
	</div>
	<!-- end modal 로그인 -->
	
</body>
</html>