<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@page import="kr.or.ddit.cfms.vo.ProlistVO"%>
<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub_product.css">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
<%
	CustomerVO custVo = (CustomerVO)request.getAttribute("userinfo");
	ProductVO vo = (ProductVO)request.getAttribute("product");
	ProlistVO vo2 = (ProlistVO)request.getAttribute("prolist");
	int report = (int)request.getAttribute("report");
	int selinfo = (int)request.getAttribute("selinfo");

	int pie = (int)Math.round(vo.getPro_pr()*100.0/vo.getRet_pr());
	
	pie = 100-pie;
%>
<script>
	$(function() {
		$('#buyProduct').on('click',function () {
			price = <%=vo.getPro_pr()%>;
			point = <%=custVo.getPoint()%>;
			check = "<%=vo2.getSel_check()%>";
			if(check=="판매중"){
				if(price>point){
					alert("포인트가 부족합니다.");
				}else{
					$.ajax({
						type: "POST", 
			             url: "/CFMS/buyProduct.do", 
			             data: {
			                "buyerId" : "<%=custVo.getCus_id()%>",
			                "sellerId" : "<%=vo.getCus_id()%>",
			                "price" : price,
			               
			                "code" : <%=vo.getList_num()%>,
			                "tel" : "<%=custVo.getTel()%>"
			                
			             },
			            success : function (res) {
							alert(res.sw);
							document.location.href="loginMainView.do?id=<%=custVo.getCus_id()%>";
						},
						error : function (xhr) {
							alert("실패 : " + xhr.status)
						},
						dataType : "json"
					})
				}
			}else {
				alert("판매된 상품입니다.");
			}
			
		})
		
		$('#deleteProduct').on('click',function () {

			num = <%=vo.getPro_num()%>;
			check = "<%=vo2.getSel_check()%>";
			if(check=="판매중"){
				
					$.ajax({
						type: "POST", 
			             url: "/CFMS/deleteProduct.do", 
			             data: {
			                "num" : num
			                
			             },
			            success : function (res) {
							alert(res.sw);
							document.location.href="loginMainView.do?id=<%=custVo.getCus_id()%>";
						},
						error : function (xhr) {
							alert("실패 : " + xhr.status)
						},
						dataType : "json"
					})
			} else{
				alert("판매된상품은 삭제가 불가능합니다.");
			}	
			
			
		})
		
		$('#updateProduct').on('click',function () {
			check = "<%=vo2.getSel_check()%>";
			if(check=="판매중"){
			document.location.href="updateProduct.do?id=<%=custVo.getCus_id()%>&num=<%=vo.getPro_num()%>";
			}else{
				alert("판매된상품은 수정이 불가능합니다.");
			}
				
			
			
		})
		
		
		
		
		$(function(){
			$('#insertsend').on('click', function(){
				// 신고 내용들
			var cont = $('#cont').val();
			var	title = $('#title').val();
				
				// 블랙리스트에 들어갈 정보들
			var	writer = "<%= custVo.getNicknm() %>";
			var	userid = "<%= custVo.getCus_id()%>";
			var	reportedid = "<%=vo2.getCus_id() %>";
			var	selid = "<%=vo2.getCus_id() %>";
				// 상품 번호 or 상품 게시글 번호
			code = <%= vo2.getList_num()%>;

			$.ajax({
				url : '/CFMS/Blacklistinsert.do',
				type : 'post',
				dataType : 'json',
				data : { 'title' : title, 'cont' : cont, 
					'writer' : writer, 
					'userid' : userid,
					'reportedid' : reportedid,
					'selid' : selid,
					'prodnum' : code},
				success : function(res){
					alert(res.res1);
					
					
				}
		
				})
				
				
				alert("신고 완료 되었습니다")
				document.location.href="loginMainView.do?id=<%=custVo.getCus_id()%>";
			
			})
				
		})
		
	})
