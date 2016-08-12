<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Custom Login Form Styling</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="../css/style.css" />
		<script src="../js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>
			@import url(http://fonts.googleapis.com/css?family=Ubuntu:400,700);
			body {
				background: #563c55 url(../images/blurred.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}
			.container > header h1,
			.container > header h2 {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.7);
			}
		</style>
        <script type="text/javascript">
            function register(f){
                for (var i = 0; i < document.forms[0].elements.length; i++) {
                    if (document.forms[0].elements[i].value.trim() == "") {
                        alert(document.forms[0].elements[i].name + "이 비었습니다");
                        document.forms[0].elements[i].focus();
                        return;
                    }
                }

                var chk_id = duplicate_chk("r");
                var chk_pwd = pwd_check("r");

                if(chk_id){
                    if(chk_pwd){
                        alert("가입에 성공하셨습니다");
                        f.action = "register_ok.do";
                        f.submit();
                    } else {
                        alert("password 중복을 확인 바람");
                    }
                } else {
                    alert("id 중복을 확인 바람");
                }
            }

            function duplicate_chk(chk){

                var list = new Array();
                <c:forEach var="item" items="${list}">
                    list.push("${item.id}");
                </c:forEach>

                for(var i=0; i<list.length; i++){
                    if(list[i] == f.id.value){
                        alert("id 중복");
                        return false;
                    }
                }
                if(chk != "r")
                    alert("사용 가능합니다");

                return true;
            }

            function pwd_check(chk){
                if(f.pwd.value.length > 2){
                    if(f.pwd.value == f.pwd_chk.value){
                        if(chk != "r")
                            alert("사용 가능합니다");
                        return true;
                    } else {
                        alert("값이 다릅니다");
                        return false;
                    }
                } else {
                    alert("7자리 이상 필요");
                    return false;
                }
            }
            function back(){
            	history.back(-1);
            }
        </script>
    </head>
    <body>
			
			<section class="main">
				<form class="form-3" name="f">
				    <p class="clearfix">
				        <label for="login" class="login">ID</label>
				        <input type="text" name="id" class="login" placeholder="Username">
                        <input type="button" name="chk" class="login" value="check" onclick="duplicate_chk()">
				    </p>
				    <p class="clearfix">
				        <label for="password">비밀번호</label>
				        <input type="password" name="pwd" placeholder="Password"> 
				    </p>
                    <p class="clearfix">
				        <label for="password" class="password">비밀번호확인</label>
				        <input type="password" name="pwd_chk" class="password" placeholder="PwdCheck">
                        <input type="button" name="chk" class="password" value="check" onclick="pwd_check()">
				    </p>
                    <p class="clearfix">
				        <label for="name">Name</label>
				        <input type="text" name="name" placeholder="Password"> 
				    </p>
                    <p class="clearfix">
				        <label for="email">email</label>
				        <input type="text" name="email" placeholder="email"> 
				    </p>
				    <p class="clearfix">
				        <label for="age">나이</label>
				        <input type="text" name="age" placeholder="Age"> 
				    </p>
				    
				    <p class="clearfix">
				        <input type="button" value="Back" onclick="back()">
				    </p>
				    <p class="clearfix">
                        <input type="button" value="Register" onclick="register(this.form)">
				    </p>
				</form>​
			</section>
			
        </div>
    </body>
</html>