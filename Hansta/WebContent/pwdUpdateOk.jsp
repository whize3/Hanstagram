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
    	width: 261px;
    	font-size: 14px;
    	font-weight: bold;
    	margin-bottom: 58px;
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
</style>
<script type="text/javascript">
	function login_go(f) {
		f.action="login.jsp";
		f.submit();
	}
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
				<label class="f_label">비밀번호가 성공적으로 바뀌었습니다.</label><br/>
				<input type="button" class="f_button" value="로그인" onclick="login_go(this.form)"/>
			</form>
		</div>
	</div>
</body>
</html>