<%@page import="com.hb.mybatis.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>한빛도서관</title>
<link rel="stylesheet" href="/HbLib/css/header.css">
</head>
<body>
<header>
	<div class="topArea">
		<div class="wrap">
			<div id="topMenu">
				<%
		request.setCharacterEncoding("utf-8");
		String id = null;
		String name = null;
		try {
			UsersVO uvo = (UsersVO) session.getAttribute("user");
			id = uvo.getId();
			System.out.println("header에서 id:" +id);
		} catch (Exception e) {

		}

		if (id == null) {%>
				<a href="#">로그인</a>
				&nbsp;|&nbsp;<%}else{%> 
				<a href="/HbLib/Controller?type=logout">로그아웃</a>
				&nbsp;|&nbsp;<%}%>
				
				<a href="#">회원가입</a>
			</div>
		</div>
	</div>
	<jsp:useBean id="user" scope="session" class="com.hb.mybatis.UsersVO" />
<jsp:setProperty property="*" name="user" />
	<div class="wrap">
		<div class="logoArea"><img src="/HbLib/img/logo.png"></div>
		<div id="searchBar">
			<div id="searchArea">
				<form action="">
					<input type="text" id="keyword" placeholder="검색할 도서정보를 입력하세요">
					<input type="button" id="searchBtn">
				</form>
			</div>
		</div>
	</div>
	<nav>
		<ul id="mainNav">
			<li class="firstMenu"><a href="#">자료검색</a>
				<div class="subMenuWrap">
					<ul id="subMenu0">
						<a href="#"><li>전체자료검색</li></a>
						<a href="#"><li>비도서</li></a>
						<a href="#"><li>학위논문</li></a>
						<a href="#"><li>인기도서</li></a>
					</ul>
				</div>
			</li>
			<li class="firstMenu"><a href="#">서비스 이용</a>
				<div class="subMenuWrap">
					<ul id="subMenu1">
						<a href="#"><li>스터디룸 안내</li></a>
						<a href="#"><li>스터디룸 예약</li></a>
						<a href="#"><li>도서구입 신청</li></a>
						<a href="#"><li>도서구입 신청현황</li></a>
						<a href="#"><li>열람실 현황</li></a>
					</ul>
				</div>
			</li>
			<li class="firstMenu"><a href="#">My Library</a>
				<div class="subMenuWrap">
					<ul id="subMenu2">
						<li><a href="/HbLib/Controller?type=draw&id=${user.id }">대출현황</a></li>
						<li><a href="/HbLib/Controller?type=reserve&id=aaa">예약확인</a></li>
						<li><a href="/HbLib/Controller?type=myinfo&id=aaa">개인정보</a></li>
						<li><a href="/HbLib/Controller?type=comment&id=aaa">나의서평</a></li>
						<li><a href="/HbLib/Controller?type=history&id=aaa">대출반납이력</a></li>
					</ul>
				</div>
			</li>
			<li class="firstMenu"><a href="#">도서관 안내</a>
				<div class="subMenuWrap">
					<ul id="subMenu3">
						<a href="#"><li>냥냥냥</li></a>
						<a href="#"><li>냥냥냥</li></a>
						<a href="#"><li>냥냥냥</li></a>
						<a href="#"><li>냥냥냥</li></a>
					</ul>
				</div>
			</li>
		</ul>
	</nav>
</header>
</body>
</html>