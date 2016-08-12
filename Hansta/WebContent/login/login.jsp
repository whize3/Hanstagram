<%@page import="org.apache.cxf.transport.http.HTTPSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function loginsuccess(){
	alert("로그인중기다려주십시오.");
	location.href='index.do';
}
function loginCheck(){
	var param = "id" + "=" + $("#id").val() + "&" +"pw" + "="+ $("#pw").val();
	$.ajax({
		url : "/login.do",
		type : "GET",
		data : param,
		cache : false,
		async : false,
		dataType : "text",

		success : function(response) {								
			if(response=='1')
			{
				loginsuccess();
			}
			else
			{
				alert("아이디 또는 비번이 틀렸습니다. 다시 입력하세요.")
				return false;
			}	
			
			alert(check);
		},
		error : function(request, status, error) {
			if (request.status != '0') {
				alert("code : " + request.status + "\r\nmessage : "
						+ request.reponseText + "\r\nerror : " + error);
			}
		}

	});
}

</script>
</head>
<body>
	<form name="frm" id = "frm" action = "/session.do">
		<P align="center">
			<FONT size="6"><B>로그인 페이지</B></FONT>
		</P>
		<table border="0" align="center" cellspacing="1" bgcolor="PapayaWhip" width="300" height="150">
			<tr>
				<td colspan="2" bgcolor="PeachPuff" align="center" height="30"><b>로그인 확인</b></td>
			</tr>

			<tr align="center">
				<td bgcolor="PeachPuff" width="100">아이디</td>
				<td><input type="text" id="id" name="id" size="12" maxlength="12"></td>
			</tr>

			<tr align="center">
				<td bgcolor="PeachPuff">비밀번호</td>
				<td><input type="password" id="pw" name="pw" size="12" maxlength="12"></td>
			</tr>

			<tr>
				<td colspan="2" bgcolor="PeachPuff" align="center" height="30">
					<input type="button" value="로그인" onclick='loginCheck()'> 
					<input type="button" value="회원 가입" onclick="javascript:location.href='/membership.do';">
					<input type="button" value="비번찾기" onclick="javascript:location.href='/password_search.do';"> 
				</td>
			</tr>
		</table>
</body>
</html>
