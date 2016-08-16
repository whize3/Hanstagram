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

	.join{
		display:table-row;
		vertical-align : bottom;
		border: 1px solid #EFEFEF;
	}
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
	.joinBtn{
		width: 200px;
		height: 27px;
		background: #3897F0;
		border: none;
		cursor: pointer;
		border-radius: 3px;
		margin-bottom: 10px;
	}
	.email{
		margin-bottom: 6px;
		width: 195px;
		height: 21px;
	}
	.name{
		margin-bottom: 6px;
		width: 195px;
		height: 21px;
	}
	.id{
		margin-bottom: 6px;
		width: 195px;
		height: 21px;
	}
	.age{
		margin-bottom: 6px;
		width: 195px;
		height: 21px;
	}
	.pwd{
		margin-bottom: 24px;
		width: 195px;
		height: 21px;
	}
	.right_wrap{
		margin-top: 35px;
		width: 292px;
	}
	.login_go{
		border: 1px solid #EFEFEF;
		font-size: 14px;
		margin-top: 24px;
	}
	#login_go{
		font-size: 14px;
	}
	#login_go>a{
		color: #38B1F5;
		cursor: pointer;
		text-decoration: none;
	}
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function join_go(f) {
		f.action="join.do";
		f.submit();
	}
/* 	$(function() {
		$(".joinBtn").click(function() {
			alert($(".email").val());
			if($(".email").val()==""||$(".name").val()==""||$(".id").val()==""||$(".age").val()==""||$(".email").val()==""||$(".pwd").val()==""){
				alert("회원 정보를 입력해주세요.")
			}else{
				alert("회원가입 완료");
				location.href="join.do";
			}
		});
	}); */
</script>
</head>
<body>
	<div class="wrap">
		<div class="wrap2">
			<div class="left">
				<div class="leftImg">
					<img src="img/insta_login.PNG" id="leftImg" width="240px" height="372px"/>
				</div>
			</div>
			<div class="right">
				<div class="right_wrap">
					<div class="rigthImg">
						<img src="img/insta_logo.PNG"/>
					</div>
					<div class="right_form">
						<form>
							<div>
								<input type="text" class="email" name="email" placeholder="이메일"/>
								<input type="text" class="name" name="name" placeholder="성명"/>
								<input type="text" class="id" name="id" placeholder="사용자 이름"/>
								<input type="text" class="age" name="age" placeholder="사용자 나이"/>
								<input type="password" class="pwd" name="pwd" placeholder="비밀번호"/>								
							<div>
								<input type="button" class="joinBtn" value="가입" onclick="join_go(this.form)"/>
							</div>
						</form>
					</div>
				</div>
				<div class="login_go">
					<p id="login_go">계정이 있으신가요? <a href="login.jsp">로그인</a></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>