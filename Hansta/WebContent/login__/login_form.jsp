<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
        <script type="text/javascript">
            if("${result}" == "fail")
                alert("Login fail");
            
            function login(f){
                for (var i = 0; i < document.forms[0].elements.length; i++) {
                    if (document.forms[0].elements[i].value.trim() == "") {
                        alert(document.forms[0].elements[i].name + " is Empty");
                        document.forms[0].elements[i].focus();
                        return;
                    }
                }
                f.action = "login.do";
                f.submit();
            }

            function register(f){
                f.action = "register_view.do";
                f.submit();
            }
        </script>
    </head>
    <body>
			<section class="main">
				<form class="form-3">
				    <p class="clearfix">
				        <label for="login">ID</label>
				        <input type="text" name="id" placeholder="Username">
				    </p>
				    <p class="clearfix">
				        <label for="password">Password</label>
				        <input type="password" name="pwd" placeholder="Password"> 
				    </p>
				    <p class="clearfix">
                        <input type="button" value="Register" onclick="register(this.form)">
				    </p>
				    <p class="clearfix">
				        <input type="button" value="Sign in" onclick="login(this.form)">
				    </p>       
				</form>​
			</section>
        </div>
    </body>
</html>