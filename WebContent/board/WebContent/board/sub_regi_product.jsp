<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포인트 충전 페이지 </title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub_product.css">
<%
		CustomerVO custVo = (CustomerVO)request.getAttribute("userinfo");
%>
<script>
$(function() {
$('#charge_kakao').on('click',function () {
	
	
	// getter
    var IMP = window.IMP;
    IMP.init('imp89298381');
    var money = $('input[name="cp_item"]:checked').val();
    console.log(money);
    buyerName = '<%=custVo.getNicknm()%>';
    buyerId = '<%=custVo.getCus_id()%>'; 
    IMP.request_pay({
        pg: 'kakao',
        merchant_uid: 'merchant_' + new Date().getTime(), 

        name: '포인트 충전',
        amount: money,
        buyer_email: '<%=custVo.getEmail()%>',
        buyer_name: '<%=custVo.getNicknm()%>',
        buyer_tel: '<%=custVo.getTel()%>',
        buyer_addr: ' ',
        buyer_postcode: '123-456'
    }, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
     /*        msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num; */
            $.ajax({
                type: "POST", 
                url: "/CFMS/chargePoint.do", //충전 금액값을 보낼 url 설정
                data: {
                	"id" : buyerId,
                	"name" : buyerName,
                    "money" : money
                },
                success : function (res) {
					
				},
				error : function (xhr) {
					alert("실패 : " + xhr.status)
				},
				dataType : "json"
            });
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
        document.location.href="loginMainView.do?id=<%=custVo.getCus_id()%>"; //alert창 확인 후 이동할 url 설정
    }); 
});
});
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
						<li class ="loginbar"><a id="active_hover" href="chargeInfo.do?id=<%=custVo.getCus_id()%>" class="bar">포인트충전</a></li>
						<li class ="loginbar"><a href="logOut.do?id=<%=custVo.getCus_id()%>" class="bar">로그아웃</a></li>
					</ul>
				</div>
				<!-- loginbar after 끝 -->
				
			</div>
			<!-- header 끝 -->
			
			<!-- body 시작 -->
			<div class="body">
			
				<!-- wrapper 시작 -->
				<div id="wrapper">
					<h2>포인트충전</h2>
					<div class="sub_content">
						<img src="${pageContext.request.contextPath}/images/kakaopay.png" alt="Kakao Pay" style ="width : 85px;">
						<div class="txt_area">
							<p>결제요청 메시지 전송을 위해 아래 정보를 입력해주세요.</p>
						</div>
					</div>
				</div>
				<!-- wrapper 끝 -->
				
				<div class="body2">
					<div class="wrapper2">
						<div class="card-body bg-white mt-0 shadow">
			                <p class="card_body_title">카카오페이 충전 금액</p>
			                <label class="box-radio-input">
			                	<input type="radio" name="cp_item" value="5000">
			                	<span>5,000원</span>
			                </label>
			                <label class="box-radio-input">
				                <input type="radio" name="cp_item" value="10000">
				                <span>10,000원</span>
			                </label>
				            <label class="box-radio-input">
				                <input type="radio" name="cp_item" value="15000">
			               		<span>15,000원</span>
			                </label>
				            <label class="box-radio-input">
				                <input type="radio" name="cp_item" value="20000">
			                	<span>20,000원</span>
			                </label>
				            <label class="box-radio-input">
				                <input type="radio" name="cp_item" value="25000">
			                	<span>25,000원</span>
			                </label>
				            <label class="box-radio-input">
				                <input type="radio" name="cp_item" value="30000">
			                	<span>30,000원</span>
			                </label>
				            <label class="box-radio-input">
				                <input type="radio" name="cp_item" value="35000">
			                	<span>35,000원</span>
			                </label>
				            <label class="box-radio-input">
				                <input type="radio" name="cp_item" value="40000">
			               	 	<span>40,000원</span>
			                </label>
				            <label class="box-radio-input">
				                <input type="radio" name="cp_item" value="50000">
			                	<span>50,000원</span>
			                </label>
			                <p class="txt_notice">※ 카카오페이의 <strong>최소 충전금액은 5,000원</strong>이며,  <strong>최대 충전금액은 50,000원</strong>입니다. ※</p>
			                <div class="btn">
			                	<button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">
			                		<span>충 전 하 기</span>
			                	</button>
			                </div>
		 				</div>	
					</div>
				</div>
				
				
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