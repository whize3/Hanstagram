<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#login_img").click(
				function() {
					$.ajax({
						type : "post",
						url : "login.do",
						data : {"id" : $("#userID").val() , "pwd" : $("#password").val()},
						dataType : "json",
						success : function(data) {
							alert("로그인성공");
							location.href="loginok.do?id="+data[0]["id"];
						},
						error : function(request, status, error) {
							alert("request: " + request + " status: " + status
									+ " error: " + error);
						}
					});
				});
	});
		</script>
</head>
<body>
	<input id="userID" type="text" title="아이디" placeholder="아이디" />
	<input id="password" type="password" title="패스워드" placeholder="패스워드" />
	<img src="img/loginBtn.gif" alt="로그인" id="login_img" />
</body>
</html>