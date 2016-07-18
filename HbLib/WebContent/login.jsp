<%@page import="com.hb.mybatis.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#login_img").click(
				function() {
					$.ajax({
						type : "get",
						url : "/HbLib/Controller",
						data : "type=login" + "&id=" + $("#userID").val()
								+ "&pwd=" + $("#password").val(),
						dataType : "text",
						success : function(data) {
							if (data != "fail") {
								alert("로그인 성공ㅇㅇ!");
								parent.document.location.reload();
							} else {
								alert("아이디, 비번 틀림");
							}
						},
						error : function(request, status, error) {
							alert("request: " + request + " status: " + status
									+ " error: " + error);
						}
					});
				});
		$("#logout_img").click(function() {
			alert("로그아웃 function 진입")
			location.href = "/HbLib/Controller?type=logout"
		});
	});
</script>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String id = null;

		try {
			UsersVO uvo = (UsersVO) session.getAttribute("user");
			id = uvo.getId();

		} catch (Exception e) {

		}

		if (id == null) {
	%>
	<div class="loginSec">
		<h3>로그인</h3>
		<dl>
			<dt>
				<input id="userID" type="text" title="아이디" placeholder="아이디" /> <input
					id="password" type="password" title="패스워드" placeholder="패스워드" />
			</dt>
			<dd>
				<img src="img/loginBtn.gif" alt="로그인" id="login_img"
					onclick="login_go()" />

			</dd>
			<hr align="left" width="85%" />
			<a href=""><strong>아이디, 패스워드 찾기</strong></a>/
			<a href=""><strong>회원가입</strong></a>
		</dl>
	</div>
	<%
		} else {
	%>
	<div class="loginSec">
		<jsp:useBean id="user" scope="session" class="com.hb.mybatis.UsersVO" />
		<jsp:setProperty property="*" name="user" />
		<h3>개인정보</h3>
		<dl>
			<dt>
				<label>${user.name}</label><br />
				<ul>
					<li>대출도서 ${user.draw}권</li>
					<li>예약 도서 ${user.reserve}권</li>
					<li>연체 도서 ${user.overdue}권</li>
				</ul>
			</dt>
			<dd>
				<img src="img/logoutBtn.jpg" alt="로그아웃" id="logout_img" />

			</dd>
			<hr align="left" width="85%" />
		</dl>
	</div>
	<div class="myaccount">

		<div class="myaccount-header">
			<h3 class="myaccount-title ng-binding">
				${user.name}<span class="myaccount-id ng-binding">2009313924
					(학부생)</span>
			</h3>

		</div>
		<div class="myaccount-text">
			<ul>
				<li><a href="#/mylibrary/charges">대출도서 <span
						class="ng-binding">0</span>권
				</a></li>
				<li><a href="#/mylibrary/holds">예약도서 <span
						class="ng-binding">0</span>권
				</a></li>
			</ul>
			<ul>
				<li><a href="#/mylibrary/charges">연체도서 <span
						class="ng-binding">0</span>권
				</a></li>
				<li><a href="#/mylibrary/fines">연 체 료 <span
						class="ng-binding">0</span>원
				</a></li>
			</ul>
		</div>
		<div class="myaccount-icon">
			<ul>
				<li><a href="#/mylibrary/dashboard" class="myaccount-icon01"><span>Dashboard</span></a></li>
				<li><a href="#/mylibrary/mynotice" class="myaccount-icon02"><span>개인알림</span></a></li>
				<li><a href="#/mylibrary/myinfo" class="myaccount-icon03"><span>개인정보수정</span></a></li>
			</ul>
		</div>
	</div>
	<%
		}
	%>

</body>
</html>