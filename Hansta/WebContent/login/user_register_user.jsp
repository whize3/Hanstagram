<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
		
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
				        <label for="Name">Name</label>
				        <input type="text" name="name" placeholder="Password"> 
				    </p>
				    
				    <p class="clearfix">
				        <label for="password">Password</label>
				        <input type="password" name="pwd" placeholder="Password"> 
				    </p>
                    <p class="clearfix">
				        <label for="password" class="password">PasswordCheck</label>
				        <input type="password" name="pwd_chk" class="password" placeholder="PwdCheck">
                        <input type="button" name="chk" class="password" value="check" onclick="pwd_check()">
				    </p>
                    
				    <p class="clearfix">
				        <label for="name">Age</label>
				        <input type="text" name="age" placeholder="Age"> 
				    </p>
                    <p class="clearfix">
				        <label for="email">email</label>
				        <input type="text" name="email" placeholder="email"> 
				    </p>
				    <!-- <p class="clearfix">
				        <label for="Profile_url">Profile_url</label>
				        <input type="text" name="profile_url" placeholder="Profile_url"> 
				    </p> -->
				    <p class="clearfix">
				        <input type="button" value="이전화면" onclick="back()">
				    </p>
				    <p class="clearfix">
                        <input type="button" value="가입" onclick="register(this.form)">
				    </p>
				</form>​
			</section>
			
        </div>
    </body>
</html>