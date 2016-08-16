<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	width: 109px;
    	font-size: 14px;
    	font-weight: bold;
	}
	.f_nametext{
		width: 300px;
		height: 22px;
		margin-bottom: 50px;
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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	/* function reset_go(f) {
		var id = document.getElementById("name").value; 
		if(id!=null){
			f.action="nameConfirm.do"; // 아이디 확인하기.
			f.submit();
		}else{
			alert("사용자 이름을 입력해주세요~");
		}
		
	} */
	$(function() {
		$(".f_button").click(function() {
			var id = $("input[name=id]").val();
			alert(id);
			if(id==null){				
				alert("사용자 이름을 입력해주세요~");
			}else{
				location.href="nameConfirm.do?id="+id;
			}
		});
	});
</script>
</head>
<body>
	
	<div class="header">
		<div class="h_home"><a href="login.jsp"><img src="img/pwd_home.PNG" style="height: 29px;"/></a></div>
		<div class="h_img"><a href="login.jsp"><img src="img/pwd_insta_logo.PNG" style="height: 29px;" /></a></div>
		<div class="h_login"><a href="login.jsp"><img src="img/pwd_login.PNG" style="height: 29px;" /></a></div>
	</div>
	<div class="bodywrap">
		<div class="top">
			<h1 style="color: #06365F;">비밀번호 재설정</h1>
			<p style="font-size: 14px;">Hanstagram 사용자 이름을 사용해서 비밀번호를 재설정할 수 있도록 도와 드리겠습니다</p>
			<hr/>
		</div>
		<div>
			<form>
				<label class="f_label">사용자 이름</label>
				<input type="text" name="id" class="f_nametext"/><br/>
				<input type="button" class="f_button" value="비밀번호 재설정"/>
<!-- 				<input type="button" class="f_button" value="비밀번호 재설정" onclick="reset_go(this.form)"/> -->
			</form>
		</div>
	</div>
</body>
</html>