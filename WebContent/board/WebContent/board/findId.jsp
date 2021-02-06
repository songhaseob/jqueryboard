<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_joinmember.css">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">
 
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/memberreg.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>

<script>
$(function (){
	
	$("#btnJoin").on('click',function () {
		
		emailValue = $("#mail").val().trim();
		
		$.ajax({
			url : "/CFMS/FindId",
			type : "get",
			data : {
				"mail" : emailValue
			},
			success : function(res) {
				userid = res.sw;
				$(".error_next_boxmail").html(userid);
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status)
			},
			dataType : "json"
		})
	});
		
	 
})
</script>


<title>아이디 찾기</title>
</head>
<body>
	<div id="header">
	 	<div class="container">
			<a href="http://localhost/CFMS/mainPage.do#">
				<img src="../images/logo_yellow_back.png">
			</a>
			<div id="wrapper">
			<br>
			 
				<div id="content">
					<form id="joinform" class="form-horizontal">
						
						<div>
							<h3>
								<label for="pass1">이메일</label>
							</h3>
							<span class="box int_pass"> 
								<input type="text" id="mail" class="int int4" > 
							</span>
							<span style="text-align: right;" class="error_next_boxmail"></span>
						</div>
		
						<div class="btn_area">
							<button type="button" id="btnJoin">
								<span id="join">아이디찾기</span>
							</button>
						</div>
						 
						
					</form>
					
				</div>
				<!-- End content -->
	
				<div class="push"></div>	
				<div id="footer" class="fixed_footer">
					<p>Copyright ©gifti-ILJO Rights Reserved.</p>
				</div>
					
			</div>
			<!-- End wrapper -->
		</div>
		
	</div>
	<!-- End header -->
 
</body>
</html>