</script>
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
			<div class="body">	
				<div id="wrapper">
				
					<div class="sub_menu_wrapper">
						<div class="sub_title">
							<h1><%=vo.getPro_cg()%> >  <span><%=vo.getBrand()%></span></h1>
							<hr>
						</div> 
					</div> 
					
					<div class="middle_product">
						<div class="middle_product1">
							<%
										if(vo.getBrand().equals("파리바게트")){
									%>
									
									<img id="image" src="${pageContext.request.contextPath}/images/paris.jpg" alt="파리바게트">

									<%
										}else if(vo.getBrand().equals("던킨")){
									%>	

									<img id="image" src="${pageContext.request.contextPath}/images/dunkin.jpg" alt="던킨">

									<%
										}else if(vo.getBrand().equals("스타벅스")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/star.jpg" alt="스타벅스">
									
									<%
										}else if(vo.getBrand().equals("메가커피")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/mega.jpg" alt="메가커피">
									
									<%
										}else if(vo.getBrand().equals("GS25")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/gs25.jpg" alt="GS25">
									
									<%
										}else if(vo.getBrand().equals("이마트24")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/emart.jpg" alt="이마트24">
									
									<%
										}else if(vo.getBrand().equals("도미노피자")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/domino.jpg" alt="도미노피자">
									
									<%
										}else if(vo.getBrand().equals("BBQ")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/bbq.jpg" alt="BBQ">
									
									<%
										}else if(vo.getBrand().equals("맥도날드")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/mcdonald.jpg" alt="맥도날드">
									
									<%
										}else if(vo.getBrand().equals("서브웨이")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/subway.jpg" alt="서브웨이">
									
									<%
										}
									%>
						</div> 
						<div class="middle_product_con">
							<p class="title_brand"><%=vo.getBrand()%></p>
							<p class="title_product_name"><%=vo.getPro_nm() %></p>
							<p class="sale"><%=pie %>%</p>
							<div class="price_wrap">
								<strike class="strike"><%=vo.getRet_pr() %>원</strike>
								<p class="price"><%=vo.getPro_pr()%>원</p>
							</div>
							<button type="submit" id="buyProduct">기프티콘구매하기</button>
							
							<%
								String hide = "";
								if(!vo.getCus_id().equals(custVo.getCus_id())){
									hide = "hidden=''";
								}
							%>
							
						</div>
						
						
						
						<div class="middle_product_ex">
							<h3>상품설명</h3>
							<p><%=vo2.getCont() %></p>
							
							<div class="prod_btn">
								<button type="submit" id="updateProduct" <%=hide %> >수정</button>
								<button type="submit" id="deleteProduct" <%=hide %> >삭제</button>
							</div>
							
							
							<div class="default_txt">
								<p class="default_txt_title">[이용안내]</p>
								<p>
								★본 상품은 프로모션 상품으로 유효기간 연장 및 환불이 불가합니다.★<br>
								- 모바일쿠폰은 온라인 주문으로 사용 가능합니다.<br>
								- 교환은 온라인 주문으로만 사용 가능합니다.<br>
								- 매장 상황에 따라 온라인 주문이 불가능 및 지연 될 수 있습니다. (배달직원 교통사고, 피크타임, 재고 부족 등)<br>
								- 매장 상황에 따라 매장에서 드시는 것이 제한 될 수 있습니다.<br>
								- 모바일쿠폰 서비스는 교환 완료 후 주문 취소 불가합니다.<br>
								- 음료는 매장 별로 브랜드 및 종류의 차이가 있을 수 있습니다.<br>
								- 상기 이미지는 실제와 다를 수 있습니다.<br>
								- 가맹점 자체 행사 및 중복 할인은 적용되지 않습니다.<br>
								</p>							
							</div>
						</div>
					</div> 
					<!-- middle_product 끝 -->

				</div> 
				<!-- wrapper 끝 -->
				
				<div class="body2">
					<div class="wrapper2">
						<div class="under_sales">
							<h2>판매자정보</h2>
							<div class="under_sales1">
								<p class="seller">
									<img src="${pageContext.request.contextPath}/images/usericon.png" alt="유저" width="50px;" height="50px" class="under_images">
									<span>판매자 : <strong><%=vo2.getWriter()%></strong></span>
								</p>
								<p class="selling_count">
									<span>판매 건수</span> 
									<%=selinfo%>건
								</p>
								<p class="report_count">
									<span>신고 건수</span> 
									<%=report%>건
								</p>
								<div class="under_input">
									<input data-toggle="modal" data-target="#wModal" type="button" value="신고하기 " id="sos" class="sos">
								</div>
							</div> 
						</div> 
					</div>
				</div>
				
				
				
			</div>
			<!-- body 끝 -->
			 
			
		</div>
		<!-- content_wrap 끝 -->
		
		<div class="push"></div>
		
		<!-- footer -->
		<div id="footer">
			<p>Copyright ©gifti-ILJO Rights Reserved.</p>
		</div>
		
	</div>
	<!-- container 끝 -->
	
			   <!-- 확인  -->
 <div id="wModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">신고하기</h4>
      </div>
      <div class="modal-body">
      
      <form id = "wform" action = "tset.jsp" method = "post" onsubmit="return false">
      
		<span> 정말 &nbsp;&nbsp;'<%=vo2.getWriter() %>'&nbsp;&nbsp; 씨를 신고하시겠습니까?</span><br><br>
	
		<input type = "button" value = "확인" id="wsend" data-toggle="modal" data-target="#sendModal" data-dismiss="modal"><br>
	</form>
      
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

			   <!-- 확인창 이후의 모달 -->
 <div id="sendModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">신고하기</h4>
      </div>
      <div class="modal-body">
      
      <form id = "wform" action = "tset.jsp" method = "post" onsubmit="return false">
      
		<label>제목</label> <input type = "text" class="txt" id="title" name = "title"><br>
	
		<strong>내용</strong> <br><br>
		<textarea rows="10" cols="50" class="txt" id="cont" name = "cont"></textarea><br>
		<input type = "button" value = "확인" id="insertsend" data-dismiss="modal"><br>
	</form>
      
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
	
 
	
	
	
</body>
</html>