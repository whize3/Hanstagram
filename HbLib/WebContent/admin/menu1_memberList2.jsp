<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">

</head>
<body>
<%@ include file="main.jsp" %>

<!-- users 세션 -->
<jsp:useBean id="uvo2" class="com.hb.mybatis.UsersVO" scope="session"/>
<jsp:setProperty property="*" name="uvo2"/>
	
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="/HbLib/img/icon_menu_member.png" class="img"/><h3>회원관리</h3><hr/></div>
			
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_memberlist">회원목록</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>회원정보</h3>
			</div>
			<hr/>
			<div class="member-name">
				<a style="font-size: 5">이름 : ${uvo2.name}</a>
			</div>
			
			<div class="table-wrap">
				<h3>대출현황</h3>
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>책번호</th>
							<th>제목</th>
							<th>저자</th>
							<th>ISBN</th>
							<th>대출일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty bdvo}">
						<c:forEach items="${bdvo}" var="k">
							<tr>
								<td>${k.b_num}</td>
								<td>${k.b_subject}</td>
								<td>${k.publisher}</td>
								<td>${k.isbn}</td>
								<td>${k.bd_date.substring(0,10)}</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty bdvo}">
							<tr><td colspan="5" style="text-align: center;">대출 내역이 없습니다.</td></tr>
						</c:if>
					</tbody>
				</table>
				
				<h3>예약현황</h3>
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>책번호</th>
							<th>제목</th>
							<th>저자</th>
							<th>ISBN</th>
							<th>대출일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty reserveList}">
						<c:forEach items="${reserveList}" var="k">
							<tr>
								<td>${k.b_num}</td>
								<td>${k.b_subject}</td>
								<td>${k.publisher}</td>
								<td>${k.isbn}</td>
								<td>${k.bd_date.substring(0,10)}</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty reserveList}">
							<tr><td colspan="5" style="text-align: center;">예약 내역이 없습니다.</td></tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>