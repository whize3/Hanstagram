<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="../js/jquery-3.0.0.js"></script>
<script type="text/javascript">
$(function() {
	document.on("click",".login",function() {
		alert("로그인");
	})
});
	function login(){
		
		alert($("#password").val());
		alert($("#userID").val());		
		$.ajax({
			type : "get",
			url : "/HbLib/Controller",
			data :
				"type=login"+
				"&id="+$("#userID").val()+
				"&pwd="+$("#passwrod").val(),
			success: function(data) {
				if(data!=null){
					alert("로그인 성공ㅇㅇ!");	
				}						
			},
			error: function() {
				alert("실패ㅋ");
			}			
		});
	}
</script>
</head>
<body>
	<div class="loginSec">
		<h3>로그인</h3>
		<dl>
			<dt>
				<input name="userID" id="userID" type="text" title="아이디" placeholder="아이디"/> 
				<input name="password" id="password" type="password" title="패스워드" placeholder="패스워드"/>
			</dt>
			<dd>
				<img src="img/loginBtn.gif" alt="로그인" onclick="login()" />
			</dd>
			<hr align = "left" width="85%"/>
			<a href=""><strong>아이디, 패스워드 찾기</strong></a>/
	        <a href=""><strong>회원가입</strong></a>
	                	
	                
         				
		</dl>
	</div>
</body>
</html>