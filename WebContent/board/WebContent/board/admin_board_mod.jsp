<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
							String seq = (String)request.getParameter("seq");
						
%>
<!-- jQuery -->
<script  src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
Bootstrap 4
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
AdminLTE App
<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
AdminLTE for demo purposes
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
</body>
<script>

$(function(){
	$.ajax({
		url : '/CFMS/admin_board_select.do',
		type : 'post',
		data : {"seq" : <%=seq%>},
		dataType:'json',
		success : function(res){
			code = '<table class="table table-dark table-hover">';
			code +='<tr>'
			code +='<td>' + "번호" +'</td>'
			code +='<td>' + "제목" +'</td>'
			code +='<td>' + "내용" +'</td>'
			code +='<td>' + "날짜" +'</td>'
			code +='<td>' + "수정/삭제" +'</td>'
			code +='</tr>'
			
		$.each(res, function(i,v){
			if(v.classify == '공지사항'){
				code +='<tr>';
				code +='<td id="select">' + v.seq + '</td>';
				code +='<td>' + v.title + '</td>';
				code +='<td>' + v.cont + '</td>';
				code +='<td>' + v.date + '</td>';
				code +='<td>' + '<input type="submit" value="수정">' + '<input type="submit" value="삭제">' + '</td>'
				code +='<tr>';
			}
		})
		code +='</table>'
		$('.post').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
	
})
</script>
</html>