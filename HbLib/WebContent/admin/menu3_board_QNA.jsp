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
			<div class="menu-header"><img src="img/icon_menu_book.jpg" class="img"/><h3>게시판 관리</h3><hr/></div>
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="menu3_board_Notice.jsp">공지사항</a></li>
					<li><span class="li-s">></span><a href="menu3_board_QNA.jsp">Q&A</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>Q&A</h3>
			</div>
			<hr/>
			<div class="table-wrap">
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>순번</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody>
						<tr>
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