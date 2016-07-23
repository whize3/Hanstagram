<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/main.css" type="text/css" rel="stylesheet">
</head>
<body>

	<div class="header">
		<nav class="navbar">
			<div class="container">
				<div class="navbar-header">
					<h2><a class="navbar-name" href="member.jsp">&nbsp;한빛도서관</a></h2>
				</div>
				<div class="navbar-side">
					<ul class="side-list">
						<li class="bar"><a href="/HbLib/index.jsp" style="color: #2A75C1">한빛도서관 홈페이지로 이동</a></li>
						<li class="bar"><a style="color: #A2A2A2">${admin.name}</a></li>
						<li class="bar"><a href="logout.jsp" style="color: red;">로그아웃</a></li>
					</ul>
				</div>
				<div class="navbar-menu">
					<ul class="menu-list">
						<span class="bar-f"></span>
						<li class="bar"><a href="/HbLib/Controller?type=a_memberlist"; style="margin-left: 20px">회원관리</a><span class="bar-s"></span></li>
						<li class="bar"><a href="/HbLib/Controller?type=a_booklist">도서관리</a><span class="bar-s"></span></li>
						<li class="bar"><a href="/HbLib/Controller?type=a_noticeList">게시판관리</a><span class="bar-s"></span></li>
						<li class="bar"><a href="/HbLib/Controller?type=admin_sdReserve">스터디룸관리</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>