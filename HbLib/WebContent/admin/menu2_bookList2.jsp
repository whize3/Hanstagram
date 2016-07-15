<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/menuList.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="main.jsp"/>
	<!-- 전체 -->
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="img/icon_menu_book.jpg" class="img"/><h3>도서관리</h3><hr/></div>
			
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="menu2_bookList.jsp">도서 조회/추가</a></li>
					<li><span class="li-s">></span><a href="menu2_bookList2.jsp">희망 도서 조회</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>희망 도서 조회</h3>
			</div>
			<hr/>
			<div class="table-wrap">
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>번호</th>
							<th>제목</th>
							<th>위치</th>
							<th>출판사</th>
							<th>저자</th>
							<th>장르</th>
							<th>ISBN</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>d</td>
							<td>d</td>
							<td>d</td>
							<td>d</td>
							<td>d</td>
							<td>d</td>
							<td>d</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>