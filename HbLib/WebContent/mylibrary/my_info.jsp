<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
a.button {
  font-size: 12px;
  font-weight: 600;
  color: white;
  padding: 10px 10px 0px 10px;
  margin: 5px 5px 5px 5px;
  display: inline-block;
  float: left;
  text-decoration: none;
   height: 27px; 
  -webkit-border-radius: 5px; 
  -moz-border-radius: 5px; 
  border-radius: 5px; 
  background-color: #3a57af; 
  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
  box-shadow: 0 3px rgba(58,87,175,.75);
  transition: all 0.1s linear 0s; 
  top: 0px;
  position: relative;
}
a.button:hover {
  top: 3px;
  background-color:#2e458b;
  -webkit-box-shadow: none; 
  -moz-box-shadow: none; 
  box-shadow: none;
  
}
input[type=text],input[type=password]{
  height: 29px; 
  -webkit-border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
  -moz-border-radius: 0px 4px 4px 0px/0px 0px 4px 4px; 
  border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
  background-color: #fff; 
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  border: solid 1px #cbc9c9;
  margin-left: -5px;
  margin-top: 8px; 
  padding-left: 10px;
}
h3 {
  font-size: 16px;
  font-weight: 300;
  color: #4c4c4c;
  text-align: center;
  padding-top: 10px;
  margin-bottom: 10px;
}
</style>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_03").css("background-color", "gray")
		$(".myinfoview tr:gt(0)").addClass("my_info_tr")
		$("#change_pwd").click(function(){
			if($("#pwd").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#pwd").focus();
			}else{
				var chk = confirm("비밀번호를 변경합니다.");
				if(chk){
					location.href="/HbLib/Controller?type=myupdate&id=<c:out value='${list.id }'/>"+"&pwd="+$("#pwd").val()+"&change=change_pwd";
				}else
					$("#pwd").focus();
				return;
			}
		});
		$("#change_email").click(function(){
			if($("#email").val()==""){
				alert("이메일을 입력해주세요");
				$("#email").focus();
			}else{
				var chk = confirm("이메일을 변경합니다.");
				if(chk){
					location.href="/HbLib/Controller?type=myupdate&id="+$("#id").val()+"&email="+$("#email").val()+"&change=change_email";
				}else
					$("#email").focus();
				return;
			}
		});
		$("#change_tel").click(function(){
			if($("#tel").val()==""){
				alert("전화번호를 입력해주세요");
				$("#tel").focus();
			}else{
				var chk = confirm("전화번호를 변경합니다.");
				if(chk){
					location.href="/HbLib/Controller?type=myupdate&id="+$("#id").val()+"&tel="+$("#tel").val()+"&change=change_tel";
				}else
					$("#tel").focus();
				return;
			}
		});
	});
	
</script>
</head>
<body>
<jsp:useBean id="user" scope="session" class="com.hb.mybatis.UsersVO" />
<jsp:setProperty property="*" name="user" />
<c:if test="${user.id==null }">
<script type="text/javascript">
alert("로그인해주세요")
history.go(-1)
</script>
</c:if>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆My Library > 개인정보</div>
				<div>
					<div align="left">
						<table class="myinfoview">
							<tr>
								<td width="100"><h3>아이디</h3></td>
								<td width="300"><input type="text" name="id" id="id" size="30" value="${list.id }" readonly/></td>
								<td></td>
							</tr>
							<tr>
								<td width="100"><h3>이름</h3></td>
								<td><input type="text" name="name" value="${list.name }" size="30" readonly /></td>
								<td></td>
							</tr>
							<tr>
								<td width="100"><h3>비밀번호</h3></td>
								<td><input type="password" name="pwd" size="30" id="pwd"/></td>
								<td width="120"><a href="#" id="change_pwd" class="button">비밀번호변경</a></td>
							</tr>
							<tr>
								<td><h3>생년월일</h3></td>
								<td><input type="text" name="jumin" size="30" value="${list.jumin }" readonly /></td>
								<td></td>
							</tr>
							<tr>
								<td width="100"><h3>이메일</h3></td>
								<td><input type="text" name="email" size="30" id="email" value="${list.email }"/></td>
								<td><a href="#" id="change_email" class="button">이메일변경</a></td>
							</tr>
							<tr>
								<td width="100"><h3>전화번호</h3></td>
								<td><input type="text" name="tel" size="30" id="tel" value="${list.tel }"/></td>
								<td><a href="#" id="change_tel" class="button">전화번호변경</a></td>
							</tr>
							<tr>
								<td width="100"><h3>주소</h3></td>
								<td><input type="text" name="addr" size="30" value="${list.addr }"/></td>
								<td><a href="#" class="button">주소변경</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>