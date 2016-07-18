<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.login{
		text-align : center;
		margin: 0 auto;
		width: 500px;
		height: 500px;
		border: 1px solid black;
	}
 	.in{
 	    padding: 100px;
		text-align: center;
		display: inline-block;
	}

</style>
<script type="text/javascript">
	function login_go(f) {
		f.action="/HbLib/Controller";
		f.submit();
	}
</script>
</head>
<body>
	<div class="login">
		<div class="in">
			<h1>&nbsp;&nbsp;&nbsp;한빛도서관&nbsp;&nbsp;&nbsp;</h1>
			<hr/>
			<h3 align="left"><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGIN</i></h3>
			<form>	
			<input type="text" name="id" placeholder="아이디"/><br/>
			<input type="password" name="pwd" placeholder="비밀번호"/><br/>
			<input type="button" value="로그인" style="width: 165px;" onclick="login_go(this.form)"/>			
			<input type="hidden" name="type" value="login"/>
			</form>
		</div>
	</div>
</body>
</html>