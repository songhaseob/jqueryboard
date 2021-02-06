<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@page import="kr.or.ddit.cfms.vo.SelVO"%>
<%@page import="kr.or.ddit.cfms.vo.BuyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.cfms.vo.ChargeVO"%>
<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sub_mypagehs.css">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">

<title>마이페이지</title>
</head>
<body>
	<%
		CustomerVO custVo = (CustomerVO)request.getAttribute("userinfo");
		List<ChargeVO> charList = (List<ChargeVO>)request.getAttribute("charlist");
		List<ChargeVO> charList2 = (List<ChargeVO>)request.getAttribute("datelist");
		List<BuyVO> buyList = (List<BuyVO>)request.getAttribute("buylist");
		List<SelVO> selList = (List<SelVO>)request.getAttribute("sellist");
		List<ProductVO> buyProdList = (List<ProductVO>)request.getAttribute("buyprodlist");
		List<ProductVO> selProdList = (List<ProductVO>)request.getAttribute("selprodlist");
		
		String tabInfo = (String)request.getAttribute("tabinfo");
		
		String myBuy = "";
		String myPoint = "";
		String myInfo = "";
		String myinfo_detail = "";
		
		if(tabInfo!=null){
			if(tabInfo.equals("mybuy")){
				myBuy = "checked";
			}
			if(tabInfo.equals("mypoint")){
				myPoint = "checked";
			}
			if(tabInfo.equals("myinfo")){
				myInfo = "checked";
			}
			if(tabInfo.equals("myinfo_detail")){
				myinfo_detail = "checked";
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
							<h1>
								<a href="http://localhost/CFMS/loginMainView.do?id=<%=custVo.getCus_id()%>">gifti-ILJO</a>
							</h1>
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

				<!-- // header -->

				<!-- login bar -->

				<div class="loginbar_wrap after">
					<ul>
						<li class="loginbar">
							<a href="myPageInfo.do?id=<%=custVo.getCus_id()%>"><%=custVo.getNicknm()%>님(<%=custVo.getPoint()%>P)</a>
						</li>
						<li class="loginbar">
							<a id="active_hover" href="myPageInfo.do?id=<%=custVo.getCus_id()%>" class="bar">마이페이지</a>
						</li>
						<li class="loginbar">
							<a href="productInfo.do?id=<%=custVo.getCus_id()%>" class="bar">상품등록</a>
						</li>
						<li class="loginbar">
							<a href="chargeInfo.do?id=<%=custVo.getCus_id()%>" class="bar">포인트충전</a>
						</li>
						<li class="loginbar">
							<a href="logOut.do?id=<%=custVo.getCus_id()%>" class="bar">로그아웃</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- header 끝 -->

			<!-- body 시작 -->
			<div class="body">
				<form action="searchMyInfo.do" id="searchMyInfo" method="post">
					<!-- wrapper 시작 -->
					<div id="wrapper">
						<h2>마이페이지</h2>
						<div class="main">

							<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
							<input class="tab" 	id="tab4" type="radio" value="myinfo_detail" name="tabs" <%=myinfo_detail %> onclick="document.getElementById('searchMyInfo').submit();">
							<label class="lb" for="tab4"><span>내정보</span></label>
							<input class="tab" 	id="tab3" type="radio" value="myinfo" name="tabs" <%=myInfo %> onclick="document.getElementById('searchMyInfo').submit();">
							<label class="lb" for="tab3"><span>내정보수정</span></label>
							<input class="tab" id="tab1" type="radio" value="mybuy" name="tabs" <%=myBuy %>	onclick="document.getElementById('searchMyInfo').submit();">
							<label class="lb" for="tab1"><span>거래내역조회</span></label> 
							<input class="tab" id="tab2" type="radio" value="mypoint" name="tabs" <%=myPoint %> onclick="document.getElementById('searchMyInfo').submit();">
							<label class="lb" for="tab2"><span>포인트정보</span></label> 
							
							<!-- 밑에 빈from 태그하나 해줘야 아래 form태그들이 잘먹힘 -->
							<form>
							</form>



							<!-- 섹션1 시작 -->
							<section id="content1">
								<div class="mysection deal">

									
									<div class=" form_wrapper">
									
										<p class="pr">조회기간</p>
	
										<form action="searchPaymentProduct.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="paydate" type="submit" value="1일">
										</form>
	
										<form action="searchPaymentProduct.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="paydate" type="submit" value="1주일">
										</form>
	
										<form action="searchPaymentProduct.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="paydate" type="submit" value="1개월">
										</form>
	
										<form action="searchPaymentProduct.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="paydate" type="submit" value="1년">
										</form>
	
										<form action="searchPaymentProductTerm.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input type="date" value="2018-07-22" name="startpaydate" min="2018-01-01" max="2020-12-31">
											~ <input type="date" value="2020-12-11" name="endpaydate" min="2018-01-01" max="2020-12-31"> 
											<input id="search" type="submit" value="조회">
										</form>
									</div>
								</div>
								<!-- deal 끝 -->
								<div class= "mysection buying">
									<h3><span class="dot">●</span>구매내역</h3>
									<div class="txt_bg">
										<p class="ct">주문일시</p>
										<p class="ct">상품명</p>
										<p class="ct">주문번호</p>
										<p class="ct">결제금액</p>
									</div>

									<ul class="myBuyList">
										<%
							if(buyList!=null){
								for(int i =0; i<buyList.size(); i++){
									BuyVO buyVo = buyList.get(i);
									ProductVO buyProdVo = buyProdList.get(i);
						%>
										<li id="myBuyPordList">
											<div class="myBuyPordView">
												<span><%=buyVo.getBuy_dt() %></span>
												<span><%=buyProdVo.getPro_nm()%></span>
												<span><%=buyVo.getBuy_cd() %></span>
												<span><%=buyProdVo.getPro_pr() %></span>	
											</div>
										</li>


										<%			
								}
							}
						
						%>
									</ul>
								</div>
								<div class="mysection selling">
									<h3><span class="dot">●</span>판매내역</h3>
									<div class="txt_bg">
										<p class="ct">주문일시</p>
										<p class="ct">상품명</p>
										<p class="ct">주문번호</p>
										<p class="ct">결제금액</p>
									</div>
									
									<ul class="mySelList">
										<%
								if(selList!=null){
									for(int i =0; i<selList.size(); i++){
										SelVO selVo = selList.get(i);
										ProductVO selProdVo = selProdList.get(i);
							%>
										<li id="mySelPordList">
											<div class="mySelPordView">
												<span><%=selVo.getSel_dt() %></span>
												<span><%=selProdVo.getPro_nm()%></span>
												<span><%=selVo.getSel_cd() %></span>
												<span><%=selProdVo.getPro_pr() %></span>
											</div>
										</li>


										<%			
									}
								}
							
							%>
									</ul>
								</div>
							</section>
							<!-- 섹션1 끝 -->

							<!-- 섹션2 시작 -->
							<section id="content2">
								<h3><span class="dot">●</span>포인트현황</h3>
								
								<div class="txt_bg">
									<p class="po ct">총 충전 포인트</p>
									<p class="po ct">사용 가능 포인트</p>
								</div>

								<%
									int totalPoint = 0;
									int usePoint = 0;
									int point = custVo.getPoint();
									if (charList != null) {
										for (int i = 0; i < charList.size(); i++) {
											totalPoint += charList.get(i).getCha_pr();
										}

										usePoint = totalPoint - point;
									}
								%>


								<div class="mysection">		
									<ul>					
										<li class="li_width">
											<div>
												<label><span><%=totalPoint %>P</span></label> 
												<label><span class="span_width2"><%=point %>P</span></label>
											</div>
										</li>
									</ul>
								</div>	

								
								<h3><span class="dot">●</span>포인트 / 사용내역</h3>
								<div class="mysection deal margin_none">
									
									<div class=" form_wrapper">
										<p class="pr">조회기간</p>
										
										<form action="searchDate.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="date" type="submit" value="1일">
										</form>
	
										<form action="searchDate.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="date" type="submit" value="1주일">
										</form>
	
										<form action="searchDate.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="date" type="submit" value="1개월">
										</form>
	
										<form action="searchDate.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="date" type="submit" value="1년">
										</form>
	
										<form action="searchDateTerm.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input type="date" value="2018-07-22" name="startdate" min="2018-01-01" max="2020-12-31">
											~ <input type="date" value="2020-12-11" name="enddate" min="2018-01-01" max="2020-12-31"> 
											<input id="search2" type="submit" value="조회">
										</form>
										
									</div>
									
								</div>
								<!-- deal 끝 -->
								
								
								<div class= "mysection">
								
									<div class="txt_bg">
										<p class="ct po1" id="price_width1">일시</p>
										<p class="ct po1">구분</p>
										<p class="ct po1" id="price_width2">금액</p>
									</div>
									
									<ul class="myChargePoint">
									
									<%
				    					if(charList2!=null){
				    						for(int i=0; i<charList2.size(); i++ ){
				    							ChargeVO charVo = charList2.get(i);
				    				%>
					    				
										<li id="myChargePointList">
											<div class="myChargePointView">
												<span class="span_width"><%=charVo.getCha_dt() %></span>
												<span class="span_width">포인트구매</span>
												<span class="span_width"><%=charVo.getCha_pr() %></span>
											</div>
										</li>
	
										<% 	
					    						}
					    					}
					    				%>
					    				
									</ul>
									
								
								</div>

							</section>
							<!-- 섹션2 끝 -->

							<!-- 섹션3 시작 -->
							<section id="content3">
								
								<div class="form_wrapper">
																			
									<h3><span class="dot">●</span>회원정보변경</h3>
										
									<div class="regi_form">
									
										<ul>
											<li>
												<label class="label">
													<p>이름</p>
												</label> 
												<input class="join" type="text">											
											</li>
											<li>
												<label class="label">
													<p>아이디</p>
												</label> 
												<input class="join" type="text">											
											</li>
											<li>
												<label class="label">
													<p>비밀번호 변경</p>
												</label> 
												<input class="join" type="password">											
											</li>
											<li>
												<label class="label">
													<p>핸드폰번호 변경</p>
												</label> 
												<input class="join" type="tel">											
											</li>											
										</ul>
										<div id="underdiv">
											<p>탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요</p>
											<input id="exit" type="submit" value="탈퇴하기">
										</div>
									
										
									
									</div>
									
								</div>
								
							</section>
							<!-- 섹션3 끝 -->
							
							
							<!-- 섹션4 시작 -->
							<section id="content4">
								
								<div class="form_wrapper">
																			
									<h3><span class="dot">●</span>내정보</h3>
										
									<div class="">
										<P>아이디 : <%=custVo.getCus_id() %></P>
										<P>닉네임 : <%=custVo.getNicknm()%></P>
										<P>포인트 : <%=custVo.getPoint()%>P</P>
										<P>전화번호 : <%=custVo.getTel()%></P>
										<P>이메일 : <%=custVo.getEmail()%></P>
										<P>신고횟수 : <%=custVo.getReport_cnt()%></P>
										
									
									</div>
									
								</div>
								
							</section>
							<!-- 섹션4 끝 -->
							

						</div>
						<!-- main 끝 -->


					</div>
					<!-- wrapper 끝 -->
				</form>
			</div>
			<!-- End body -->

		</div>
		<!-- End content_wrap -->
		<div class="push"></div>

		<!-- footer 시작 -->
		<div id="footer">
			<p>Copyright ©gifti-ILJO Rights Reserved.</p>
		</div>
		<!-- footer 끝 -->
	</div>
</body>
</html>