<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="../css/menuList.css" type="text/css" rel="stylesheet">

</head>
<body>
<%@ include file="main.jsp" %>

<!-- users 세션 -->
<jsp:useBean id="uvo2" class="com.hb.mybatis.UsersVO" scope="session"/>
<jsp:setProperty property="*" name="uvo2"/>

<!-- book_draw 세션 -->
<jsp:useBean id="bdvo" class="java.util.ArrayList" scope="session"/>
<jsp:setProperty property="*" name="bdvo"/>

	<!-- 전체 --
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="../img/icon_menu_member.png" class="img"/><h3>회원관리</h3><hr/></div>
			
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="menu1_memberList.jsp">회원목록</a></li>
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
			<c:forEach var="k" items="${bdvo }">
			
				<a class="member-a">대출도서&nbsp;&nbsp;</a><a class="member-b">${k.bd_idx}권</a>
				<a class="member-a">예약도서&nbsp;&nbsp;</a><a class="member-b">0권</a>
				<a class="member-a">연체도서&nbsp;&nbsp;</a><a class="member-b">0권</a>
				<a class="member-a">연체료&nbsp;&nbsp;</a><a class="member-b">0권</a>
			
			</c:forEach>
			
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
							<th>반납예정일</th>
							<th>대출상태</th>
						</tr>
					</thead>
					<tbody>
						<%-- <c:forEach items="${memberonelist}" var="k">
							<tr>
								<td class="td_id">${k.id}</td>
								<td>${k.name}</td>
								<td>${k.jumin}</td>
								<td>${k.email}</td>
								<td>${k.tel}</td>
								<td>${k.addr}</td>
							</tr>
						</c:forEach> --%>
<%-- 						<c:forEach items="${bdvo}" var="k"> --%>
<!-- 							<tr> -->
<%-- 								<td>${k.bd_idx}</td> --%>
<%-- 								<td>${k.b_state}</td> --%>
<%-- 								<td>${k.b_num}</td> --%>
<%-- 								<td>${k.bd_date}</td> --%>
<%-- 								<td>${k.id}</td> --%>
<%-- 								<td>${k.bd_redate}</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
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
							<th>반납예정일</th>
							<th>대출상태</th>
						</tr>
					</thead>
					<tbody>
						<%-- <c:forEach items="${memberonelist}" var="k">
							<tr>
								<td class="td_id">${k.id}</td>
								<td>${k.name}</td>
								<td>${k.jumin}</td>
								<td>${k.email}</td>
								<td>${k.tel}</td>
								<td>${k.addr}</td>
							</tr>
						</c:forEach> --%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>