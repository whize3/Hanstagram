<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.header{
		/* margin: 0 auto; */
		position:fixed;
		top: 0;
    	right: 0;
    	left: 0;
    	/* z-index:10000; */
		height: 30px;
		background-color: #34638B;
		border: 1px solid #547C9F;
	}

	.h_home{
		position: absolute;
		left: 0;
		border: 1px solid #547C9F;
		margin-left: 150px;
		cursor: pointer;
	}
	.h_img{
		position: absolute;
		left: 45%;
		border: 1px solid #547C9F;
		cursor: pointer;
	}
	.h_login{
		position: absolute;
		right: 0;
		top: 5px;
		border: 1px solid #547C9F;
		margin-right: 150px;
		cursor: pointer;
	}
	.bodywrap{
		position: absolute;
		top:60px;
		padding: 15px 0 15px;
    	margin: 0 0 0 -1px;
    	margin-left: 150px;
	}
	.top{
		padding-bottom: 20px;
	}
	.f_label{
		display: inline-block;
    	width: 209px;
    	font-size: 14px;
    	font-weight: bold;
    	margin-bottom: 10px;
	}
	.f_nametext{
		width: 300px;
		height: 22px;
		margin-bottom: 50px;
	}
	.f_password1{
		width: 300px;
		height: 22px;
		margin-bottom: 10px;
	}
	.f_password2{
		width: 300px;
		height: 22px;
		margin-bottom: 34px;
	}
	.f_button{
		border-radius: 3px;
		border : 1px solid #509C71;
		background-color: #509C71;
		color: white;
		width: 120px;
		height:30px;
		cursor: pointer;
	}
	.h_login>a{
		color: white;
		font-size: 14px;
	}
</style>
 <jsp:useBean id="uvo" class="spring.project.db.UsersVO" />
 <jsp:setProperty property="*" name="uvo"/> 
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
/* 	function pwd_reset_go(f) {
		alert("Dd");
		var id = ${uvo.id};
		var pwd1 = document.getElementById("pwd1").value; 
		var pwd2 = document.getElementById("pwd2").value;
		alert(id+" "+pwd1);
		if(pwd1==pwd2){
			alert(pwd1+" "+id);
			f.action="pwdUpdate.do?id="+id+"&pwd1="+pwd1;
			f.submit();
		}else{
			alert("비밀번호가 틀립니다.");
		}
	} */
	$(function() {
		$(".f_button").click(function() {
			var pwd1 = $("input[name=pwd1]").val();
			var pwd2 = $("input[name=pwd2]").val();
			var id = $("input[name=id]").val();
			if(pwd1==pwd2){				
				location.href="pwdUpdate.do?pwd1="+pwd1+"&id="+id;
			}else{
				alert("비밀번호가 틀립니다.");
			}
		});
	});
</script>
</head>
<body>
	<div class="header">
		<div class="h_home"><a href="login.jsp"><img src="img/pwd_home.PNG" style="height: 29px;"/></a></div>
		<div class="h_img"><a href="login.jsp"><img src="img/pwd_insta_logo.PNG" style="height: 29px;" /></a></div>
		<div class="h_login"><a href="login.jsp">${uvo.id}</a></div>
	</div>
	<div class="bodywrap">
		<div class="top">
			<h1 style="color: #06365F;">Instagram</h1>
			<hr/>
		</div>
		<div>
			<form>
				<label class="f_label">New password: </label>
				<input type="password" name="pwd1" class="f_password1"/><br/>
				<label class="f_label">New password confirmation: </label>
				<input type="password" name="pwd2" class="f_password2"/><br/>
				<input type="button" class="f_button" value="비밀번호 재설정"/>
				<input type="hidden" name="id" value="${uvo.id}" />
<!-- 				<input type="button" class="f_button" value="비밀번호 재설정" onclick="pwd_reset_go(this.form)"/> -->
			</form>
		</div>
	</div>
</body>
</html>