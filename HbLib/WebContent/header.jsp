<%@page import="com.hb.mybatis.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>한빛도서관</title>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="/HbLib/css/header.css">
<script type="text/javascript" src="../js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	function logout_go() {
		$.ajax({
			type : "get",
			url : "/HbLib/Controller",
			data : "type=logout",						
			dataType : "text",
			success : function(data) {
				alert("로그아웃 되셨습니다.");
				parent.document.location.href=data;
			},
			error : function(request, status, error) {
				alert("request: " + request + " status: " + status
						+ " error: " + error);
			}
		});
	
	}
	$(function(){
		$("#name").click(function(){
			$(".bubble").toggle();
			console.log("버블")
		});
		
		$(document).on("click",function(){
			if($(this).attr("id")!="name"){
				$(".bubble").hide();
			}
		});
		$("#searchBtn").click(function(){
			location.href="/HbLib/Controller?type=mainsearch&keyword="+$("#keyword").val()+"&option=main";
		});
	});
</script>
</head>
<body>
<header>
<jsp:useBean id="user" class="com.hb.mybatis.UsersVO" scope="session"/>
	<div class="topArea">
		<div class="wrap">
			<div id="topMenu">
				<%
		request.setCharacterEncoding("utf-8");
		String id = null;
		String name = null;
		UsersVO uvo =null;
		try {
			uvo= (UsersVO) session.getAttribute("user");
			id = uvo.getId();
			name=uvo.getName();
		} catch (Exception e) {

		}

		if (id == null) {%>
				<a href="/HbLib/headerlogin.jsp">로그인</a>
				
				<a href="join.jsp">회원가입</a>
				&nbsp;|&nbsp;<%}else{%> 
				<div class="bubble" >
					<span><img src="/HbLib/img/myInfo.gif"></span>
					<div>
						<p id="topName">${user.name}님<span><input type="button" value="로그아웃" onclick="logout_go()"></span></p>
						<p id="id">${user.id}님</p>
						<p>대출도서 ${user.draw}권</p>
						<p>예약도서 ${user.reserve}권</p>
						<p>연체도서 ${user.overdue}권</p>
					</div>
				</div>
				
				<span id="profile"><img src="/HbLib/img/myInfo.gif"></span>
				<span id="name"><%=name %></span>님&nbsp;|&nbsp;
				<a href="#" onclick="logout_go()">로그아웃</a>
				<%}%>
				
			</div>
		</div>
	</div>
	<div class="wrap">
	
		<div class="logoArea"><a href="/HbLib/index.jsp"><img src="/HbLib/img/logo.png"></a></div>
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
						<li><a href="/HbLib/search/search_all.jsp">전체자료검색</a></li>
						<li><a href="/HbLib/Controller?type=rank">인기도서</a></li>
						<li><a href="/HbLib/Controller?type=newbook">신규도서</a></li>
					</ul>
				</div>
			</li>
			<li class="firstMenu"><a href="#">서비스 이용</a>
				<div class="subMenuWrap">
					<ul id="subMenu1">
						<li><a href="/HbLib/studyroom/studyRoomMain.jsp">스터디룸 안내</a></li>
						<li><a href="/HbLib/Controller?type=getRoom">스터디룸 예약</a></li>
						<li><a href="/HbLib/service/ser_apply.jsp">도서구입 신청</a></li>
						<li><a href="/HbLib/Controller?type=applylist&id=${user.id}">도서구입 신청현황</a></li>
						<li><a href="/HbLib/Controller?type=yul">열람실 현황</a></li>
					</ul>
				</div>
			</li>
			<li class="firstMenu"><a href="#">My Library</a>
				<div class="subMenuWrap">
					<ul id="subMenu2">
						<li><a href="/HbLib/Controller?type=draw&id=${user.id }">대출현황</a></li>
						<li><a href="/HbLib/Controller?type=reserve&id=${user.id }">예약확인</a></li>
						<li><a href="/HbLib/Controller?type=myinfo&id=${user.id }">개인정보</a></li>
						<li><a href="/HbLib/Controller?type=comment&id=${user.id }">나의서평</a></li>
						<li><a href="/HbLib/Controller?type=history&id=${user.id }">대출반납이력</a></li>
					</ul>
				</div>
			</li>
			<li class="firstMenu"><a href="#">도서관 안내</a>
				<div class="subMenuWrap">
					<ul id="subMenu3">
						<li><a href="/HbLib/guide/libinfo1.jsp">도서관이용안내</a></li>
						<li><a href="/HbLib/guide/libinfo2.jsp">층별안내</a></li>
						<li><a href="/HbLib/guide/libinfo3.jsp">대출/반납안내</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</nav>
</header>

</body>
</html>