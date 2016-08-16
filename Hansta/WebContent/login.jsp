<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wrap{
		display: table;
		width: 100%;
		text-align: center;
		position: relative;
	}
	.wrap2{
		width:480px;
		margin: 0 auto;
		margin-top: 106px;
	}
	.left{
		display: table-cell;
		width: 240px;
		vertical-align: middle;
	}
	.right{
		display: table-cell;
		border: 1px solid #EFEFEF;
		margin: 0;
		padding: 0;
		width: 240px;
	}

	/* .join_go{
		display:table-row;
		vertical-align : bottom;
		border: 1px solid #EFEFEF;
	} */
	.leftImg{
		width: 100%;
		text-align: center;
		/* padding-top: 60px; */
		display: table-cell;
		vertical-align: middle;
	}
	#leftImg{
		/* margin: 0 auto; */
		width: 100%;
		text-align: center;
	}
	.rigthImg{
		display: table-row;
		vertical-align: top;
	}
	.right_form{
		display: table-row;
		vertical-align: middle;
	}
	.loginBtn{
		width: 200px;
		height: 27px;
		background: #3897F0;
		border: none;
		cursor: pointer;
		border-radius: 3px;
		margin-bottom: 10px;
	}
	
	.right_wrap{
		margin-top: 90px;
		width: 292px;
	}
	.join_go{
		border: 1px solid #EFEFEF;
		font-size: 14px;
		margin-top: 47px;
	}
	#join_go{
		font-size: 14px;
	}
	#join_go>a{
		color: #38B1F5;
		cursor: pointer;
		text-decoration: none;
	}
	#username{
		margin-bottom: 6px;
		width: 195px;
		height: 21px;
	}
	#password{
		margin-bottom: 28px;
		width: 195px;
		height: 21px;
	}
	.pwd_div{
		position: relative;
	}
	.pwd_div>a{
		position: absolute;
		right: 50px;
    	top: -51px;
    	font-size: 12px;
    	text-decoration: none;
    	cursor: pointer;
    	color: #4F3580;
	}
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	$(".loginBtn").click(
			function() {
				$.ajax({
					type : "post",
					url : "login.do",
					data : {"id" : $("#username").val() , "pwd" : $("#password").val()},
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
</script>
</head>
<body>
	<div class="wrap">
		<div class="wrap2">
			<div class="left">
				<div class="leftImg">
					<img src="img/insta_login.PNG"  width="240px" height="372px"/>
				</div>
			</div>
			<div class="right">
				<div class="right_wrap">
					<div class="rigthImg">
						<img src="img/insta_logo.PNG"/>
					</div>
					<div class="right_form">
						<form>
							<input type="text" id="username" name="username" placeholder="사용자 이름"/>					
							<input type="password" id="password" name="password" placeholder="비밀번호"/>
							<div class="pwd_div">
								<a href="findpwd.jsp">비밀번호를 잊으셨나요?</a>
							</div>
							<input type="button" class="loginBtn" value="로그인"/>
						</form>
					</div>					
				</div>
				<div class="join_go">
					<p id="join_go">계정이 없으신가요? <a href="join.jsp">가입하기</a></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>