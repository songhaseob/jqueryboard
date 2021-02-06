<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
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
	
	<title>gifti_ILJO</title>
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>gifti_ILJO</title>

<script>
// 	var modal = document.getElementById('id01');

// 	window.onclick = function(event) {
// 		if (event.target == modal) {
// 			modal.style.display = "none";
// 		}
// 	}


</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>gifti_ILJO</title>

<script>
// 	var modal = document.getElementById('id01');

// 	window.onclick = function(event) {
// 		if (event.target == modal) {
// 			modal.style.display = "none";
// 		}
// 	}
</script>


</head>
<body>
	<%
		CustomerVO custVo = (CustomerVO)request.getAttribute("userinfo");
		List<String> cateList = (List<String>)request.getAttribute("category");
		List<String> brandList = (List<String>)request.getAttribute("brand");
		List<String> priceList = (List<String>)request.getAttribute("price");
		
		String bandd="";
		String coffee="";
		String conv="";
		String pizch="";
		String fast="";
		
		String pari = "";
		String dunkin = "";
		String starbuc = "";
		String megaco = "";
		String gs25 = "";
		String emart24 = "";
		String domino = "";
		String bbq = "";
		String macdo = "";
		String subway = "";
		
		String p1 = "";
		String p2 = "";
		String p3 = "";
		String p4 = "";
		String p5 = "";
		
		
		if(cateList!=null){
			for(int i=0; i<cateList.size(); i++){
				if(cateList.get(i).equals("베이커리/도넛")){
					bandd="checked";
				}
				if(cateList.get(i).equals("커피/음료")){
					coffee="checked";
				}
				if(cateList.get(i).equals("편의점")){
					conv="checked";
				}
				if(cateList.get(i).equals("피자/치킨")){
					pizch="checked";
				}
				if(cateList.get(i).equals("패스트푸드")){
					fast="checked";
				}
			}
		}
		
		if(brandList!=null){
			for(int i=0; i<brandList.size(); i++){
				if(brandList.get(i).equals("파리바게트")){
					pari="checked";
				}
				if(brandList.get(i).equals("던킨")){
					dunkin="checked";
				}
				if(brandList.get(i).equals("스타벅스")){
					starbuc="checked";
				}
				if(brandList.get(i).equals("메가커피")){
					megaco="checked";
				}
				if(brandList.get(i).equals("GS25")){
					gs25="checked";
				}
				if(brandList.get(i).equals("이마트24")){
					emart24="checked";
				}
				if(brandList.get(i).equals("도미노피자")){
					domino="checked";
				}
				if(brandList.get(i).equals("BBQ")){
					bbq="checked";
				}
				if(brandList.get(i).equals("맥도날드")){
					macdo="checked";
				}
				if(brandList.get(i).equals("서브웨이")){
					subway="checked";
				}
			}
		}
		
		if(priceList!=null){
			for(int i=0; i<priceList.size(); i++){
				if(priceList.get(i).equals("3000")){
					p1="checked";
				}
				if(priceList.get(i).equals("5000")){
					p2="checked";
				}
				if(priceList.get(i).equals("10000")){
					p3="checked";
				}
				if(priceList.get(i).equals("30000")){
					p4="checked";
				}
				if(priceList.get(i).equals("50000")){
					p5="checked";
				}
			}
		}
		
	
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
							<p><a id="cust_on" href="#all_products">상품</a></p>
							<p><a OnClick="location.href ='customerService.do?id=<%=custVo.getCus_id()%>'">고객센터</a></p>
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
						<form action="category.do" id="checkedCate" method="post">
							<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden="">
							<dl class="filter_category">
								<dt>카테고리</dt>
								<dd>
									<ul>
										<li class="category">
											<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=bandd%> name="Category" value="베이커리/도넛" id="A1">
											<label for="A1">베이커리/도넛</label>
										</li>
										<li class="category">
											<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=coffee %> name="Category" value="커피/음료" id="A2">
											<label for="A2">커피/음료</label>
										</li>
										<li class="category">
											<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=conv %>  name="Category" value="편의점" id="A3">
											<label for="A3">편의점</label>
										</li>
										<li class="category">
											<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=pizch %> name="Category" value="피자/치킨" id="A4">
											<label for="A4">피자/치킨</label>
										</li>
										<li class="category">
											<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=fast %> name="Category" value="패스트푸드" id="A5">
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
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox"<%=pari %> name="Brand" value="파리바게트" id="B1">
										<label for="B1">파리바게트</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=dunkin %> name="Brand" value="던킨" id="B2">
										<label for="B2">던킨</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=starbuc %> name="Brand" value="스타벅스" id="B3">
										<label for="B3">스타벅스</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=megaco %> name="Brand" value="메가커피" id="B4">
										<label for="B4">메가커피</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=gs25 %> name="Brand" value="GS25" id="B5">
										<label for="B5">GS25</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=emart24 %> name="Brand" value="이마트24" id="B6">
										<label for="B6">이마트24</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=domino %> name="Brand" value="도미노피자" id="B7">
										<label for="B7">도미노피자</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=bbq %> name="Brand" value="BBQ" id="B8">
										<label for="B8">BBQ</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=macdo %> name="Brand" value="맥도날드" id="B9">
										<label for="B9">맥도날드</label>
									</li>
									<li class="brand">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=subway %> name="Brand" value="서브웨이" id="B10">
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
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=p1 %> name="Price" value="3000" id="C1">
										<label for="C1">3천원미만</label>
									</li>
									<li class="price">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=p2 %> name="Price" value="5000" id="C2">
										<label for="C2">3천원이상-5천원미만</label>
									</li>
									<li class="price">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=p3 %> name="Price" value="10000" id="C3">
										<label for="C3">5천원이상-1만원미만</label>
									</li>
									<li class="price">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=p4 %> name="Price" value="30000" id="C4">
										<label for="C4">1만원이상-3만원미만</label>
									</li>
									<li class="price">
										<input onchange="document.getElementById('checkedCate').submit();" type="checkbox" <%=p5 %> name="Price" value="50000" id="C5">
										<label for="C5">3만원이상</label>
									</li>
								</ul>
								</dd>
							</dl>
						</form>
					</div>
					<!-- filter 끝 -->
					

					
					<!-- DB에 저장된 상품 게시글을 받아오는 작업 -->
					<div class="products">
						
					
						<ul class="product_ul">
						<%
							List<ProlistVO> proList = (List<ProlistVO>)request.getAttribute("prolist");
							List<ProductVO> prodList = (List<ProductVO>)request.getAttribute("prodlist");
							if(prodList.size()!=0){	
							for(int i = proList.size()-1; i>=0; i--){			
							//for(int i = 0; i<proList.size(); i++){
								
								
								ProlistVO proVo = proList.get(i);
								ProductVO prodVo = prodList.get(i);
								int no = prodVo.getList_num();

								
								int pie = (int)Math.round(prodVo.getPro_pr()*100.0/prodVo.getRet_pr());
								
								pie = 100-pie;

						
						%>
						
						<!-- http://199.999.999(개발서버ip)/이미지  절대경로/aaa.jpg
						D:\D_Other\uploadImage -->
						
						
						<li class="product"  OnClick="location.href ='productView.do?num=<%=no%>&id=<%=custVo.getCus_id()%>'" style="cursor:pointer;">
							 
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
	

	<!-- start modal	 -->
	<div id="id01" class="modal">
		<form class="modal-content animate" action="<%=request.getContextPath()%>/SessionLoginServlet.do" method="post">
		 
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> 
				<img src="../images/logo.png" alt="Avatar" class="avatar">
			</div>

			<div class="container_modal">
				<label for="uname"><b>아이디</b></label> 
					<input id="modalid" type="text" placeholder="아이디 입력" name="uname" required> 
					<label  for="psw"><b>비밀번호</b></label> 
				<input id="modalpass" type="password" placeholder="비밀번호 입력" name="psw" required>
				<button id="modalbutton" type="submit">로그인</button>
				<label> 
				<input id="moadlcheck" type="checkbox" checked="checked" name="remember"> 아이디기억하기
				</label>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<a href="#">아이디찾기 </a>&nbsp;<a href="#">비밀번호찾기</a>
			</div>
		</form>
	</div>
	<!-- end modal -->
</body>
</html>