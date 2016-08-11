<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
            if("${result}" == "fail")
                alert("Login fail");
            
            function login(f){
                for (var i = 0; i < document.forms[0].elements.length; i++) {
                    if (document.forms[0].elements[i].value.trim() == "") {
                        alert(document.forms[0].elements[i].name + " 입력해라");
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
                        <input type="button" value="회원가입" onclick="register(this.form)">
				    </p>
				    <p class="clearfix">
				        <input type="button" value="Login" onclick="login(this.form)">
				    </p>       
				</form>​
			</section>
        </div>
</body>
</html>