<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
					location.href="/HbLib/Controller?type=myupdate&id="+$("#id").val()+"&pwd="+$("#pwd").val()+"&change=change_pwd";
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
								<td width="100">아이디</td>
								<td width="300"><input type="text" name="id" id="id" size="30" value="${list.id }" readonly/></td>
								<td></td>
							</tr>
							<tr>
								<td width="100">이름</td>
								<td><input type="text" name="name" value="${list.name }" size="30" readonly /></td>
								<td></td>
							</tr>
							<tr>
								<td width="100">비밀번호</td>
								<td><input type="password" name="pwd" size="30" id="pwd"/></td>
								<td width="120"><input type="button" value="비밀번호변경" id="change_pwd" /></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" name="jumin" size="30" value="${list.jumin }" readonly /></td>
								<td></td>
							</tr>
							<tr>
								<td width="100">이메일</td>
								<td><input type="text" name="email" size="30" id="email" value="${list.email }"/></td>
								<td><input type="button" value="이메일변경" id="change_email" /></td>
							</tr>
							<tr>
								<td width="100">전화번호</td>
								<td><input type="text" name="tel" size="30" id="tel" value="${list.tel }"/></td>
								<td><input type="button" value="전화번호변경" id="change_tel" /></td>
							</tr>
							<tr>
								<td width="100">주소</td>
								<td><input type="text" name="addr" size="30" value="${list.addr }"/></td>
								<td><input type="button" value="주소변경" /></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>